import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/scan/qrcode_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final qrCodeController = Get.put(QRCodeController(), permanent: false);

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      print(scanData);
      controller.pauseCamera();
      qrCodeController.qrCode.value = scanData.code!;
      await qrCodeController.searchPetByQRCode(scanData.code!);
      // controller.resumeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              if (qrCodeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (qrCodeController.petData.isNotEmpty) {
                return Column(
                  children: [
                    const Text('Pet Data:'),
                    Text('Name: ${qrCodeController.petData['name']}'),
                    Text('sex: ${qrCodeController.petData['species']}'),
                    // Add other pet data fields here
                  ],
                );
              } else {
                return const Center(child: Text('Scan a QR code'));
              }
            }),
          )
        ],
      ),
    );
  }
}

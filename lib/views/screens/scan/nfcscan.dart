import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/scan/nfc_controller.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NFCScannerPage extends StatefulWidget {
  const NFCScannerPage({super.key});

  @override
  _NFCScannerPageState createState() => _NFCScannerPageState();
}

class _NFCScannerPageState extends State<NFCScannerPage> {
  final nfcController = Get.put(NFCController(), permanent: false);

  void _startNFCScan() async {
    try {
      NFCTag tag = await FlutterNfcKit.poll();
      nfcController.nfcTag.value = tag.id;
      await nfcController.searchPetByNFC();
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: "NFC scan failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan NFC Tag'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: ElevatedButton(
                onPressed: _startNFCScan,
                child: const Text('Scan NFC Tag'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              if (nfcController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (nfcController.petData.isNotEmpty) {
                return Column(
                  children: [
                    const Text('Pet Data:'),
                    Text('Name: ${nfcController.petData['name']}'),
                    Text('Species: ${nfcController.petData['species']}'),
                    // Add other pet data fields here
                  ],
                );
              } else {
                return const Center(child: Text('Scan an NFC tag'));
              }
            }),
          )
        ],
      ),
    );
  }
}

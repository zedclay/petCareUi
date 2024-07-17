import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.64),
        Offset(size.width * 0.50, size.height * 0.14),
        [Color.fromARGB(255, 25, 26, 25), const Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4991667, size.height * 0.1414286);
    path_0.lineTo(size.width * 0.6233333, size.height * 0.2828571);
    path_0.lineTo(size.width * 0.6241667, size.height * 0.4985714);
    path_0.lineTo(size.width * 0.4991667, size.height * 0.6414286);
    path_0.lineTo(size.width * 0.3733333, size.height * 0.4985714);
    path_0.lineTo(size.width * 0.3741667, size.height * 0.2842857);
    path_0.lineTo(size.width * 0.4991667, size.height * 0.1414286);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

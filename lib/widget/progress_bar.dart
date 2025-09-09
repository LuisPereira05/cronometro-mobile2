import 'package:flutter/material.dart';

class FlatTipCircularProgressBar extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  FlatTipCircularProgressBar({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeCap = StrokeCap.butt
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final double sweepAngle = 2 * 3.14159265359 * progress;

    canvas.drawArc(rect, -3.14159265359 / 2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

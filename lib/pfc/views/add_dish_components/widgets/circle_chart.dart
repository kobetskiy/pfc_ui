import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleChart extends CustomPainter {
  final double orangeProgress;
  final double blueProgress;
  final double redProgress;

  CircleChart({
    required this.orangeProgress,
    required this.blueProgress,
    required this.redProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;
    double strokeWidth = 8.sp;

    Paint bluePaint = Paint()
      ..color = CustomColors.primaryBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint redPaint = Paint()
      ..color = CustomColors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint orangePaint = Paint()
      ..color = CustomColors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    double startAngle = -pi / 2;

    double blueSweepAngle = 2 * pi * blueProgress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      blueSweepAngle,
      false,
      bluePaint,
    );

    startAngle += blueSweepAngle;

    double redSweepAngle = 2 * pi * redProgress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      redSweepAngle,
      false,
      redPaint,
    );

    startAngle += redSweepAngle;

    double orangeSweepAngle = 2 * pi * orangeProgress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      orangeSweepAngle,
      false,
      orangePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircleChart oldDelegate) {
    return oldDelegate.orangeProgress != orangeProgress ||
        oldDelegate.blueProgress != blueProgress ||
        oldDelegate.redProgress != redProgress;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 10.sp
      ..style = PaintingStyle.stroke;

    Paint progressPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10.sp
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double progress = 0.1.sp;

    Offset center = Offset(size.width / 2.sp - 5.sp, size.height / 2.sp);
    double radius = min(size.width, size.height) + 10.sp;

    canvas.drawCircle(center, radius, backgroundPaint);

    double arcAngle = 2.sp * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2.sp,
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LinearProgressPainter extends StatelessWidget {
  const LinearProgressPainter({
    super.key,
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.sp,
          height: 5.sp,
          decoration: BoxDecoration(
            color: CustomColors.primaryBlack.withOpacity(0.09.sp),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Stack(
            children: [
              Container(
                width: 100.sp * progress,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

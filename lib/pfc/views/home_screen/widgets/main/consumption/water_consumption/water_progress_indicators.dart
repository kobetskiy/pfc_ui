// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CircularWaterProgressPainter extends CustomPainter {
//   final double progress;

//   CircularWaterProgressPainter({required this.progress});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint backgroundPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..strokeWidth = 30.sp
//       ..style = PaintingStyle.stroke;

//     Paint waterPaint = Paint()
//       ..color = const Color(0xFF61C5F9)
//       ..strokeWidth = 30.sp
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     Offset center = Offset(size.width / 2.sp - 5.sp, size.height / 2.sp - 3.sp);
//     double radius = min(size.width, size.height) + 30.sp;

//     canvas.drawCircle(center, radius, backgroundPaint);

//     double arcAngle = 2 * pi * progress;

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       pi * 1.06,
//       -arcAngle,
//       false,
//       waterPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';

class WaveProgressPainter extends CustomPainter {
  final double progress;

  WaveProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // draw small wave
    double p = progress;
    double n = 4.3;
    double amp = 1.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / size.width * 2 * pi * n) + (2 * pi) + pi * 1) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    // draw big wave
    Paint wave1Paint = Paint()..color = const Color(0xFF61C5F9);
    n = 2.2;
    amp = 10.0 * size.height / 180;

    path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i, baseHeight + sin((i / size.width * 2 * pi * n) + (2 * pi)) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave1Paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

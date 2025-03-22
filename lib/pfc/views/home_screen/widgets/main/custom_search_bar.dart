import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: CustomPaint(
        painter: ArcPainter(),
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              SizedBox(height: 30.sp),
              const HomeSearchTextField(
                prefixPath: AppIcons.search,
                prefixColor: CustomColors.primaryBlue,
                suffixPath: AppIcons.microphone,
                suffixColor: CustomColors.primaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomColors.primaryWhite
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(size.width / 2, 0, 0, size.height * 0.5);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

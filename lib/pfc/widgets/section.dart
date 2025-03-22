import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: CustomColors.primaryWhite,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: child,
    );
  }
}

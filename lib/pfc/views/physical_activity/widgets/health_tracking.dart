import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthTrackingImage extends StatelessWidget {
  const HealthTrackingImage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 0),
              spreadRadius: -5,
              color: CustomColors.primaryBlack.withOpacity(0.13),
            ),
          ],
        ),
        child: Image.asset(
          AppIcons.healthTracking,
          width: 60.sp,
          height: 60.sp,
        ),
      ),
    );
  }
}
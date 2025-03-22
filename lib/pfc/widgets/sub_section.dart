import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubSection extends StatelessWidget {
  const SubSection({
    super.key,
    required this.child,
    this.isBorderShown = false,
    this.padding, this.onTap,
  });

  final bool? isBorderShown;
  final Widget child;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: CustomColors.lightlightGrey,
          borderRadius: BorderRadius.circular(10.sp),
          border: isBorderShown == true
              ? Border.all(color: CustomColors.primaryBlue.withOpacity(0.1.sp))
              : null,
        ),
        child: child,
      ),
    );
  }
}

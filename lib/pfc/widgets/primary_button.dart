import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.height,
    this.padding,
  })  : isSmall = false,
        isDanger = false;

  const PrimaryButton.small({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.height,
    this.padding,
  })  : isSmall = true,
        isDanger = false;

  const PrimaryButton.danger({
    super.key,
    required this.child,
    this.onPressed,
    this.height,
    this.padding,
  })  : isSmall = false,
        isDanger = true,
        backgroundColor = null;

  final Widget? child;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool isSmall;
  final bool isDanger;
  final EdgeInsetsGeometry? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    ButtonStyle style;

    if (isDanger) {
      style = OutlinedButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: isSmall ? 2.sp : 10.sp,
              horizontal: 20.sp,
            ),
        textStyle: Theme.of(context).textTheme.titleSmall,
        side: const BorderSide(color: Colors.red),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isSmall ? 5.sp : 10.sp),
        ),
      );
    } else {
      style = ElevatedButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: isSmall ? 2.sp : 10.sp,
              horizontal: 20.sp,
            ),
        textStyle: Theme.of(context).textTheme.titleSmall,
        backgroundColor: backgroundColor ?? CustomColors.primaryBlue,
        foregroundColor: CustomColors.primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isSmall ? 5.sp : 10.sp),
        ),
      );
    }

    return SizedBox(
      height: isSmall ? 30.sp : height ?? 39.sp,
      width: isSmall ? 109.sp : MediaQuery.sizeOf(context).width,
      child: isDanger
          ? OutlinedButton(onPressed: onPressed, style: style, child: child)
          : ElevatedButton(onPressed: onPressed, style: style, child: child),
    );
  }
}

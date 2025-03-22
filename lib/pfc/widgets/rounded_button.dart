import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.iconPath,
    this.scale,
    this.onTap,
    this.color,
  });

  final String? iconPath;
  final Color? color;
  final double? scale;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp * (scale ?? 1)),
        decoration: BoxDecoration(
          color: CustomColors.mediumGrey,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Image.asset(
          iconPath ?? AppIcons.add,
          width: 15.sp * (scale ?? 1),
          height: 15.sp * (scale ?? 1),
          color: color,
        ),
      ),
    );
  }
}

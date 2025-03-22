import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddedDishTile extends StatelessWidget {
  const AddedDishTile({
    super.key,
    required this.title,
    this.subtitleText,
    this.trailing,
    this.showCheckIcon,
    this.subtitleWidget,
  });

  final String title;
  final String? subtitleText;
  final Widget? subtitleWidget;
  final bool? showCheckIcon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SubSection(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(width: 10.sp),
                  showCheckIcon ?? true
                      ? Image.asset(AppIcons.checkColoredGreen,
                          width: 16.sp, height: 16.sp)
                      : const SizedBox.shrink(),
                ],
              ),
              subtitleWidget != null
                  ? SizedBox(height: 5.sp)
                  : const SizedBox.shrink(),
              subtitleWidget ??
                  (subtitleText != null
                      ? Text(
                          subtitleText!,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColors.lightGrey),
                        )
                      : const SizedBox.shrink())
            ],
          ),
          const Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

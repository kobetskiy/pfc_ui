import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumptionInfo extends StatelessWidget {
  const ConsumptionInfo({
    super.key,
    required this.topTitle,
    required this.topSubtitle,
    required this.bottomTitle,
    required this.bottomSubtitle,
  });

  final String topTitle;
  final String topSubtitle;
  final String bottomTitle;
  final String bottomSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.sp),
        Text(
          topTitle,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: CustomColors.lightGrey,
              ),
        ),
        Text(
          topSubtitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        SizedBox(height: 10.sp),
        Text(
          bottomTitle,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: CustomColors.lightGrey,
              ),
        ),
        Text(
          bottomSubtitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}

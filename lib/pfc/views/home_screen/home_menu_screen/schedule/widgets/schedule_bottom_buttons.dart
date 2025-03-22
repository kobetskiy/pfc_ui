import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleBottomButtons extends StatelessWidget {
  const ScheduleBottomButtons({
    super.key,
    required this.onDangerButtonPressed,
    required this.onPrimaryButtonPressed,
  });

  final void Function()? onDangerButtonPressed;
  final void Function()? onPrimaryButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Section(
        padding: EdgeInsets.fromLTRB(16.sp, 10.sp, 16.sp, 40.sp),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButton.danger(
                onPressed: onDangerButtonPressed,
                child: const Text(''),
              ),
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: PrimaryButton(
                onPressed: onPrimaryButtonPressed,
                child: const Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

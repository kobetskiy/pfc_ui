import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelTitle extends StatelessWidget {
  const ChannelTitle({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'Все',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: CustomColors.primaryBlue,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

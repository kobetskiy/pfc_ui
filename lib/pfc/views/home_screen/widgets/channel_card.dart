import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SubSection(
      child: Column(
        children: [
          Image.asset(imagePath, width: 70.sp, height: 70.sp),
          SizedBox(height: 5.sp),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.lightGrey),
          ),
          SizedBox(height: 10.sp),
          PrimaryButton.small(
            onPressed: onPressed,
            child: Text(
              'Перейти',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: CustomColors.primaryWhite,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

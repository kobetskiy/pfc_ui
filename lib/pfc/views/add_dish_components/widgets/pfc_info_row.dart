import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget.dart';

class PFCInfoRow extends StatelessWidget {
  const PFCInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 70.sp,
          height: 70.sp,
          child: CustomPaint(
            painter: CircleChart(
              blueProgress: 0.3,
              orangeProgress: 0.45,
              redProgress: 0.25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '137',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(height: 1.1),
                ),
                Text(
                  'ккал',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(height: 1.1),
                ),
              ],
            ),
          ),
        ),
        const _PFCInfoText(
          percent: 0.45,
          gramms: 78,
          title: 'Белки',
          color: CustomColors.orange,
        ),
        const _PFCInfoText(
          percent: 0.25,
          gramms: 54,
          title: ' Жири',
          color: CustomColors.red,
        ),
        const _PFCInfoText(
          percent: 0.3,
          gramms: 60,
          title: 'Углеводы',
          color: CustomColors.primaryBlue,
        ),
      ],
    );
  }
}

class _PFCInfoText extends StatelessWidget {
  const _PFCInfoText({
    required this.percent,
    required this.gramms,
    required this.title,
    required this.color,
  });

  final double percent;
  final int gramms;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          percent * 100 == (percent * 100).round()
              ? '${(percent * 100).round()}%'
              : '${(percent * 100).toStringAsFixed(1)}%',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
        ),
        Text('$gramms г', style: Theme.of(context).textTheme.titleLarge),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: CustomColors.lightGrey),
        ),
      ],
    );
  }
}

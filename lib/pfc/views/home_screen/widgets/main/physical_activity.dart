import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/physical_activity/physical_activity_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhysicalActivity extends StatelessWidget {
  const PhysicalActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          SubSection(
            onTap: () async => await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const PhysicalActivityBottomSheet(),
            ),
            child: const Column(
              children: [
                _MainInfo(),
                Divider(color: CustomColors.mediumGrey),
                _TotalResult(),
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          const SubSection(child: _Exercises())
        ],
      ),
    );
  }
}

class _Exercises extends StatelessWidget {
  const _Exercises();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppIcons.exercises, width: 42.sp, height: 42.sp),
        SizedBox(width: 15.sp),
        Text(
          'Тренировка',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        const RoundedButton(iconPath: AppIcons.arrowForward)
      ],
    );
  }
}

class _MainInfo extends StatelessWidget {
  const _MainInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppIcons.physicalActivity, width: 42.sp, height: 42.sp),
        SizedBox(width: 15.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Физическая активность',
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              'Плавание, Бег.',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: CustomColors.lightGrey,
                  ),
            ),
          ],
        ),
        const Spacer(),
        const RoundedButton()
      ],
    );
  }
}

class _TotalResult extends StatelessWidget {
  const _TotalResult();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Всего: 233 кал • 1ч 12м',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: CustomColors.lightGrey,
            ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile_home_section/medications_notification/midication_notification_bottom_sheet.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          SizedBox(height: 10.sp),
          const _PersonalInfo(),
          const Divider(color: CustomColors.lightlightGrey),
          const _Parameters(),
          SizedBox(height: 10.sp),
          PrimaryButton(
            onPressed: () => context.router.push(const BuyPremiumRoute()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Стать Premium',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: CustomColors.primaryWhite,
                      ),
                ),
                SizedBox(width: 5.sp),
                Image.asset(AppIcons.crown, width: 15.sp, height: 15.sp)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Parameters extends StatelessWidget {
  const _Parameters();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 51.sp,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          _card(theme: theme, title: '80 кг', subtitle: 'Вес'),
          const SizedBox(width: 11),
          _card(theme: theme, title: '175 см', subtitle: 'Рост'),
          const SizedBox(width: 11),
          _card(theme: theme, title: '22 года', subtitle: 'Возраст'),
        ],
      ),
    );
  }

  Container _card({
    required ThemeData theme,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 100,
      height: 51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: CustomColors.lightlightGrey,
        border: Border.all(
          color: CustomColors.primaryBlue.withOpacity(0.1.sp),
          width: 1.sp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            Text(
              subtitle,
              style: theme.textTheme.displaySmall!.copyWith(
                color: CustomColors.lightGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.profilePhoto, width: 50.sp, height: 50.sp),
        SizedBox(width: 15.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mya Hudson', style: theme.textTheme.titleMedium),
            Text(
              'Цель: сбросить вес',
              style: theme.textTheme.titleMedium!
                  .copyWith(color: CustomColors.lightGrey),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () async => await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const MidicationNotificationBottomSheet(),
              ),
              child: Image.asset(AppIcons.book, width: 16.sp, height: 20.sp),
            ),
            SizedBox(width: 10.sp),
            GestureDetector(
              onTap: () => context.router.push(const DiseasesRoute()),
              child:
                  Image.asset(AppIcons.settings, width: 20.sp, height: 20.sp),
            ),
          ],
        )
      ],
    );
  }
}

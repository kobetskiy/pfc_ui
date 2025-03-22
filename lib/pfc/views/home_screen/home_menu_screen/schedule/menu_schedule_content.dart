import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScheduleContent extends StatelessWidget {
  const MenuScheduleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.sp),
        Column(
          children: [
            Section(
              child: SubSection(
                onTap: () => context.router.push(const MyScheduleRoute()),
                child: const _Tile(
                  imagePath: AppIcons.eggRounded,
                  title: 'Мое расписание',
                  subtitle: 'Меню на август',
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Section(
              child: SubSection(
                onTap: () => context.router.push(
                  const DaysScheduleRoute(),
                ),
                child: const _Tile(
                  imagePath: AppIcons.scheduleRounded,
                  title: 'Расписание',
                  subtitle:
                      'Оставьте заявку, и мы составим персональное меню специально для Вас!',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath, width: 42.sp, height: 42.sp),
        SizedBox(width: 15.sp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: CustomColors.lightGrey,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.sp),
        const RoundedButton(iconPath: AppIcons.arrowForward),
      ],
    );
  }
}

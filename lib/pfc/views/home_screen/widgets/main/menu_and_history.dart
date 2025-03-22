import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuAndHistory extends StatelessWidget {
  const MenuAndHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          const SubSection(child: _History()),
          SizedBox(height: 10.sp),
          SubSection(
            child: const _Menu(),
            onTap: () => context.router.push(const HomeMenuRoute()),
          ),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return const _Tile(
      imagePath: AppIcons.menuColored,
      title: 'Меню',
      subtitle: 'Создайте или посмотрите свое меню на месяц.',
    );
  }
}

class _History extends StatelessWidget {
  const _History();

  @override
  Widget build(BuildContext context) {
    return _Tile(
      imagePath: AppIcons.historyColored,
      title: 'История',
      subtitle:
          'Посмотрите историю веса, приема пищи, тренировок и потребления б.ж.у.',
      onTap: () {},
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final void Function()? onTap;

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
        RoundedButton(iconPath: AppIcons.arrowForward, onTap: onTap),
      ],
    );
  }
}

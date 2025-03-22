import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/widgets/reordable_subsection.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_schedule_dish_bottom_sheet.dart';
import 'widgets/schedule_bottom_buttons.dart';

@RoutePage()
class MealsScheduleScreen extends StatelessWidget {
  const MealsScheduleScreen({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    final dishesCountList = ['3', '2', '1', '5'];
    final subtitlesList = ['Завтрак', 'Обед', 'Перекус', 'Ужин'];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    const _AppBar(),
                  ],
                  body: Column(
                    children: [
                      SizedBox(height: 10.sp),
                      Section(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 16.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 20.sp),
                            ),
                            SizedBox(height: 10.sp),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return ReorderableSubSection(
                                  onTap: () => context.router.push(
                                    DishesScheduleRoute(
                                      day: day,
                                      mealName: subtitlesList[index],
                                    ),
                                  ),
                                  title: dishesCountList[index] == '1'
                                      ? '1 блюдо'
                                      : '${dishesCountList[index]} блюда',
                                  subtitle: subtitlesList[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.sp),
                            ),
                            SizedBox(height: 10.sp),
                            AddSomethingRow(
                              onTap: () async => await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) =>
                                    const CreateScheduleDishBottomSheet(),
                              ),
                              title: 'Добавить новый прием пищи',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ScheduleBottomButtons(
                  onDangerButtonPressed: () {},
                  onPrimaryButtonPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: 'Мое расписание',
      leading: IconButton(
        onPressed: context.router.maybePop,
        icon: Image.asset(
          AppIcons.arrowBack,
          width: 20.sp,
          height: 20.sp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppIcons.copy,
            width: 20.sp,
            height: 20.sp,
          ),
        )
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_schedule_dish_bottom_sheet.dart';
import 'widgets/schedule_bottom_buttons.dart';

@RoutePage()
class DishesScheduleScreen extends StatelessWidget {
  const DishesScheduleScreen(
      {super.key, required this.day, required this.mealName});

  final String day;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    final titlesList = ['Яичница', 'Плов', 'Плов', 'Плов'];

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
                              '$day, $mealName',
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
                                return AddedDishTile(
                                  title: titlesList[index],
                                  subtitleText: '257 калл • 100 грамм ',
                                  trailing: Row(
                                    children: [
                                      Image.asset(
                                        AppIcons.edit,
                                        width: 20.sp,
                                        height: 20.sp,
                                      ),
                                      SizedBox(width: 10.sp),
                                      const RoundedButton(
                                        iconPath: AppIcons.close,
                                        color: CustomColors.lightGrey,
                                      )
                                    ],
                                  ),
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
                              title: 'Добавить блюдо',
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

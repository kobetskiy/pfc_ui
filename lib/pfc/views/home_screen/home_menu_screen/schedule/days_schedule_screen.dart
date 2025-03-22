import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/reordable_subsection.dart';
import 'widgets/schedule_bottom_buttons.dart';

@RoutePage()
class DaysScheduleScreen extends StatelessWidget {
  const DaysScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: CustomColors.lightlightGrey,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.lightGrey,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.sp,
        horizontal: 16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide.none,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    AppBarWidget(
                      title: 'Редактировать мое расписание',
                      leading: IconButton(
                        onPressed: context.router.maybePop,
                        icon: Image.asset(
                          AppIcons.arrowBack,
                          width: 20.sp,
                          height: 20.sp,
                        ),
                      ),
                    ),
                  ],
                  body: Column(
                    children: [
                      SizedBox(height: 10.sp),
                      Section(
                        child: Column(
                          children: [
                            const Text(''),
                            SizedBox(height: 6.sp),
                            TextField(decoration: inputDecoration)
                          ],
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Section(
                        child: Column(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ReorderableSubSection(
                                  onTap: () => context.router.push(
                                    MealsScheduleRoute(
                                      day: '${index + 1} день',
                                    ),
                                  ),
                                  title: '4 расписания приема пищи',
                                  subtitle: '${index + 1} день',
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.sp),
                            ),
                            SizedBox(height: 10.sp),
                            const AddSomethingRow(title: 'Добавить новый день')
                          ],
                        ),
                      )
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

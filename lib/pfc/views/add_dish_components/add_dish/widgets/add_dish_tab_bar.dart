import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/add_dish/tabs/first_schedule_tab.dart';
import 'package:flutter_app/pfc/views/add_dish_components/add_dish/tabs/tabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDishTabBar extends StatelessWidget {
  final TabController? tabController;

  const AddDishTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.sp),
          width: MediaQuery.sizeOf(context).width - 20.sp,
          height: 45,
          decoration: BoxDecoration(
            color: CustomColors.lightlightGrey,
            borderRadius: BorderRadius.circular(30.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: _TabBarIcons(tabController: tabController),
          ),
        ),
        Flexible(
          child: SizedBox(
            height: tabController!.index == 3 ? 450.sp : 200,
            child: TabBarView(
              controller: tabController,
              children: const [
                NotesTab(),
                FavoritesTab(),
                HistoryTab(),
                CountTabs(
                  title: 'Ваше расписание',
                  tabs: [
                    FirstScheduleTab(),
                    FirstScheduleTab(),
                    FirstScheduleTab(),
                    FirstScheduleTab(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TabBarIcons extends StatelessWidget {
  const _TabBarIcons({required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
          dividerColor: Colors.transparent,
    indicator: BoxDecoration(
      color: CustomColors.primaryWhite,
      borderRadius: BorderRadius.circular(50.sp),
    ),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
      indicatorPadding: EdgeInsets.symmetric(horizontal: -30.sp),
      controller: tabController,
      tabs: [
        Tab(
          icon: Image.asset(
            AppIcons.notes,
            width: 20.sp,
            height: 20.sp,
            color: tabController!.index == 0 ? Colors.black : Colors.grey,
          ),
        ),
        Tab(
          icon: Image.asset(
            AppIcons.favorites,
            width: 20.sp,
            height: 20.sp,
            color: tabController!.index == 1 ? Colors.black : Colors.grey,
          ),
        ),
        Tab(
          icon: Image.asset(
            AppIcons.history,
            width: 20.sp,
            height: 20.sp,
            color: tabController!.index == 2 ? Colors.black : Colors.grey,
          ),
        ),
        Tab(
          icon: Image.asset(
            AppIcons.schedule,
            width: 20.sp,
            height: 20.sp,
            color: tabController!.index == 3 ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}

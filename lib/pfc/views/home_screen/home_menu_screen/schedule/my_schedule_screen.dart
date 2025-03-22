import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/my_schedule_calendar_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  bool isNoNotificationsShown = true;

  void toggleWidgets() {
    isNoNotificationsShown = !isNoNotificationsShown;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                AppBarWidget(
                  title: 'Мое расписание',
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
                  if (isNoNotificationsShown) const _NoSchedule(),
                  if (!isNoNotificationsShown) const _ScheduleList(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Section(
                padding: EdgeInsets.fromLTRB(16.sp, 10.sp, 16.sp, 40.sp),
                child: Row(
                  children: [
                    !isNoNotificationsShown
                        ? Expanded(
                            child: PrimaryButton.danger(
                              onPressed: toggleWidgets,
                              child: const Text(''),
                            ),
                          )
                        : const SizedBox.shrink(),
                    !isNoNotificationsShown
                        ? SizedBox(width: 10.sp)
                        : const SizedBox.shrink(),
                    Expanded(
                      child: PrimaryButton(
                        onPressed:
                            isNoNotificationsShown ? toggleWidgets : () {},
                        child: const Text(''),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoSchedule extends StatelessWidget {
  const _NoSchedule();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 100.sp),
          Image.asset(
            AppImages.empty,
            width: 180.sp,
            height: 130.sp,
          ),
          SizedBox(height: 20.sp),
          Text(
            'У вас нет расписании',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: CustomColors.lightGrey, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.sp),
        Section(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppIcons.arrowBack, width: 18.sp, height: 18.sp),
              GestureDetector(
                onTap: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const MyScheduleCalendarBottomSheet(),
                ),
                child: Row(
                  children: [
                    Image.asset(AppIcons.calendar, width: 16.sp, height: 16.sp),
                    SizedBox(width: 5.sp),
                    Text(
                      '1 день',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Image.asset(
                AppIcons.arrowForward,
                width: 16.sp,
                height: 16.sp,
                color: CustomColors.primaryBlack,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.sp),
        Section(
          padding: EdgeInsets.only(top: 10.sp),
          child: Column(
            children: [
              SizedBox(
                height: 380.sp,
                child: CountTabs(
                  title: 'Завтрак',
                  tabs: List.generate(4, (index) => const _Tab()),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                child: const AddSomethingRow(title: 'Добавить блюдо'),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab();

  @override
  Widget build(BuildContext context) {
    final titlesList = ['Яичница', 'Плов', 'Плов', 'Плов'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => AddedDishTile(
            title: titlesList[index],
            subtitleText: '257 калл • 100 грамм',
            trailing: Row(
              children: [
                Image.asset(AppIcons.edit, width: 20.sp, height: 20.sp),
                SizedBox(width: 10.sp),
                const RoundedButton(),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10.sp),
        ),
      ],
    );
  }
}

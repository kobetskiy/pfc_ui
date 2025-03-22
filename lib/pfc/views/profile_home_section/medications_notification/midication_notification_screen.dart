import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_app/pfc/views/profile_home_section/medications_notification/widgets/week_calendar.dart';
import 'package:flutter_app/pfc/widgets/app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'set_notification_bottom_sheet.dart';

@RoutePage()
class MidicationNotificationScreen extends StatefulWidget {
  const MidicationNotificationScreen({super.key});

  @override
  State<MidicationNotificationScreen> createState() =>
      _MidicationNotificationScreenState();
}

class _MidicationNotificationScreenState
    extends State<MidicationNotificationScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isDaySelected = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, __) => [
            AppBarWidget(
              leading: IconButton(
                onPressed: () => context.router.popUntilRouteWithPath('/'),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
          body: Column(
            children: [
              SizedBox(height: 10.sp),
              Section(
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Column(
                        children: [
                          Weekcalendar(
                            focusedDay: _focusedDay,
                            selectedDay: _selectedDay,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                                isDaySelected = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Text(
                      'Среда • 18 августа 2024 г.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              isDaySelected
                  ? const _NotificationList()
                  : const _NoNotifications(),
              const Expanded(child: SizedBox.shrink()),
              Section(
                child: SizedBox(
                  height: 60.sp,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40.sp),
                      Text(
                        '3 уведомления',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () async => await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) =>
                              const SetNotificationBottomSheet(),
                        ),
                        child: Image.asset(AppIcons.editColored,
                            width: 24.sp, height: 24.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NoNotifications extends StatelessWidget {
  const _NoNotifications();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 50.sp),
          Image.asset(
            AppImages.empty,
            width: 180.sp,
            height: 130.sp,
          ),
          SizedBox(height: 20.sp),
          Text(
            'У вас нет уведомлений',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: CustomColors.lightGrey, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList();

  @override
  Widget build(BuildContext context) {
    return Section(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '16:00',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: CustomColors.lightGrey,
                        ),
                  ),
                  Text(
                    'Выпить антигриппин',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(AppIcons.arrowForward, width: 20.sp, height: 20.sp),
            ],
          );
        },
        separatorBuilder: (_, __) => const Divider(
          color: CustomColors.lightlightGrey,
        ),
      ),
    );
  }
}

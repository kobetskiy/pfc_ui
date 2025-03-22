import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/views/physical_activity/automatic_tracking/automatic_tracking_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/health_tracking.dart';

class PhysicalActivityBottomSheet extends StatelessWidget {
  const PhysicalActivityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.96,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Физическая нагрузка',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SearchTextField(),
              SizedBox(height: 10.sp),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              const _AutomaticTracking(),
              SizedBox(height: 10.sp),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              const _LatestActivities(),
              SizedBox(height: 10.sp),
              Container(
                height: 40.sp,
                width: MediaQuery.sizeOf(context).width,
                color: CustomColors.lightlightGrey,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.sp, top: 14.sp),
                  child: Text(
                    'A',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activity promoting video game',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '-257 калл • 30 минут',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: CustomColors.lightGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _LatestActivities extends StatelessWidget {
  const _LatestActivities();

  @override
  Widget build(BuildContext context) {
    final simpleTileTitle = ['7 - минутная тренировка', 'Aquabike'];
    final simpleTileSubtitle = ['-257 калл • 30 минут', '-318 калл • 30 минут'];
    final appleTileTitle = ['Ходьба', 'Энергия активности'];
    final appleTileSubtitle = ['-318 калл • 3917 шаги', '-318 калл • 30 мин'];

    final subtitleStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.lightGrey);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Последние',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.sp),
          SizedBox(
            height: 150.sp,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (_, index) => AddedDishTile(
                showCheckIcon: false,
                title: simpleTileTitle[index],
                subtitleText: simpleTileSubtitle[index],
                trailing: const RoundedButton(
                  iconPath: AppIcons.close,
                  color: CustomColors.lightGrey,
                ),
              ),
              separatorBuilder: (_, __) => SizedBox(height: 10.sp),
            ),
          ),
          SizedBox(
            height: 190.sp,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (_, index) => AddedDishTile(
                showCheckIcon: false,
                title: appleTileTitle[index],
                subtitleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Контроль через', style: subtitleStyle),
                        SizedBox(width: 5.sp),
                        Image.asset(AppIcons.apple, width: 8.sp, height: 13.sp),
                        SizedBox(width: 5.sp),
                        Text('Health', style: subtitleStyle)
                      ],
                    ),
                    Text(appleTileSubtitle[index], style: subtitleStyle),
                  ],
                ),
                trailing: Row(
                  children: [
                    Image.asset(
                      AppIcons.phoneColored,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                    SizedBox(width: 10.sp),
                    const RoundedButton(
                      iconPath: AppIcons.close,
                      color: CustomColors.lightGrey,
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => SizedBox(height: 10.sp),
            ),
          ),
          const Divider(color: CustomColors.lightlightGrey),
          Center(
            child: Text(
              'Общий: 585 калл • 1 час.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}

class _AutomaticTracking extends StatelessWidget {
  const _AutomaticTracking();

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Автоматическое отслеживание',
            style: titleSmall!.copyWith(color: CustomColors.lightGrey),
          ),
          SizedBox(width: 10.sp),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HealthTrackingImage(
                onTap: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AutomaticTrackingBottomSheet(),
                ),
              ),
              Text('Здоровье', style: titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: inputDecoration.copyWith(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.sp),
                  child: Image.asset(
                    AppIcons.search,
                    color: CustomColors.lightGrey,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 37.sp,
                  maxWidth: 37.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.sp),
          SubSection(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset(
              AppIcons.microphone,
              color: CustomColors.primaryBlack,
              width: 20.sp,
              height: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}

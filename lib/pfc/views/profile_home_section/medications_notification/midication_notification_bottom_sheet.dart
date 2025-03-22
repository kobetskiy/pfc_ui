import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MidicationNotificationBottomSheet extends StatelessWidget {
  const MidicationNotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          onBackButtonPressed: () => context.router.popUntilRouteWithPath('/'),
          title: 'Уведомлении о лекарствах',
          child: Column(
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: const MonthCalendar(),
              ),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(
                  onPressed: () {
                    context.router.push(const MidicationNotificationRoute());
                  },
                  child: const Text(''),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

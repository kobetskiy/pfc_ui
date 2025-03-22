import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/physical_activity/widgets/health_tracking.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AutomaticTrackingBottomSheet extends StatelessWidget {
  const AutomaticTrackingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.59,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Автоматическое отслеживание',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              const _ControlAutomatically(),
              SizedBox(height: 10.sp),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              Column(
                children: [
                  const _SwitchTile(title: 'Экспортировать данные о здоровье'),
                  Divider(height: 16.sp, color: CustomColors.lightlightGrey),
                  const _SwitchTile(title: 'Импортировать вес'),
                ],
              ),
              SizedBox(height: 10.sp),
              Container(
                height: MediaQuery.sizeOf(context).height,
                color: CustomColors.lightlightGrey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                    vertical: 6.sp,
                  ),
                  child: Text(
                    'Используйте встроенные возможности своего iPhone для автоматического контроля вашей физически активности за день.',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: CustomColors.lightGrey),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _SwitchTile extends StatefulWidget {
  const _SwitchTile({required this.title});

  final String title;

  @override
  State<_SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<_SwitchTile> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          FlutterSwitch(
            width: 60.sp,
            height: 30.sp,
            activeColor: CustomColors.primaryBlue,
            inactiveColor: CustomColors.lightGrey,
            toggleSize: 27.sp,
            padding: 3.sp,
            value: switchValue,
            onToggle: (value) {
              switchValue = value;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}

class _ControlAutomatically extends StatelessWidget {
  const _ControlAutomatically();

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HealthTrackingImage(),
              Padding(
                padding: EdgeInsets.only(top: 5.sp, left: 10.sp),
                child: Text(
                  'Контролируйте автоматически',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'контролирует вашу физическую активность через ',
                    style: titleSmall),
                TextSpan(
                  text: 'iPhone',
                  style: titleSmall!.copyWith(
                      fontFamily: 'AbhayaLibre', fontWeight: FontWeight.w400),
                ),
                TextSpan(text: ' и ', style: titleSmall),
                TextSpan(
                    text: 'Apple Watch',
                    style: titleSmall.copyWith(fontFamily: 'AbhayaLibre')),
                TextSpan(
                    text:
                        ', анализирует ее, чтобы предоставить более точную обратную связь и совет.',
                    style: titleSmall),
              ],
            ),
          ),
          SizedBox(height: 16.sp),
          PrimaryButton(onPressed: () {}, child: const Text('')),
        ],
      ),
    );
  }
}

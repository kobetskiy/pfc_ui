import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetNotificationBottomSheet extends StatefulWidget {
  const SetNotificationBottomSheet({super.key});

  @override
  State<SetNotificationBottomSheet> createState() =>
      _SetNotificationBottomSheetState();
}

class _SetNotificationBottomSheetState
    extends State<SetNotificationBottomSheet> {
  String? _timeValue;
  String? _repeatValue;
  String? _reminderValue;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      expand: false,
      builder: (context, scrollController) {
        final inputDecoration = InputDecoration(
          filled: true,
          fillColor: CustomColors.lightlightGrey,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: CustomColors.lightGrey,
          ),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.sp,
            horizontal: 16.sp,
          ),
        );
        return BottomSheetWidget(
          scrollController: scrollController,
          title: "Календарь",
          child: Column(
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: TextField(
                  decoration: inputDecoration,
                ),
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: CustomDropDownTextField(
                  title: 'Время',
                  selectedValue: _timeValue,
                  onChanged: (value) {
                    _timeValue = value;
                    setState(() {});
                  },
                  items: const [
                    DropdownMenuItem(value: '17:00', child: Text('17:00')),
                    DropdownMenuItem(value: '18:00', child: Text('18:00')),
                    DropdownMenuItem(value: '19:00', child: Text('19:00')),
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: CustomDropDownTextField(
                  title: 'Повтор',
                  selectedValue: _repeatValue,
                  onChanged: (value) {
                    _repeatValue = value;
                    setState(() {});
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Никогда',
                      child: Text('Никогда'),
                    ),
                    DropdownMenuItem(
                      value: 'Каждый день',
                      child: Text('Каждый день'),
                    ),
                    DropdownMenuItem(
                      value: 'Каждую неделю',
                      child: Text('Каждую неделю'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: CustomDropDownTextField(
                  title: 'Напоминание',
                  selectedValue: _reminderValue,
                  onChanged: (value) {
                    _reminderValue = value;
                    setState(() {});
                  },
                  items: const [
                    DropdownMenuItem(
                        value: 'За 5 минут', child: Text('За 5 минут')),
                    DropdownMenuItem(value: 'Нет', child: Text('Нет')),
                  ],
                ),
              ),
              SizedBox(height: 30.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: TextField(
                    decoration: inputDecoration.copyWith(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30.sp, horizontal: 16),
                )),
              ),
              SizedBox(height: 10.sp),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(onPressed: () {}, child: const Text('')),
              ),
            ],
          ),
        );
      },
    );
  }
}

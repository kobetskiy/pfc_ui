import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  final String title;
  final String? selectedValue;
  final void Function(String? value) onChanged;
  final List<DropdownMenuItem<String>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: CustomColors.lightlightGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: AlignmentDirectional.centerEnd,
              value: selectedValue,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CustomColors.lightGrey),
              hint: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(''),
              ),
              items: items,
              onChanged: onChanged,
              icon: Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: Image.asset(
                  AppIcons.arrowDown,
                  width: 16.sp,
                  height: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishPFC extends StatefulWidget {
  const DishPFC({super.key});

  @override
  State<DishPFC> createState() => _DishPFCState();
}

class _DishPFCState extends State<DishPFC> {
  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
      child: Column(
        children: [
          const _PortionInputFields(),
          SizedBox(height: 16.sp),
          const PFCInfoRow(),
        ],
      ),
    );
  }
}

class _PortionInputFields extends StatelessWidget {
  const _PortionInputFields();

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
    return Row(
      children: [
        SizedBox(
          width: 70.sp,
          child: TextField(
            decoration: inputDecoration.copyWith(
              contentPadding: EdgeInsets.symmetric(vertical: 12.sp),
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
            controller: TextEditingController(text: '100'),
          ),
        ),
        SizedBox(width: 10.sp),
        Expanded(
          child: TextField(
            decoration: inputDecoration.copyWith(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.sp,
                horizontal: 16.sp,
              ),
            ),
            style: Theme.of(context).textTheme.titleMedium,
            controller: TextEditingController(text: 'Грамм'),
          ),
        ),
      ],
    );
  }
}

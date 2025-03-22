import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateScheduleDishBottomSheet extends StatelessWidget {
  const CreateScheduleDishBottomSheet({super.key});

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
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Создать новый прием пищи',
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
                SizedBox(height: 16.sp),
                const Text(''),
                SizedBox(height: 6.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: TextField(decoration: inputDecoration),
                ),
                SizedBox(height: 26.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: PrimaryButton(onPressed: () {}, child: const Text('')),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

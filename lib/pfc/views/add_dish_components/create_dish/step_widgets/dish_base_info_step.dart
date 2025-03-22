import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/create_dish/cooking_way_bottom_sheet/cooking_way_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishBaseInfoStep extends StatelessWidget {
  const DishBaseInfoStep({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BaseInfoTextFields(),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text(
            'Фото блюда',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.lightGrey),
          ),
        ),
        SizedBox(height: 6.sp),
        const DishPhotosList(photoPathsList: []),
        SizedBox(height: 30.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: PrimaryButton(
            onPressed: onPressed,
            child: const Text(''),
          ),
        ),
      ],
    );
  }
}

class _BaseInfoTextFields extends StatelessWidget {
  const _BaseInfoTextFields();

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.lightGrey);
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.sp),
          Text(
            '1. Базовая информация',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 16.sp),
          Text('', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(decoration: inputDecoration),
          SizedBox(height: 10.sp),
          Text('', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(minLines: 4, maxLines: 6, decoration: inputDecoration),
          SizedBox(height: 10.sp),
          Text('', style: titleTextStyle),
          SizedBox(height: 6.sp),
          SubSection(
            onTap: () async => await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const CookingWayBottomSheet(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                Image.asset(AppIcons.arrowForward, width: 20.sp, height: 20.sp),
              ],
            ),
          )
        ],
      ),
    );
  }
}

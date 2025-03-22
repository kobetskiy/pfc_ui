import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_app/pfc/constants/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishPhotosList extends StatelessWidget {
  const DishPhotosList({
    super.key,
    required this.photoPathsList,
    this.isPhotoDismissible,
    this.width,
    this.height,
  });

  final List<String?> photoPathsList;
  final bool? isPhotoDismissible;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100.sp,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          width: width ?? 100.sp,
          height: height ?? 100.sp,
          decoration: BoxDecoration(
            color: CustomColors.lightlightGrey,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: _cardContent(index),
        ),
        separatorBuilder: (_, __) => SizedBox(width: 10.sp),
      ),
    );
  }

  Widget _cardContent(int index) {
    if (index < photoPathsList.length) {
      return Stack(
        children: [
          Image.asset(photoPathsList[index]!),
          isPhotoDismissible ?? true
              ? Positioned(
                  right: 6.sp,
                  top: 6.sp,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryBlue,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Image.asset(
                      AppIcons.close,
                      width: 8.sp,
                      height: 8.sp,
                      color: CustomColors.primaryWhite,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
    } else {
      return Center(
        child: Image.asset(AppIcons.camera, width: 30.sp, height: 30.sp),
      );
    }
  }
}

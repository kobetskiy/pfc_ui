import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/dish_photos_list.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: оптимизировать под разные виджеты, а не под конкретные
class DishDescription extends StatelessWidget {
  const DishDescription({
    super.key,
    required this.title,
    this.showCheckIcon,
    this.subtitle,
    this.imagesPaths,
    this.onShareTap,
    this.showAdditions,
    this.checkIconColor,
  });

  final String title;
  final String? subtitle;
  final bool? showCheckIcon;
  final bool? showAdditions;
  final Color? checkIconColor;
  final List<String>? imagesPaths;
  final void Function()? onShareTap;

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: _Title(
                title: title,
                showCheckIcon: showCheckIcon,
                onShareTap: onShareTap,
                checkIconColor: checkIconColor),
          ),
          SizedBox(height: 10.sp),
          DishPhotosList(
            photoPathsList: imagesPaths ?? AppImages.pilafList,
            isPhotoDismissible: false,
            width: 90.sp,
            height: 90.sp,
          ),
          SizedBox(height: 10.sp),
          _DishInformation(subtitle: subtitle, showAdditions: showAdditions),
        ],
      ),
    );
  }
}

class _DishInformation extends StatelessWidget {
  const _DishInformation({required this.subtitle, required this.showAdditions});

  final String? subtitle;
  final bool? showAdditions;

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle ??
                'Плов — блюдо восточной кухни, основу которого составляет варёный рис (в исключительных случаях — другая крупа или мелкие макаронные изделия)',
            style: titleSmall,
          ),
          SizedBox(height: 10.sp),
          showAdditions ?? true
              ? RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Тип приготовления: ',
                        style:
                            titleSmall!.copyWith(color: CustomColors.lightGrey),
                      ),
                      TextSpan(text: 'Прожарка', style: titleSmall),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    required this.showCheckIcon,
    required this.onShareTap,
    required this.checkIconColor,
  });

  final String title;
  final bool? showCheckIcon;
  final Color? checkIconColor;
  final void Function()? onShareTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp),
        ),
        SizedBox(width: 10.sp),
        showCheckIcon ?? true
            ? Image.asset(
                AppIcons.checkColoredBlue,
                width: 16.sp,
                height: 16.sp,
                color: checkIconColor ?? CustomColors.primaryBlue,
              )
            : const SizedBox.shrink(),
        const Spacer(),
        GestureDetector(
          onTap: onShareTap,
          child: Image.asset(AppIcons.share, width: 20.sp, height: 20.sp),
        ),
        SizedBox(width: 20.sp),
        Image.asset(AppIcons.favorites, width: 20.sp, height: 20.sp),
      ],
    );
  }
}

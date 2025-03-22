// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuNotesContent extends StatelessWidget {
  const MenuNotesContent({
    super.key,
    required this.popupPosition,
    required this.onPopupMenuOpen,
    required this.callPopupMenu,
  });

  final Offset? popupPosition;
  final Function onPopupMenuOpen;
  final Function callPopupMenu;

  @override
  Widget build(BuildContext context) {
    final List<String> titlesList = [
      'Меню от меня',
      'Меню от меня',
      'Меню от диетолога',
      'Название',
    ];

    return Column(
      children: [
        SizedBox(height: 10.sp),
        Section(
          child: ListView.separated(
            itemCount: titlesList.length,
            shrinkWrap: true,
            itemBuilder: (_, index) => _NotesTile(
              title: titlesList[index],
              imagesPathsList: index == 0
                  ? List.generate(6, (index) => AppImages.notes)
                  : [],
              onLongPress: (context) => callPopupMenu(context, index),
              onTap: () => context.router.push(const NoteRoute()),
            ),
            separatorBuilder: (_, __) =>
                Divider(height: 20.sp, color: CustomColors.lightlightGrey),
          ),
        ),
      ],
    );
  }
}

class _NotesTile extends StatelessWidget {
  const _NotesTile({
    required this.imagesPathsList,
    required this.title,
    required this.onLongPress,
    this.onTap,
  });

  final List<String>? imagesPathsList;
  final String title;
  final void Function(BuildContext)? onLongPress;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        onLongPress?.call(context);
      },
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '07.09.2025',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: CustomColors.lightGrey),
                  ),
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              Row(
                children: [
                  Image.asset(AppIcons.pin, width: 16.sp, height: 16.sp),
                  SizedBox(width: 10.sp),
                  Image.asset(AppIcons.arrowForward,
                      width: 16.sp, height: 16.sp),
                ],
              )
            ],
          ),
          imagesPathsList != null && imagesPathsList!.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(height: 10.sp),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
                        children: List.generate(
                          imagesPathsList!.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 10.sp),
                            child: Container(
                              width: 50.sp,
                              height: 50.sp,
                              decoration: BoxDecoration(
                                color: CustomColors.lightlightGrey,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              child: Image.asset(imagesPathsList![index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

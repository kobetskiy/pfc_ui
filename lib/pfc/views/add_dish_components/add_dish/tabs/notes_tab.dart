import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/edit_dish/edit_dish_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    void openEditDishBottomSheet() async {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const EditDishBottomSheet(),
      );
    }

    final List<String> titlesList = ['Pilaf', 'Greek Salad'];
    final List<String> subtitlesList = [
      '257 ккал • 30 grams • 16:00',
      '318 ккал • 50 grams • 16:30'
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Introduced',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.sp),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => AddedDishTile(
              title: titlesList[index],
              subtitleText: subtitlesList[index],
              trailing: Row(
                children: [
                  GestureDetector(
                    onTap: openEditDishBottomSheet,
                    child: Image.asset(
                      AppIcons.edit,
                      width: 20.sp,
                      height: 20.sp,
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  const RoundedButton(
                    iconPath: AppIcons.close,
                    color: CustomColors.lightGrey,
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.sp),
          ),
        ],
      ),
    );
  }
}

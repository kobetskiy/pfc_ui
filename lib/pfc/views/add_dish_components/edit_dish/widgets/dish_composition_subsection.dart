import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/dish_composition/dish_composition_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishCompositionSubSection extends StatelessWidget {
  const DishCompositionSubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubSection(
            onTap: () async => await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const DishCompositionBottomSheet(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Состав блюда',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Image.asset(AppIcons.arrowForward, width: 16.sp, height: 16.sp)
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          Text(
            'Вы можете ввести мл/гр или добавить ингредиент.',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.lightGrey),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishCompositionStep extends StatelessWidget {
  const DishCompositionStep({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final titleLarge =
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp);

    final ingredientsList = ['Подсолнечное масло', 'Говядина', 'Лук', 'Огурец'];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text('2. Состав блюда', style: titleLarge),
        ),
        SizedBox(height: 10.sp),
        Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
        SizedBox(height: 16.sp),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => AddedDishTile(
            title: ingredientsList[index],
            subtitleText: '257 калл • 30 грамм',
            trailing: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    if (index == 2) {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const EditIngredientBottomSheet(
                          title: 'Лук',
                          subtitle:
                              'Род двулетних и многолетних растений, относимых к семейству луковых (ранее относили к лилейным). Имеет большую сплюснуто-шаровидную луковицу, покрытую красноватыми, белыми или фиолетовыми оболочками.',
                          imagesPaths: AppImages.onionsList,
                          iconColor: CustomColors.primaryBlue,
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    AppIcons.edit,
                    width: 20.sp,
                    height: 20.sp,
                  ),
                ),
                SizedBox(width: 10.sp),
                const RoundedButton()
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10.sp),
        ),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: const AddSomethingRow(title: 'Добавить ингридиент'),
        ),
        SizedBox(height: 26.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: PrimaryButton(onPressed: onPressed, child: const Text('')),
        )
      ],
    );
  }
}

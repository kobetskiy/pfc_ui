import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../share_ingredient/share_ingredient_bottom_sheet.dart';

class DishCompositionBottomSheet extends StatefulWidget {
  const DishCompositionBottomSheet({super.key});

  @override
  State<DishCompositionBottomSheet> createState() =>
      _DishCompositionBottomSheetState();
}

class _DishCompositionBottomSheetState
    extends State<DishCompositionBottomSheet> {
  String? _cookingTimeValue;
  final ingredientsList = [
    'Подсолнечное масло',
    'Морковь',
    'Рис',
    'Говядина',
    'Лук',
    'Огурец'
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: "Состав блюда",
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              Section(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                child: CustomDropDownTextField(
                    title: 'Время готовки',
                    selectedValue: _cookingTimeValue,
                    onChanged: (value) {
                      _cookingTimeValue = value;
                      setState(() {});
                    },
                    items: const [
                      DropdownMenuItem(
                          value: '15 минут', child: Text('15 минут')),
                      DropdownMenuItem(
                          value: '30 минут', child: Text('30 минут')),
                      DropdownMenuItem(
                          value: '45 минут', child: Text('45 минут')),
                    ]),
              ),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              _IngredientsList(ingredientsList: ingredientsList),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: const AddSomethingRow(title: 'Добавить ингридиент'),
              ),
              SizedBox(height: 15.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(onPressed: () {}, child: const Text('')),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IngredientsList extends StatelessWidget {
  const _IngredientsList({required this.ingredientsList});

  final List<String> ingredientsList;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => AddedDishTile(
          title: ingredientsList[index],
          subtitleText: '257 калл • 100 грамм',
          trailing: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if (index == 2) {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => EditIngredientBottomSheet(
                        title: 'Рис',
                        subtitle:
                            'Зёрна одноимённого растения. Он является основным пищевым продуктом для большей части населения Земли, хотя по объёму производимого пищевого зерна уступает пшенице.',
                        onShareTap: () async => await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return const ShareIngredientBottomSheet();
                          },
                        ),
                        imagesPaths: AppImages.riseList,
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
              index == 5 ? SizedBox(width: 10.sp) : const SizedBox.shrink(),
              index == 5
                  ? const RoundedButton(iconPath: AppIcons.close)
                  : const SizedBox.shrink()
            ],
          ),
        ),
        separatorBuilder: (_, __) => SizedBox(height: 10.sp),
      ),
    );
  }
}

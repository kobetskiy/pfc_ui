import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/edit_dish/widgets/widgets.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishCheckTotalInformationStep extends StatelessWidget {
  const DishCheckTotalInformationStep({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final titleLarge =
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp);
    return SingleChildScrollView(
      // TODO: fix scroll
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text('3. Проверить информацию', style: titleLarge),
          ),
          SizedBox(height: 6.sp),
          Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
          const DishDescription(title: 'Манты', showCheckIcon: false),
          // SizedBox(height: 10.sp),
          Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
          SizedBox(height: 10.sp),
          const _DishesList(),
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: const AddSomethingRow(title: 'Добавить ингредиент '),
          ),
          SizedBox(height: 16.sp),
          Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
          SizedBox(height: 16.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text(
              'На 100 грамм',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 10.sp),
          const PFCInfoRow(),
          SizedBox(height: 26.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: PrimaryButton(
              onPressed: onPressed,
              child: const Text(''),
            ),
          ),
          SizedBox(height: 30.sp),
        ],
      ),
    );
  }
}

class _DishesList extends StatelessWidget {
  const _DishesList();

  @override
  Widget build(BuildContext context) {
    final titlesList = ['Подсолнечное масло', 'Говядина', 'Лук', 'Огурец'];
    return ListView.separated(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => AddedDishTile(
        title: titlesList[index],
        subtitleText: '257 калл • 100 мл. ',
        trailing: Row(
          children: [
            Image.asset(
              AppIcons.edit,
              width: 20.sp,
              height: 20.sp,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/widget.dart';
import 'package:flutter_app/pfc/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodProductCheckTotalInformationStep extends StatelessWidget {
  const FoodProductCheckTotalInformationStep(
      {super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final titleLarge =
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text('3. Проверить информацию', style: titleLarge),
        ),
        SizedBox(height: 10.sp),
        Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
        SizedBox(height: 16.sp),
        const _FoodProductDescription(),
        SizedBox(height: 16.sp),
        Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
        SizedBox(height: 16.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Text('На 100 грамм',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            SizedBox(height: 10.sp),
            const PFCInfoRow(),
          ],
        ),
        SizedBox(height: 26.sp),
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

class _FoodProductDescription extends StatelessWidget {
  const _FoodProductDescription();

  @override
  Widget build(BuildContext context) {
    final titleLarge =
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp);

    final cucumberImagesList = List.generate(4, (index) => AppImages.cucumber);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Text('Огурец', style: titleLarge),
            ),
            SizedBox(height: 10.sp),
            DishPhotosList(
              photoPathsList: cucumberImagesList,
              isPhotoDismissible: false,
            ),
            SizedBox(height: 10.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Text(
                'Огурец — это плод однолетнего травянистого растения семейства Тыквенные.',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

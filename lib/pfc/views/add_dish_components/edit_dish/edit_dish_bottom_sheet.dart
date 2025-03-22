import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/edit_dish/widgets/widgets.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDishBottomSheet extends StatelessWidget {
  const EditDishBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.93,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Редактировать',
          child: Column(
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              const DishDescription(title: 'Плов'),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              const DishPFC(),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              const DishCompositionSubSection(),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              const DishTime(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(
                  onPressed: () {},
                  child: const Text(''),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

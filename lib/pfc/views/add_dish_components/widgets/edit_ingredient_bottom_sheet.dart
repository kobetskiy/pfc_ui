import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/edit_dish/widgets/widgets.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditIngredientBottomSheet extends StatelessWidget {
  const EditIngredientBottomSheet({
    super.key,
    required this.title,
    this.iconColor,
    required this.subtitle,
    required this.imagesPaths, this.onShareTap,
  });

  final String title;
  final String subtitle;
  final List<String> imagesPaths;
  final Color? iconColor;
  final void Function()? onShareTap;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.68,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Измениить',
          child: Column(
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              DishDescription(
                title: title,
                imagesPaths: imagesPaths,
                showAdditions: false,
                checkIconColor: iconColor ?? CustomColors.primaryGreen,
                subtitle: subtitle,
                onShareTap: onShareTap,
              ),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              Section(
                child: Column(
                  children: [
                    const Text(''),
                    SubSection(
                      child: Row(
                        children: [
                          Text(
                            '0',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontFamily: 'AbhayaLibre',
                                  fontStyle: FontStyle.italic,
                                  color: CustomColors.lightGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 25.sp),
                    Center(
                      child: Text(
                        '0 ккал',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 16.sp),
                    PrimaryButton(onPressed: () {}, child: const Text(''))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/create_food_product/create_food_product_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'step_widgets/dish_step_widgets.dart';

class CreateDishBottomSheet extends StatefulWidget {
  const CreateDishBottomSheet({super.key});

  @override
  State<CreateDishBottomSheet> createState() => _CreateDishBottomSheetState();
}

class _CreateDishBottomSheetState extends State<CreateDishBottomSheet> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final _stepHeights = [0.91, 0.792, 0.9];

  void _onPageChanged(int index) {
    _currentStep = index;
    setState(() {});
  }

  void _nextStep() {
    if (_currentStep < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: _stepHeights[_currentStep],
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Создать блюдо',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              CustomStepper(
                currentStep: _currentStep,
                totalSteps: 3,
                onNext: _nextStep,
                onPrevious: _prevStep,
              ),
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(
                height: 600.sp,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    DishBaseInfoStep(onPressed: _nextStep),
                    DishCompositionStep(onPressed: _nextStep),
                    DishCheckTotalInformationStep(
                      onPressed: context.router.maybePop,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

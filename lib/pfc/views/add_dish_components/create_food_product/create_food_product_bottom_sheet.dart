// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'step_widgets/step_widgets.dart';

class CreateFoodProductBottomSheet extends StatefulWidget {
  const CreateFoodProductBottomSheet({super.key});

  @override
  _CreateFoodProductBottomSheetState createState() =>
      _CreateFoodProductBottomSheetState();
}

class _CreateFoodProductBottomSheetState
    extends State<CreateFoodProductBottomSheet> {
  final _pageController = PageController();
  int _currentStep = 0;
  final _stepHeights = [0.855, 0.843, 0.793];

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
          title: 'Создать продукт питания',
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
                    FoodProductBaseInfoStep(onPressed: _nextStep),
                    FoodProductNutrientDataStep(onPressed: _nextStep),
                    FoodProductCheckTotalInformationStep(
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

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onNext,
    required this.onPrevious,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStep(
            context: context,
            isActive: currentStep >= 0,
            stepNumber: '1',
            color: currentStep >= 0
                ? CustomColors.primaryBlue
                : CustomColors.lightlightGrey,
          ),
          Expanded(
            child: CustomPaint(
              size: const Size(double.infinity, 2),
              painter: DashedLinePainter(isActive: currentStep >= 1),
            ),
          ),
          _buildStep(
            context: context,
            isActive: currentStep >= 1,
            stepNumber: '2',
            color: currentStep >= 1
                ? CustomColors.primaryBlue
                : CustomColors.lightlightGrey,
          ),
          Expanded(
            child: CustomPaint(
              size: const Size(double.infinity, 2),
              painter: DashedLinePainter(isActive: currentStep >= 2),
            ),
          ),
          _buildStep(
            context: context,
            isActive: currentStep == 2,
            stepNumber: '3',
            color: currentStep == 2
                ? CustomColors.primaryBlue
                : CustomColors.lightlightGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required BuildContext context,
    required bool isActive,
    required String stepNumber,
    required Color color,
  }) {
    return Container(
      width: 40.sp,
      height: 40.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          stepNumber,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:
                  isActive ? CustomColors.primaryWhite : CustomColors.lightGrey,
              fontSize: 20.sp,
              fontFamily: 'AbhayaLibre'),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  DashedLinePainter({super.repaint, required this.isActive});

  final bool isActive;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 6;
    double dashSpace = 4;
    double startX = 0;

    final gradient = LinearGradient(
      colors: isActive
          ? [
              CustomColors.primaryBlue.withOpacity(0.1),
              CustomColors.primaryBlue,
              CustomColors.primaryBlue.withOpacity(0.1)
            ]
          : [
              Colors.grey.withOpacity(0),
              Colors.grey,
              Colors.grey.withOpacity(0),
            ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final paintGradient = Paint()
      ..strokeWidth = 2
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    while (startX < size.width) {
      canvas.drawLine(
          Offset(startX, 0), Offset(startX + dashWidth, 0), paintGradient);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

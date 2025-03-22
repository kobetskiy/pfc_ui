import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/calculate_pfc/calculate_pfc_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/main/consumption/consumption_info.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'food_progress_indicators.dart';

class FoodConsumption extends StatelessWidget {
  const FoodConsumption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SubSection(
        isBorderShown: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _General(),
            SizedBox(height: 30.sp),
            const _PFCCalculating(),
          ],
        ),
      ),
    );
  }
}

class _PFCCalculating extends StatelessWidget {
  const _PFCCalculating();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _NutrientBar(
          label: 'Углеводы',
          value: '102/255г',
          color: CustomColors.primaryBlue,
          progress: 0.4.sp,
        ),
        _NutrientBar(
          label: 'Белки',
          value: '23/102г',
          color: CustomColors.orange,
          progress: 0.22.sp,
        ),
        _NutrientBar(
          label: 'Жиры',
          value: '50/68г',
          color: const Color(0xFF46BCFF),
          progress: 0.73.sp,
        ),
      ],
    );
  }
}

class _General extends StatelessWidget {
  const _General();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.sp, left: 40.sp),
          child: CustomPaint(
            painter: CircularProgressPainter(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2296',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: 'AbhayaLibre',
                        ),
                  ),
                  Text(
                    'ккал осталось',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: CustomColors.lightGrey),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 60.sp),
        const ConsumptionInfo(
          topTitle: 'Потребление',
          topSubtitle: '104 ккал',
          bottomTitle: 'Расход',
          bottomSubtitle: '1090 ккал',
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async => await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const CalculatePfcBottomSheet(),
          ),
          child: Image.asset(AppIcons.settings, width: 20.sp, height: 20.sp),
        )
      ],
    );
  }
}

class _NutrientBar extends StatelessWidget {
  const _NutrientBar({
    required this.label,
    required this.value,
    required this.color,
    required this.progress,
  });

  final String label;
  final String value;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: CustomColors.primaryWhite,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 5.sp),
          LinearProgressPainter(
            progress: progress,
            color: color,
          ),
          SizedBox(height: 5.sp),
          Text(value, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}

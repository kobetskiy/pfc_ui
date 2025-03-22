import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/main/consumption/consumption_info.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'water_progress_indicators.dart';

class WaterConsumption extends StatelessWidget {
  const WaterConsumption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: const SubSection(
        isBorderShown: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _General(),
            Spacer(),
            _AddWater(),
          ],
        ),
      ),
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
          padding: EdgeInsets.only(top: 10.sp, left: 10.sp),
          child: ClipOval(
            child: CustomPaint(
              painter: WaveProgressPainter(progress: 0.62),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    width: 60.sp,
                    height: 60.sp,
                    decoration: BoxDecoration(
                        color: CustomColors.lightGrey,
                        borderRadius: BorderRadius.circular(100.sp)),
                    child: Text(
                      '62%',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontFamily: 'AbhayaLibre',
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 65.sp),
        const ConsumptionInfo(
          topTitle: 'Потребление',
          topSubtitle: '104 мл',
          bottomTitle: 'Цель',
          bottomSubtitle: '3000 мл',
        ),
        const Spacer(),
        Image.asset(AppIcons.settings, width: 20.sp, height: 20.sp)
      ],
    );
  }
}

class _AddWater extends StatelessWidget {
  const _AddWater();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DottedBorder(
        radius: Radius.circular(10.sp),
        borderType: BorderType.RRect,
        padding: EdgeInsets.symmetric(vertical: 23.sp),
        color: CustomColors.brightGrey,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(
                  color: CustomColors.lightGrey,
                  borderRadius: BorderRadius.circular(3.sp),
                ),
                child: Image.asset(
                  AppIcons.add,
                  width: 13.sp,
                  height: 13.sp,
                  color: CustomColors.lightWhite,
                ),
              ),
              SizedBox(width: 13.sp),
              Text(
                'Добавить воду',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

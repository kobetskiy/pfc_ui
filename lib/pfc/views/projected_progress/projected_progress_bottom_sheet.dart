import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'weight_chart.dart';

class ProjectedProgressBottomSheet extends StatelessWidget {
  const ProjectedProgressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Ваш прогназируемый прогресс',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Stack(
                  children: [
                    SubSection(
                      child: Column(
                        children: [
                          Text(
                            '70 кг к 15 ноября 2024 г.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 40.sp),
                          const WeightChart(),
                          SizedBox(height: 10.sp),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20.sp,
                      bottom: 15.sp,
                      child: Text(
                        'Сегодня',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Positioned(
                      right: 8.sp,
                      bottom: 15.sp,
                      child: Text(
                        '2 мая 2025 г.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Positioned(
                      right: 23.sp,
                      bottom: 60.sp,
                      child: const _WeightLabel(text: '70 кг'),
                    ),
                    Positioned(
                      left: 23.sp,
                      top: 53.sp,
                      child: const _WeightLabel(text: '78 кг'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                '0.20 кг/нед.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const _SliderExample(),
              SizedBox(height: 10.sp),
              Text(
                'Рекомендуем этот темп похудения для долгосрочного успеха.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: CustomColors.lightGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(onPressed: () {}, child: const Text('')),
              )
            ],
          ),
        );
      },
    );
  }
}

class _SliderExample extends StatefulWidget {
  const _SliderExample();

  @override
  State<_SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<_SliderExample> {
  double _currentSliderValue = 58;

  @override
  Widget build(BuildContext context) {
    return Slider(
      inactiveColor: CustomColors.primaryBlue.withOpacity(0.1),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      activeColor: CustomColors.primaryBlue,
      value: _currentSliderValue,
      max: 100,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        _currentSliderValue = value;
        setState(() {});
      },
    );
  }
}

class _WeightLabel extends StatelessWidget {
  final String text;

  const _WeightLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 3.sp),
          color: CustomColors.primaryGreen,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.primaryWhite),
          ),
        ),
        ClipPath(
          clipper: _TriangleClipper(),
          child: Container(
            width: 10.sp,
            height: 5.sp,
            color: CustomColors.primaryGreen,
          ),
        ),
      ],
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

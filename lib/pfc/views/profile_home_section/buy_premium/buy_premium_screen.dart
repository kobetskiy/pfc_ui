// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/buy_button_section.dart';

@RoutePage()
class BuyPremiumScreen extends StatelessWidget {
  const BuyPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryWhite,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.premiumPoster),
                  SizedBox(height: 7.sp),
                  const _Promotion(),
                  SizedBox(height: 10.sp),
                  const _Title(),
                  SizedBox(height: 15.sp),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      itemCount: 5,
                      itemBuilder: (_, __) => const _PremiumAdvantages(),
                      separatorBuilder: (_, __) => SizedBox(height: 8.sp),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  const PricingWidget(),
                  SizedBox(height: 25.sp),
                  const BuyButtonSection()
                ],
              ),
            ),
            Positioned(
              top: 40.sp,
              right: 10.sp,
              child: IconButton(
                onPressed: context.router.maybePop,
                icon: Image.asset(AppIcons.close, width: 20.sp, height: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PricingWidget extends StatefulWidget {
  const PricingWidget({super.key});

  @override
  _PricingWidgetState createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> {
  int selectedIndex = 0;

  /// Comes from model or db
  final List<Map<String, dynamic>> plans = [
    {
      'duration': 'На месяц',
      'price': '₹2,990.00',
      'priceByMonth': null,
    },
    {
      'duration': '3 месяца',
      'price': '₹12,990.00',
      'priceByMonth': '₹2,990.00',
    },
    {
      'duration': '12 месяцев',
      'price': '₹20,990.00',
      'priceByMonth': '₹1,990.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.sp,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            children: List.generate(plans.length, (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.sp),
                  padding: EdgeInsets.all(12.sp),
                  width: 140.sp,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.white : CustomColors.lightlightGrey,
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(
                      color: isSelected
                          ? CustomColors.primaryBlue
                          : Colors.transparent,
                      width: 2.sp,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plans[index]['duration']!,
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        plans[index]['priceByMonth'] != null
                            ? '${plans[index]['priceByMonth']!}/В месяц'
                            : '',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: CustomColors.lightGrey),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        plans[index]['price']!,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _PremiumAdvantages extends StatelessWidget {
  const _PremiumAdvantages();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppIcons.check, width: 18.sp, height: 13.sp),
        SizedBox(width: 10.sp),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ежедневная обратная связь ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextSpan(
                  text: 'для корректировка питания',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final abhayaFont = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontFamily: 'AbhayaLibre');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          Text(
            "Евгений, скидка",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '50% ', style: abhayaFont),
                TextSpan(
                  text: 'на ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextSpan(text: 'Premium!', style: abhayaFont),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Promotion extends StatelessWidget {
  const _Promotion();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
        decoration: BoxDecoration(
          color: CustomColors.primaryBlue,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(
          'АКЦИЯ!',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: CustomColors.primaryWhite),
        ),
      ),
    );
  }
}

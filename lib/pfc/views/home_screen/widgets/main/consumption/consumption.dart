import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/main/consumption/food_consumption/food_consumption.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'water_consumption/water_consumption.dart';

class Consumption extends StatefulWidget {
  const Consumption({super.key});

  @override
  State<Consumption> createState() => _ConsumptionState();
}

class _ConsumptionState extends State<Consumption>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Column(
        children: [
          Center(
            child: TabPageSelector(
              controller: _tabController,
              indicatorSize: 8.sp,
              color: CustomColors.mediumGrey,
              borderStyle: BorderStyle.none,
              selectedColor: CustomColors.primaryBlue,
            ),
          ),
          SizedBox(height: 5.sp),
          SizedBox(
            height: 270.sp,
            child: PageView(
              onPageChanged: (value) {
                _tabController.index = value;
                setState(() {});
              },
              children: const [
                FoodConsumption(),
                WaterConsumption(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

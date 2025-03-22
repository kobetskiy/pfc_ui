import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/add_dish/add_dish_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightlightGrey,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(
              title: 'Б.Ж.У',
              leading: IconButton(
                onPressed: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddDishBottomSheet(),
                ),
                icon:
                    Image.asset(AppIcons.calendar, width: 20.sp, height: 20.sp),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.sp),
                const ProfileInformation(),
                SizedBox(height: 10.sp),
                const Consumption(),
                SizedBox(height: 10.sp),
                const PhysicalActivity(),
                SizedBox(height: 10.sp),
                const MenuAndHistory(),
                SizedBox(height: 10.sp),
                const NutritionistChannels(),
                SizedBox(height: 10.sp),
                const FitnessInstructorChannels(),
                const CustomSearchBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

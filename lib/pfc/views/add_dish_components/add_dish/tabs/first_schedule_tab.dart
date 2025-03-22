import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScheduleTab extends StatelessWidget {
  const FirstScheduleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => const AddedDishTile(
            title: 'Плов',
            subtitleText: '257 калл • 30 грамм',
            trailing: RoundedButton(),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10.sp),
        ),
      ],
    );
  }
}

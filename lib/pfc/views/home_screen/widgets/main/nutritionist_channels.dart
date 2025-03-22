import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionistChannels extends StatelessWidget {
  const NutritionistChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ChannelTitle(
            title: 'Каналы диетологов',
            onPressed: () {},
          ),
          SizedBox(
            height: 191.sp,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => ChannelCard(
                imagePath: AppIcons.nutritionChannel,
                title: 'Канал ${index + 1}',
                subtitle: 'Диетолог',
                onPressed: () {},
              ),
              separatorBuilder: (_, __) => SizedBox(width: 10.sp),
            ),
          )
        ],
      ),
    );
  }
}

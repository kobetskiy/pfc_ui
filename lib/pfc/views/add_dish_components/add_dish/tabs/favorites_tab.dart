import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Избранное',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.sp),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => AddedDishTile(
              title: 'Плов',
              subtitleText: '257 калл • 30 грамм',
              trailing: Row(
                children: [
                  Image.asset(
                    AppIcons.favoriteColored,
                    width: 20.sp,
                    height: 20.sp,
                  ),
                  SizedBox(width: 10.sp),
                  const RoundedButton()
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.sp),
          ),
        ],
      ),
    );
  }
}

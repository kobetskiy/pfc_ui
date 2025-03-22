import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Недавно добавленные',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.sp),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const AddedDishTile(
              title: 'Плов',
              subtitleText: '257 калл • 30 грамм • 16:00',
              trailing: RoundedButton(),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.sp),
            itemCount: 2,
          )
        ],
      ),
    );
  }
}

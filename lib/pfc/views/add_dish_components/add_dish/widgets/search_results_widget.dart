import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/views/add_dish_components/widgets/added_dish_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({super.key});

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  final foundDishesList = ['Рис', 'Ображенный рис', 'Отпаренный рис'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.sp),
          Text(
            'Результаты поиска',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10.sp),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => AddedDishTile(
              title: foundDishesList[index],
              subtitleText: '257 калл • 30 грамм',
              trailing: const RoundedButton(),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.sp),
            itemCount: 3,
          ),
          SizedBox(height: 30.sp),
        ],
      ),
    );
  }
}

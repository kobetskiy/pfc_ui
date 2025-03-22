import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookingWayBottomSheet extends StatelessWidget {
  const CookingWayBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Тип приготовления',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              _CookingWayDetails(scrollController: scrollController),
            ],
          ),
        );
      },
    );
  }
}

class _CookingWayDetails extends StatefulWidget {
  const _CookingWayDetails({required this.scrollController});

  final ScrollController scrollController;

  @override
  _CookingWayDetailsState createState() => _CookingWayDetailsState();
}

final List<String> titlesList = [
  'Варка',
  'Парка (приготовление на пару)',
  'Жарка',
  'Запекание',
  'Тушение',
  'Гриль',
  'Микроволновая обработка',
  'Бланширование',
  'Фритюр',
  'Конфи',
  'Маринование (холодный способ, предварительный этап)',
];

final List<String> subtitlesList = [
  'Приготовление пищи в воде или другой жидкости (бульон, молоко).',
  'Пища готовится под воздействием горячего пара, без погружения в воду.',
  'Приготовление пищи на сковороде или в фритюре с использованием масла или жира.',
  'Приготовление пищи в духовке с использованием сухого тепла.',
  'Медленное приготовление пищи на слабом огне с добавлением небольшого количества жидкости.',
  'Приготовление пищи на открытом огне или жаре, например, на решетке.',
  'Приготовление пищи в микроволновой печи за счет воздействия электромагнитных волн.',
  'Кратковременное обваривание продукта в кипящей воде с последующим охлаждением.',
  'Глубокая жарка продуктов в большом количестве масла.',
  'Медленное приготовление продуктов в жире при низкой температуре.',
  'Замачивание продуктов в маринаде (кислота, специи, масло) для улучшения вкуса.',
];

final List<String> cookingWay = [
  'boiling',
  'steaming',
  'frying',
  'baking',
  'stewing',
  'grilling',
  'microwaveProcessing',
  'blanching',
  'deepFrying',
  'confit',
  'marinating'
];

class _CookingWayDetailsState extends State<_CookingWayDetails> {
  String? _selectedType = 'boiling';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: ListView.separated(
        controller: widget.scrollController, // TODO: fix scroll
        shrinkWrap: true,
        itemCount: titlesList.length,
        itemBuilder: (context, index) {
          return _buildCustomRadioTile(
            context: context,
            title: titlesList[index],
            subtitle: subtitlesList[index],
            value: cookingWay[index],
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: 0.sp,
          color: CustomColors.lightlightGrey,
        ),
      ),
    );
  }

  Widget _buildCustomRadioTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio<String>(
          activeColor: CustomColors.primaryBlue,
          value: value,
          groupValue: _selectedType,
          onChanged: (String? selectedValue) {
            _selectedType = selectedValue;
            setState(() {});
          },
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.sp),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 4.sp),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: CustomColors.lightGrey, height: 1.2),
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ],
    );
  }
}

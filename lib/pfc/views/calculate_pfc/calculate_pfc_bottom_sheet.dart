import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/projected_progress/projected_progress_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatePfcBottomSheet extends StatelessWidget {
  const CalculatePfcBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.79,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Рассчитать Б.Ж.У.',
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.sp),
                const _ElevatedButtons(),
                SizedBox(height: 15.sp),
                const _OutlinedButtons(),
                SizedBox(height: 15.sp),
                const _TextFields(),
                SizedBox(height: 30.sp),
                PrimaryButton(
                  onPressed: () async => await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const ProjectedProgressBottomSheet(),
                  ),
                  child: const Text(''),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TextFields extends StatelessWidget {
  const _TextFields();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.lightGrey);

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: CustomColors.lightlightGrey,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.lightGrey,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.sp,
        horizontal: 16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide.none,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Укажите свой вес', style: titleStyle),
                  SizedBox(height: 6.sp),
                  TextField(
                    controller: TextEditingController(text: '78'),
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: inputDecoration.copyWith(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 14.sp,
                        horizontal: 16.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 14.sp),
            Padding(
              padding: EdgeInsets.only(bottom: 16.sp),
              child: Text('и', style: titleStyle),
            ),
            SizedBox(width: 14.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Желаемый вес', style: titleStyle),
                  SizedBox(height: 6.sp),
                  TextField(
                    controller: TextEditingController(text: '70'),
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: inputDecoration.copyWith(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 14.sp,
                        horizontal: 16.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.sp),
        Text('Ваш рост', style: titleStyle),
        SizedBox(height: 6.sp),
        TextField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: inputDecoration.copyWith(
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.sp,
              horizontal: 16.sp,
            ),
            hintText: "Пример",
          ),
        ),
        SizedBox(height: 16.sp),
        const Text(''),
        SizedBox(height: 6.sp),
        SubSection(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              Image.asset(AppIcons.arrowForward, width: 20.sp, height: 20.sp)
            ],
          ),
        )
      ],
    );
  }
}

class _ElevatedButtons extends StatefulWidget {
  const _ElevatedButtons();

  @override
  State<_ElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<_ElevatedButtons> {
  bool isFirstButtonSelected = true;
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.lightGrey);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Выберите  как вы хотите рассчитать', style: titleStyle),
        SizedBox(height: 6.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PrimaryButton(
                padding: EdgeInsets.zero,
                backgroundColor: isFirstButtonSelected
                    ? CustomColors.primaryBlue
                    : CustomColors.lightlightGrey,
                onPressed: () {
                  isFirstButtonSelected = true;
                  setState(() {});
                },
                child: Text(
                  'Рассчитать для вас',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isFirstButtonSelected
                          ? CustomColors.primaryWhite
                          : CustomColors.lightGrey),
                ),
              ),
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: PrimaryButton(
                padding: EdgeInsets.zero,
                backgroundColor: !isFirstButtonSelected
                    ? CustomColors.primaryBlue
                    : CustomColors.lightlightGrey,
                onPressed: () {
                  isFirstButtonSelected = false;
                  setState(() {});
                },
                child: Text(
                  'Настроить вручную',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: !isFirstButtonSelected
                          ? CustomColors.primaryWhite
                          : CustomColors.lightGrey),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OutlinedButtons extends StatefulWidget {
  const _OutlinedButtons();

  @override
  _OutlinedButtonsState createState() => _OutlinedButtonsState();
}

class _OutlinedButtonsState extends State<_OutlinedButtons> {
  int? selectedGoalIndex;
  int? selectedGenderIndex;

  final List<String> goals = ['Собросить', 'Поддерживать', 'Набрать'];
  final List<String> genders = ['Мужской', 'Женский'];

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Какова ваша цель?',
          style: titleStyle!.copyWith(color: CustomColors.lightGrey),
        ),
        SizedBox(height: 6.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(goals.length, (index) {
            return GestureDetector(
              onTap: () {
                selectedGoalIndex = index;
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.sp),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.sp, horizontal: 10.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedGoalIndex == index
                          ? CustomColors.primaryBlue
                          : CustomColors.lightGrey,
                      width: selectedGoalIndex == index ? 2.sp : 1.sp,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.white,
                  ),
                  child: Text(goals[index], style: titleStyle),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 15.sp),
        Text(
          'Ваш пол',
          style: titleStyle.copyWith(color: CustomColors.lightGrey),
        ),
        SizedBox(height: 6.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(genders.length, (index) {
            return GestureDetector(
              onTap: () {
                selectedGenderIndex = index;
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.sp),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.sp, horizontal: 10.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedGenderIndex == index
                          ? CustomColors.primaryBlue
                          : CustomColors.lightGrey,
                      width: selectedGenderIndex == index ? 2.sp : 1.sp,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.white,
                  ),
                  child: Text(genders[index], style: titleStyle),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodProductNutrientDataStep extends StatelessWidget {
  const FoodProductNutrientDataStep({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text(
            '2. Данные о питательных веществах',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
        ),
        SizedBox(height: 16.sp),
        const VolumeUnit(),
        SizedBox(height: 16.sp),
        const _BaseInfoTextFields(),
        SizedBox(height: 27.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: PrimaryButton(
            onPressed: onPressed,
            child: const Text(''),
          ),
        ),
      ],
    );
  }
}

class VolumeUnit extends StatefulWidget {
  const VolumeUnit({super.key});

  @override
  State<VolumeUnit> createState() => _VolumeUnitState();
}

class _VolumeUnitState extends State<VolumeUnit> {
  bool isFirstButtonSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Единица объёма',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.lightGrey),
          ),
          SizedBox(height: 6.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PrimaryButton(
                  backgroundColor: isFirstButtonSelected
                      ? CustomColors.primaryBlue
                      : CustomColors.lightlightGrey,
                  onPressed: () {
                    isFirstButtonSelected = true;
                    setState(() {});
                  },
                  child: Text(
                    '    ( . g)',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'AbhayaLibre',
                        color: isFirstButtonSelected
                            ? CustomColors.primaryWhite
                            : CustomColors.lightGrey),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: PrimaryButton(
                  backgroundColor: !isFirstButtonSelected
                      ? CustomColors.primaryBlue
                      : CustomColors.lightlightGrey,
                  onPressed: () {
                    isFirstButtonSelected = false;
                    setState(() {});
                  },
                  child: Text(
                    '       (. ml)',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'AbhayaLibre',
                        color: !isFirstButtonSelected
                            ? CustomColors.primaryWhite
                            : CustomColors.lightGrey),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BaseInfoTextFields extends StatelessWidget {
  const _BaseInfoTextFields();

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: CustomColors.lightGrey, fontFamily: 'AbhayaLibre');
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('   / 100  .', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(decoration: inputDecoration),
          SizedBox(height: 10.sp),
          Text('     / 100  .', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(decoration: inputDecoration),
          SizedBox(height: 10.sp),
          Text('        / 100  .', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(decoration: inputDecoration),
          SizedBox(height: 10.sp),
          Text('    / 100  .', style: titleTextStyle),
          SizedBox(height: 6.sp),
          TextField(decoration: inputDecoration),
          SizedBox(height: 10.sp),
        ],
      ),
    );
  }
}

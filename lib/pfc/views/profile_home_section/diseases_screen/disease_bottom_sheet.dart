import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiseaseBottomSheet extends StatelessWidget {
  const DiseaseBottomSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.68,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: title,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              const _DiseaseDetails(),
              SizedBox(height: 25.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: PrimaryButton(onPressed: () {}, child: const Text('')),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DiseaseDetails extends StatefulWidget {
  const _DiseaseDetails();

  @override
  _DiseaseDetailsState createState() => _DiseaseDetailsState();
}

enum DiabetesType { prediabetes, type1, type2 }

class _DiseaseDetailsState extends State<_DiseaseDetails> {
  DiabetesType? _selectedDiabetesType = DiabetesType.prediabetes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: <Widget>[
          _buildCustomRadioTile(
            context: context,
            title: 'Преддиабет',
            subtitle:
                'Состояние, при котором уровень сахара в крови выше нормы, но не достигает уровня диабета. '
                'На этом этапе можно предотвратить развитие болезни при изменении образа жизни.',
            value: DiabetesType.prediabetes,
          ),
          _buildCustomRadioTile(
            context: context,
            title: 'Сахарный диабет 1 типа',
            subtitle: 'Характеризуется полным отсутствием выработки инсулина. '
                'Обычно возникает в детском или подростковом возрасте и требует постоянного введения инсулина.',
            value: DiabetesType.type1,
          ),
          _buildCustomRadioTile(
            context: context,
            title: 'Сахарный диабет 2 типа',
            subtitle:
                'Возникает чаще у взрослых и связан с тем, что клетки организма не реагируют должным образом на инсулин. '
                'Это самая распространённая форма диабета, и её развитие может быть связано с ожирением, недостаточной физической активностью и генетической предрасположенностью.',
            value: DiabetesType.type2,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRadioTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required DiabetesType value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio<DiabetesType>(
          activeColor: CustomColors.primaryBlue,
          value: value,
          groupValue: _selectedDiabetesType,
          onChanged: (DiabetesType? selectedValue) {
            _selectedDiabetesType = selectedValue;
            setState(() {});
          },
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.sp),
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
            ],
          ),
        ),
      ],
    );
  }

// Widget _buildRadioTile({
//     required BuildContext context,
//     required String title,
//     required String subtitle,
//     required DiabetesType value,
//   }) {
//     return RadioListTile<DiabetesType>(
  // activeColor: CustomColors.primaryBlue,
  // contentPadding: EdgeInsets.zero,
//       title: Text(
//         title,
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//       subtitle: Text(
//         subtitle,
//         style: Theme.of(context)
//             .textTheme
//             .labelSmall!
//             .copyWith(color: CustomColors.lightGrey),
//       ),
//       value: value,
//       groupValue: _selectedDiabetesType,
//       onChanged: (DiabetesType? selectedValue) {
//         _selectedDiabetesType = selectedValue;
//         setState(() {});
//       },
//     );
//   }
}

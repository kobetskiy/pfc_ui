import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyButtonSection extends StatelessWidget {
  const BuyButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CustomColors.mediumGrey,
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
      ),
      child: Section(
        child: Column(
          children: [
            const _BuyButton(),
            SizedBox(height: 5.sp),
            const _PrivacyPolicyText(),
          ],
        ),
      ),
    );
  }
}

class _PrivacyPolicyText extends StatelessWidget {
  const _PrivacyPolicyText();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle!.copyWith(color: CustomColors.lightGrey),
        children: [
          const TextSpan(
              text:
                  'Нажимая "Купить", вы подтверждаете, что согласны со следующими документами: '),
          TextSpan(
            text: 'Условия пользования',
            style: textStyle,
          ),
          const TextSpan(text: ' и '),
          TextSpan(text: 'Политика конфиденциальности', style: textStyle),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton();

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      height: 80.sp,
      child: Column(
        children: [
          Text(
            'Купить',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: CustomColors.primaryWhite,
                ),
          ),
          SizedBox(height: 4.sp),
          Text(
            'В следующим периоде будет списана сумма в размере ₸2,990.00',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: CustomColors.primaryWhite,
                  fontSize: 10,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

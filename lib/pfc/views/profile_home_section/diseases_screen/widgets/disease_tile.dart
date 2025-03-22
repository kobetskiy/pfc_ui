import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';

class DeseaseTile extends StatelessWidget {
  const DeseaseTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: CustomColors.lightGrey),
              ),
            ],
          ),
          const Spacer(),
          icon ??
              const RoundedButton(
                iconPath: AppIcons.close,
                color: CustomColors.lightGrey,
              )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: CustomColors.primaryWhite,
      floating: true,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ChatRoute(),
        MenuRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomNavigationBarWidget(
          tabIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        ),
      ),
    );
  }
}

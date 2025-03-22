import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/views/app_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/home_menu_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/dishes_schedule_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/days_schedule_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/my_schedule_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_menu_screen/schedule/meals_schedule_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/note_screen/choose_message_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/note_screen/note_screen.dart';
import 'package:flutter_app/pfc/views/profile_home_section/buy_premium/buy_premium_screen.dart';
import 'package:flutter_app/pfc/views/chat_screen/chat_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/diseases_screen/diseases_screen.dart';
import 'package:flutter_app/pfc/views/home_screen/home_screen.dart';
import 'package:flutter_app/pfc/views/profile_home_section/medications_notification/midication_notification_screen.dart';
import 'package:flutter_app/pfc/views/menu_screen/menu_screen.dart';
import 'package:flutter_app/pfc/views/add_dish_components/qr_code/qr_code_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppRoute.page,
          path: '/',
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'chat', page: ChatRoute.page),
            AutoRoute(path: 'settings', page: MenuRoute.page),
          ],
        ),
        AutoRoute(path: '/buy-premium', page: BuyPremiumRoute.page),
        AutoRoute(
          path: '/medication-notification',
          page: MidicationNotificationRoute.page,
        ),
        AutoRoute(path: '/diseases', page: DiseasesRoute.page),
        AutoRoute(path: '/scan-qr-code', page: ScanQrCodeRoute.page),
        AutoRoute(path: '/home-menu', page: HomeMenuRoute.page),
        AutoRoute(path: '/note', page: NoteRoute.page),
        AutoRoute(path: '/choose-message', page: ChooseMessageRoute.page),
        AutoRoute(path: '/my-schedule', page: MyScheduleRoute.page),
        AutoRoute(path: '/days-schedule', page: DaysScheduleRoute.page),
        AutoRoute(path: '/meals-schedule', page: MealsScheduleRoute.page),
        AutoRoute(path: '/dishes-schedule', page: DishesScheduleRoute.page),
      ];
}

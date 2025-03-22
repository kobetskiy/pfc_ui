// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppScreen();
    },
  );
}

/// generated route for
/// [BuyPremiumScreen]
class BuyPremiumRoute extends PageRouteInfo<void> {
  const BuyPremiumRoute({List<PageRouteInfo>? children})
      : super(
          BuyPremiumRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyPremiumRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BuyPremiumScreen();
    },
  );
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatScreen();
    },
  );
}

/// generated route for
/// [ChooseMessageScreen]
class ChooseMessageRoute extends PageRouteInfo<void> {
  const ChooseMessageRoute({List<PageRouteInfo>? children})
      : super(
          ChooseMessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseMessageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseMessageScreen();
    },
  );
}

/// generated route for
/// [DaysScheduleScreen]
class DaysScheduleRoute extends PageRouteInfo<void> {
  const DaysScheduleRoute({List<PageRouteInfo>? children})
      : super(
          DaysScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'DaysScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DaysScheduleScreen();
    },
  );
}

/// generated route for
/// [DiseasesScreen]
class DiseasesRoute extends PageRouteInfo<void> {
  const DiseasesRoute({List<PageRouteInfo>? children})
      : super(
          DiseasesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiseasesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiseasesScreen();
    },
  );
}

/// generated route for
/// [DishesScheduleScreen]
class DishesScheduleRoute extends PageRouteInfo<DishesScheduleRouteArgs> {
  DishesScheduleRoute({
    Key? key,
    required String day,
    required String mealName,
    List<PageRouteInfo>? children,
  }) : super(
          DishesScheduleRoute.name,
          args: DishesScheduleRouteArgs(
            key: key,
            day: day,
            mealName: mealName,
          ),
          initialChildren: children,
        );

  static const String name = 'DishesScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DishesScheduleRouteArgs>();
      return DishesScheduleScreen(
        key: args.key,
        day: args.day,
        mealName: args.mealName,
      );
    },
  );
}

class DishesScheduleRouteArgs {
  const DishesScheduleRouteArgs({
    this.key,
    required this.day,
    required this.mealName,
  });

  final Key? key;

  final String day;

  final String mealName;

  @override
  String toString() {
    return 'DishesScheduleRouteArgs{key: $key, day: $day, mealName: $mealName}';
  }
}

/// generated route for
/// [HomeMenuScreen]
class HomeMenuRoute extends PageRouteInfo<void> {
  const HomeMenuRoute({List<PageRouteInfo>? children})
      : super(
          HomeMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeMenuScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MealsScheduleScreen]
class MealsScheduleRoute extends PageRouteInfo<MealsScheduleRouteArgs> {
  MealsScheduleRoute({
    Key? key,
    required String day,
    List<PageRouteInfo>? children,
  }) : super(
          MealsScheduleRoute.name,
          args: MealsScheduleRouteArgs(
            key: key,
            day: day,
          ),
          initialChildren: children,
        );

  static const String name = 'MealsScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MealsScheduleRouteArgs>();
      return MealsScheduleScreen(
        key: args.key,
        day: args.day,
      );
    },
  );
}

class MealsScheduleRouteArgs {
  const MealsScheduleRouteArgs({
    this.key,
    required this.day,
  });

  final Key? key;

  final String day;

  @override
  String toString() {
    return 'MealsScheduleRouteArgs{key: $key, day: $day}';
  }
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuScreen();
    },
  );
}

/// generated route for
/// [MidicationNotificationScreen]
class MidicationNotificationRoute extends PageRouteInfo<void> {
  const MidicationNotificationRoute({List<PageRouteInfo>? children})
      : super(
          MidicationNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MidicationNotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MidicationNotificationScreen();
    },
  );
}

/// generated route for
/// [MyScheduleScreen]
class MyScheduleRoute extends PageRouteInfo<void> {
  const MyScheduleRoute({List<PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyScheduleScreen();
    },
  );
}

/// generated route for
/// [NoteScreen]
class NoteRoute extends PageRouteInfo<void> {
  const NoteRoute({List<PageRouteInfo>? children})
      : super(
          NoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoteScreen();
    },
  );
}

/// generated route for
/// [ScanQrCodeScreen]
class ScanQrCodeRoute extends PageRouteInfo<void> {
  const ScanQrCodeRoute({List<PageRouteInfo>? children})
      : super(
          ScanQrCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanQrCodeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScanQrCodeScreen();
    },
  );
}

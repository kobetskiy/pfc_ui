import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PFCApp extends StatefulWidget {
  const PFCApp({super.key});

  @override
  State<PFCApp> createState() => _PFCAppState();
}

class _PFCAppState extends State<PFCApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      ensureScreenSize: true,
      rebuildFactor: (_, __) => false,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routerConfig: _router.config(),
        );
      },
    );
  }
}

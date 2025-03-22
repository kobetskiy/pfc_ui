import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.child,
    required this.title,
    this.onBackButtonPressed,
    this.action,
    this.scrollController,
  });

  final Widget child;
  final String title;
  final Widget? action;
  final ScrollController? scrollController;
  final void Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.sp),
          topRight: Radius.circular(15.sp),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onBackButtonPressed ?? context.router.maybePop,
                  icon: Image.asset(AppIcons.arrowBack,
                      width: 20.sp, height: 20.sp),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                action ?? SizedBox(width: 50.sp),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}

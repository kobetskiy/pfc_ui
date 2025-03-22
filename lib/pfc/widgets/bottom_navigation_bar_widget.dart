import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.tabIndex,
    this.onTap,
  });

  final int tabIndex;
  final void Function(int)? onTap;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.sp,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: CustomColors.lightGrey,
      selectedItemColor: CustomColors.primaryBlue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppIcons.egg),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppIcons.chat),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppIcons.menu),
          ),
          label: '',
        ),
      ],
      currentIndex: widget.tabIndex,
      onTap: widget.onTap,
    );
  }
}

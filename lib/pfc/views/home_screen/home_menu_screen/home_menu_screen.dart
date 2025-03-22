import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'notes/menu_notes_content.dart';
import 'schedule/menu_schedule_content.dart';

@RoutePage()
class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen> {
  Offset? _popupPosition;
  bool isFirstButtonSelected = true;
  bool isPopupMenuOpen = false;

  void onPopupItemTap() {
    _popupPosition = null;
    isPopupMenuOpen = false;
    setState(() {});
  }

  void callPopupMenu(BuildContext context, int index) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    setState(() {
      _popupPosition = offset;
      isPopupMenuOpen = true;
    });

    showMenu(
      color: CustomColors.lightlightGrey,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      ),
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height + 20.sp,
        -offset.dx,
        0,
      ),
      items: [
        for (var item in _popupMenuItems)
          PopupMenuItem(
            onTap: onPopupItemTap,
            child: _PopUpMenuContent(
              title: item['title'],
              iconPath: item['icon'],
              color: item['color'],
            ),
          ),
      ],
    ).then((value) {
      if (mounted) {
        onPopupItemTap();
      }
    });
  }

  final List<Map<String, dynamic>> _popupMenuItems = [
    {'title': 'Открепить заметку', 'icon': AppIcons.unpin},
    {'title': 'Поделиться заметкой', 'icon': AppIcons.upload},
    {'title': 'Удалить', 'icon': AppIcons.delete, 'color': CustomColors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                _AppBar(
                  isFirstButtonSelected: isFirstButtonSelected,
                  onFirstButtonTap: () {
                    isFirstButtonSelected = true;
                    setState(() {});
                  },
                  onSecondButtonTap: () {
                    isFirstButtonSelected = false;
                    setState(() {});
                  },
                ),
              ],
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: isFirstButtonSelected
                          ? MenuNotesContent(
                              popupPosition: _popupPosition,
                              onPopupMenuOpen: () =>
                                  setState(() => isPopupMenuOpen = true),
                              callPopupMenu: callPopupMenu,
                            )
                          : const MenuScheduleContent(),
                    ),
                  ),
                  isFirstButtonSelected
                      ? Section(
                          child: SizedBox(
                            height: 60.sp,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 40.sp),
                                Text('4 заметок',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(AppIcons.editColored,
                                      width: 24.sp, height: 24.sp),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            if (isPopupMenuOpen) // TODO: не делать размытие на выбранную карточку
              InkWell(
                onTap: onPopupItemTap,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar({
    required this.isFirstButtonSelected,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap,
  });

  final bool isFirstButtonSelected;
  final void Function()? onFirstButtonTap;
  final void Function()? onSecondButtonTap;

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: 'Меню',
      leading: IconButton(
        onPressed: context.router.maybePop,
        icon: Image.asset(AppIcons.arrowBack, width: 20.sp, height: 20.sp),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(110.sp),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.sp),
                    child: Image.asset(
                      AppIcons.search,
                      color: CustomColors.lightGrey,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxWidth: 35.sp,
                    maxHeight: 35.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      backgroundColor: widget.isFirstButtonSelected
                          ? CustomColors.primaryBlue
                          : CustomColors.lightlightGrey,
                      onPressed: widget.onFirstButtonTap,
                      child: Text(
                        'Заметки',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: widget.isFirstButtonSelected
                                      ? CustomColors.primaryWhite
                                      : CustomColors.lightGrey,
                                ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  Expanded(
                    child: PrimaryButton(
                      backgroundColor: !widget.isFirstButtonSelected
                          ? CustomColors.primaryBlue
                          : CustomColors.lightlightGrey,
                      onPressed: widget.onSecondButtonTap,
                      child: Text(
                        'Расписание',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: !widget.isFirstButtonSelected
                                      ? CustomColors.primaryWhite
                                      : CustomColors.lightGrey,
                                ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopUpMenuContent extends StatelessWidget {
  const _PopUpMenuContent({
    required this.title,
    required this.iconPath,
    this.color,
  });

  final String title;
  final String iconPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
        ),
        Image.asset(iconPath, width: 16.sp, height: 16.sp)
      ],
    );
  }
}

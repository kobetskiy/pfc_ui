import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/add_dish_components/share_ingredient/widgets/chat_list.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareIngredientBottomSheet extends StatelessWidget {
  const ShareIngredientBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: CustomColors.lightlightGrey,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.lightGrey,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.sp,
        horizontal: 16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide.none,
      ),
    );
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Переслать',
          child: Section(
            padding: EdgeInsets.symmetric(
              vertical: 10.sp,
              horizontal: 16.sp,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: inputDecoration.copyWith(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 16.sp),
                      child: Image.asset(
                        AppIcons.search,
                        color: CustomColors.lightGrey,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(maxWidth: 40.sp),
                  ),
                ),
                const _TabBar(),
                PrimaryButton(
                  onPressed: context.router.maybePop,
                  child: const Text(''),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TabBar extends StatefulWidget {
  const _TabBar();

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.sp),
          child: _TabBarIcons(tabController: _tabController),
        ),
        SizedBox(
          height: 350.sp,
          child: TabBarView(
            controller: _tabController,
            children: const [
              ChatsList(),
              ChatsList(),
              ChatsList(),
              ChatsList(),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabBarIcons extends StatelessWidget {
  const _TabBarIcons({required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicatorPadding: EdgeInsets.only(bottom: 12.sp),
      dividerHeight: 0.sp,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CustomColors.primaryBlue, width: 3.sp),
        ),
      ),
      // ind
      labelStyle: Theme.of(context).textTheme.titleSmall,
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: CustomColors.lightGrey),
      indicatorColor: CustomColors.primaryBlue,
      controller: tabController,
      tabs: const [
        Tab(text: 'Все чаты'),
        Tab(text: 'Работа'),
        Tab(text: 'Беседы'),
        Tab(text: 'Прочее'),
      ],
    );
  }
}

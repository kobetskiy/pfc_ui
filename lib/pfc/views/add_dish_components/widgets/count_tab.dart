import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountTabs extends StatelessWidget {
  const CountTabs({super.key, required this.title, required this.tabs});

  final String title;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          _TabBar(tabs),
        ],
      ),
    );
  }
}

class _TabBar extends StatefulWidget {
  const _TabBar(this.tabs);

  final List<Widget> tabs;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.sp),
            width: MediaQuery.sizeOf(context).width - 20.sp,
            height: 45,
            decoration: BoxDecoration(
              color: CustomColors.lightlightGrey,
              borderRadius: BorderRadius.circular(30.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
              child: _TabBarIcons(tabController: _tabController),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 320.sp,
                    child: TabBarView(
                        controller: _tabController, children: widget.tabs),
                  ),
                  const AddSomethingRow(title: 'Добавить блюдо')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarIcons extends StatelessWidget {
  const _TabBarIcons({required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: CustomColors.primaryWhite,
        borderRadius: BorderRadius.circular(50.sp),
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorPadding: EdgeInsets.symmetric(horizontal: -40.sp),
      controller: tabController,
      tabs: const [
        Tab(text: '1'),
        Tab(text: '2'),
        Tab(text: '3'),
        Tab(text: '4'),
      ],
    );
  }
}

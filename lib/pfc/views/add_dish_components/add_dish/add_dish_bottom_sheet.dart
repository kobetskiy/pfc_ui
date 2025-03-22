import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/views/add_dish_components/add_dish/widgets/widgets.dart';
import 'package:flutter_app/pfc/views/add_dish_components/create_dish/create_dish_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/add_dish_components/create_food_product/create_food_product_bottom_sheet.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Menu { addDish, addFoodProduct }

class AddDishBottomSheet extends StatefulWidget {
  const AddDishBottomSheet({super.key});

  @override
  State<AddDishBottomSheet> createState() => _AddDishBottomSheetState();
}

class _AddDishBottomSheetState extends State<AddDishBottomSheet>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();
  TabController? _tabController;
  double initialChildSize = 0.5;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() => setState(() {}));
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    setState(() {
      if (_tabController!.index == 3) {
        initialChildSize = 0.8;
      } else {
        initialChildSize = 0.5;
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          action: PopupMenuButton<Menu>(
            color: CustomColors.lightlightGrey,
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp)),
            ),
            icon: Image.asset(
              AppIcons.addColoredOutlined,
              width: 20.sp,
              height: 20.sp,
            ),
            onSelected: (Menu item) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                onTap: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const CreateFoodProductBottomSheet(),
                ),
                value: Menu.addDish,
                child:
                    const _PopUpMenuContent(title: 'Создать продукт питания'),
              ),
              PopupMenuDivider(height: 0.sp),
              PopupMenuItem<Menu>(
                onTap: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const CreateDishBottomSheet(),
                ),
                value: Menu.addFoodProduct,
                child: const _PopUpMenuContent(title: 'Создать блюдо'),
              ),
            ],
          ),
          onBackButtonPressed: context.router.maybePop,
          title: 'Add a dish',
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: HomeSearchTextField(
                    controller: searchController,
                    isBordered: false,
                    onQrCodeTap: () => context.router.push(
                      const ScanQrCodeRoute(),
                    ),
                    hintText: "Search...",
                    prefixPath: AppIcons.search,
                    suffixPath: AppIcons.microphone,
                  ),
                ),
                SizedBox(height: 10.sp),
                Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
                searchController.text.isEmpty
                    ? AddDishTabBar(tabController: _tabController)
                    : const SearchResultsWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PopUpMenuContent extends StatelessWidget {
  const _PopUpMenuContent({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        RoundedButton(scale: 0.8.sp),
      ],
    );
  }
}

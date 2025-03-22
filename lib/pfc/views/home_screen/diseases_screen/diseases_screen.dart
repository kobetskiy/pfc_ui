import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/views/profile_home_section/diseases_screen/disease_bottom_sheet.dart';
import 'package:flutter_app/pfc/views/profile_home_section/diseases_screen/widgets/disease_tile.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const _AppBar(),
          ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.sp),
                const _AddedDiseaseSection(),
                SizedBox(height: 10.sp),
                const _DiseaseListSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiseaseListSection extends StatelessWidget {
  const _DiseaseListSection();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text(
              'Список',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 10.sp),
          const Divider(color: CustomColors.lightlightGrey),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, _) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: DeseaseTile(
                title: 'Сахарный диабет',
                subtitle: '3 стадии',
                onTap: () async => await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      const DiseaseBottomSheet(title: "Сахарный диабет"),
                ),
                icon: Image.asset(
                  AppIcons.arrowForward,
                  width: 16.sp,
                  height: 16.sp,
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(
              color: CustomColors.lightlightGrey,
            ),
          )
        ],
      ),
    );
  }
}

class _AddedDiseaseSection extends StatelessWidget {
  const _AddedDiseaseSection();

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Добавленное',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.sp),
          const SubSection(
            child: DeseaseTile(
              title: 'Сахарный диабет',
              subtitle: 'Преддиабет',
            ),
          ),
          SizedBox(height: 10.sp),
          const SubSection(
            child: DeseaseTile(
              title: 'Сахарный диабет',
              subtitle: 'Сахарный диабет 1 типа',
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

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
    return AppBarWidget(
      title: 'Заболевания',
      leading: IconButton(
        onPressed: context.router.maybePop,
        icon: Image.asset(AppIcons.arrowBack, width: 20.sp, height: 20.sp),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.sp),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
                  prefixIconConstraints: BoxConstraints(
                    maxWidth: 35.sp,
                    maxHeight: 35.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }
}

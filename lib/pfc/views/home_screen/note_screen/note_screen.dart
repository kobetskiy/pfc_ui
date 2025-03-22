// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'choose_chat_bottom_sheet.dart';

@RoutePage()
class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with WidgetsBindingObserver {
  bool _isImageVisible = false;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    _isKeyboardVisible = bottomInset > 0;
    setState(() {});
  }

  void _toggleImageVisibility() {
    _isImageVisible = !_isImageVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const _AppBar(),
                ],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10.sp),
                          Text(
                            'Название заметки',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(width: 10.sp),
                          Image.asset(
                            AppIcons.edit,
                            width: 14.sp,
                            height: 14.sp,
                            color: CustomColors.lightGrey,
                          )
                        ],
                      ),
                      SizedBox(height: 20.sp),
                      TextField(
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: "Напишите текст",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        scrollPadding: const EdgeInsets.all(20.0),
                      ),
                      if (_isImageVisible)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Image.asset(AppImages.menu),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isKeyboardVisible)
              Container(
                width: MediaQuery.sizeOf(context).width,
                color: CustomColors.primaryWhite,
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      AppIcons.formatText,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                    Image.asset(
                      AppIcons.galleryColored,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                    Image.asset(
                      AppIcons.shareColored,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ],
                ),
              )
            else
              Container(
                width: MediaQuery.sizeOf(context).width,
                color: CustomColors.primaryWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10.sp),
                        GestureDetector(
                          onTap: _toggleImageVisibility,
                          child: Image.asset(AppIcons.gallery,
                              width: 50.sp, height: 50.sp),
                        ),
                        SizedBox(height: 10.sp),
                        Text('Добавить фото',
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(height: 30.sp),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10.sp),
                        GestureDetector(
                          onTap: () async => await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const ChooseChatBottomSheet(),
                          ),
                          child: Image.asset(AppIcons.shareBordered,
                              width: 50.sp, height: 50.sp),
                        ),
                        SizedBox(height: 10.sp),
                        Text('Загрузить из чата',
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(height: 30.sp),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20.sp, right: 4.sp),
      sliver: SliverAppBar(
        leadingWidth: 100.sp,
        backgroundColor: CustomColors.lightlightGrey,
        floating: true,
        centerTitle: true,
        leading: Row(
          children: [
            GestureDetector(
              onTap: context.router.maybePop,
              child:
                  Image.asset(AppIcons.arrowBack, width: 20.sp, height: 20.sp),
            ),
            SizedBox(width: 5.sp),
            Text('Заметки', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.upload, width: 20.sp, height: 20.sp),
          ),
        ],
      ),
    );
  }
}

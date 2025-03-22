// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/widgets/app_bar_widget.dart';
import 'package:flutter_app/pfc/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/message_widget.dart';

@RoutePage()
class ChooseMessageScreen extends StatefulWidget {
  const ChooseMessageScreen({super.key});

  @override
  _ChooseMessageScreenState createState() => _ChooseMessageScreenState();
}

class _ChooseMessageScreenState extends State<ChooseMessageScreen> {
  int? _selectedMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.chatBg)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const _AppBar(),
                ],
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.sp),
                      const Center(child: _DateLabel()),
                      SizedBox(height: 12.sp),
                      _buildMessageWithRadio(0,
                          isReply: true, isMyMessage: false),
                      SizedBox(height: 10.sp),
                      _buildMessageWithRadio(1,
                          isReply: false, isMyMessage: true),
                      SizedBox(height: 10.sp),
                      _buildMessageWithRadio(2,
                          isReply: false, isMyMessage: false, hasImage: true),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: CustomColors.primaryWhite,
                  padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 30.sp),
                  child: PrimaryButton(onPressed: () {}, child: const Text('')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageWithRadio(
    int index, {
    required bool isReply,
    required bool isMyMessage,
    bool hasImage = false,
  }) {
    return GestureDetector(
      onTap: () {
        _selectedMessage = index;
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: index == 1
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _CustomRadio(
            isSelected: _selectedMessage == index,
            onTap: () {
              _selectedMessage = index;
              setState(() {});
            },
          ),
          SizedBox(width: 10.sp),
          MessageWidget(
            isReply: isReply,
            isMyMessage: isMyMessage,
            hasImage: hasImage,
          ),
        ],
      ),
    );
  }
}

class _CustomRadio extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _CustomRadio({
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20.sp,
        height: 20.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isSelected ? CustomColors.primaryBlue : CustomColors.mediumGrey,
            width: 2,
          ),
          color: isSelected ? CustomColors.primaryBlue : Colors.transparent,
        ),
        child: isSelected
            ? Center(
                child: Image.asset(
                  AppIcons.check,
                  width: 18.sp,
                  height: 13.sp,
                  color: CustomColors.primaryWhite,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.sp,
        horizontal: 7.sp,
      ),
      decoration: BoxDecoration(
        color: CustomColors.lightGrey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Text(
        '21 января',
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 13.sp, color: CustomColors.primaryWhite),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: 'Выберите сообщение',
      leading: const SizedBox.shrink(),
      actions: [
        TextButton(
          onPressed: context.router.maybePop,
          child: Text(
            'Отмена',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: CustomColors.primaryBlue),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ColorfulStripes(),
              Image.asset(AppIcons.pin, width: 16.sp, height: 16.sp)
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorfulStripes extends StatelessWidget {
  const _ColorfulStripes();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Container(
            width: 2,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: index == 2
                  ? CustomColors.primaryBlue
                  : CustomColors.primaryBlue.withOpacity(0.2),
            ),
          );
        })
            .map((stripe) {
              return Column(
                children: [
                  stripe,
                  const SizedBox(height: 4),
                ],
              );
            })
            .expand((widget) => [widget])
            .toList(),
      ),
    );
  }
}

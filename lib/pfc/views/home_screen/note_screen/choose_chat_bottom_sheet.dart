import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_app/pfc/router/router.dart';
import 'package:flutter_app/pfc/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseChatBottomSheet extends StatelessWidget {
  const ChooseChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.72,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetWidget(
          scrollController: scrollController,
          title: 'Выберите чат',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 10.sp, color: CustomColors.lightlightGrey),
              SizedBox(height: 10.sp),
              const ChatTile(
                showLabels: true,
                checkStatus: CheckStatus.viewed,
                chatParametersList: [
                  ChatParameters.locked,
                  ChatParameters.pinned,
                ],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                showLabels: true,
                checkStatus: CheckStatus.viewed,
                chatParametersList: [ChatParameters.pinned],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                checkStatus: CheckStatus.unviewed,
                chatParametersList: [ChatParameters.none],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                checkStatus: CheckStatus.none,
                chatParametersList: [ChatParameters.newMessage],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                lastMessage: '',
                checkStatus: CheckStatus.unviewed,
                chatParametersList: [ChatParameters.locked],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                checkStatus: CheckStatus.unviewed,
                chatParametersList: [ChatParameters.none],
              ),
              Divider(height: 15.sp, color: CustomColors.lightlightGrey),
              const ChatTile(
                checkStatus: CheckStatus.unviewed,
                chatParametersList: [ChatParameters.none],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    this.showLabels,
    required this.checkStatus,
    required this.chatParametersList,
    this.lastMessage,
  });

  final String? lastMessage;
  final bool? showLabels;
  final CheckStatus checkStatus;
  final List<ChatParameters> chatParametersList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(const ChooseMessageRoute()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.emptyProfilePhoto,
              width: 60.sp,
              height: 60.sp,
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Валерий',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    lastMessage ?? 'Привет, как дела?',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: CustomColors.lightGrey, height: 1.1.sp),
                  ),
                  if (showLabels ?? false)
                    SizedBox(height: 5.sp)
                  else
                    const SizedBox.shrink(),
                  if (showLabels ?? false)
                    Row(
                      children: [
                        const _ColoredLabel(
                          label: 'Ярлык',
                          color: CustomColors.orange,
                        ),
                        SizedBox(width: 10.sp),
                        const _ColoredLabel(
                          label: 'Работа',
                          color: CustomColors.primaryBlue,
                        ),
                      ],
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (checkStatus == CheckStatus.viewed)
                      Image.asset(
                        AppIcons.messageViewed,
                        width: 18.sp,
                        height: 13.sp,
                      ),
                    if (checkStatus == CheckStatus.unviewed)
                      Image.asset(
                        AppIcons.messageUnviewed,
                        width: 18.sp,
                        height: 13.sp,
                      ),
                    if (checkStatus == CheckStatus.none)
                      const SizedBox.shrink(),
                    SizedBox(width: 10.sp),
                    Text(
                      '14:35',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: CustomColors.lightGrey),
                    ),
                  ],
                ),
                SizedBox(height: 10.sp),
                Row(
                  children: _buildIconWidgets(context, chatParametersList),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIconWidgets(
    BuildContext context,
    List<ChatParameters> parameters,
  ) {
    List<Widget> icons = [];
    for (var param in parameters) {
      if (icons.isNotEmpty) {
        icons.add(SizedBox(width: 8.sp));
      }
      switch (param) {
        case ChatParameters.pinned:
          icons.add(Image.asset(AppIcons.pin, width: 16.sp, height: 16.sp));
          break;
        case ChatParameters.locked:
          icons.add(Image.asset(AppIcons.lock, width: 14.sp, height: 16.sp));
          break;
        case ChatParameters.newMessage:
          icons.add(Container(
            width: 18.sp,
            height: 18.sp,
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              color: CustomColors.primaryBlue,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: Text(
                '1',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 12.sp, color: CustomColors.primaryWhite),
              ),
            ),
          ));
          break;
        default:
          break;
      }
    }
    return icons;
  }
}

enum CheckStatus { unviewed, viewed, none }

enum ChatParameters { pinned, locked, newMessage, none }

class _ColoredLabel extends StatelessWidget {
  const _ColoredLabel({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 12.sp, color: CustomColors.primaryWhite),
      ),
    );
  }
}

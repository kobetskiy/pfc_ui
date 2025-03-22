import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isReply,
    required this.isMyMessage,
    this.hasImage,
  });

  final bool isReply;
  final bool isMyMessage;
  final bool? hasImage;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: hasImage ?? false
            ? EdgeInsets.zero
            : EdgeInsets.fromLTRB(8.sp, 8.sp, 8.sp, 2.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.sp),
            topRight: Radius.circular(10.sp),
            bottomLeft:
                isMyMessage ? Radius.circular(10.sp) : Radius.circular(0.sp),
            bottomRight:
                isMyMessage ? Radius.circular(0.sp) : Radius.circular(10.sp),
          ),
        ),
        child: _MessageText(
          isReply: isReply,
          hasImage: hasImage,
          isMyMessage: isMyMessage,
        ),
      ),
    );
  }
}

class _MessageText extends StatelessWidget {
  const _MessageText({
    required this.isReply,
    required this.hasImage,
    required this.isMyMessage,
  });

  final bool isReply;
  final bool? hasImage;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isReply) const _ReplyingMessage(),
        if (hasImage ?? false) const _MessageImages(),
        if (isReply) SizedBox(height: 8.sp),
        Padding(
          padding: hasImage ?? false
              ? EdgeInsets.fromLTRB(12.sp, 6.sp, 12.sp, 3.sp)
              : EdgeInsets.zero,
          child: Text(
            'Just ask - I will do everything for you.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: 'AbhayaLibre', fontStyle: FontStyle.italic),
          ),
        ),
        Padding(
          padding: hasImage ?? false
              ? EdgeInsets.fromLTRB(8.sp, 0.sp, 8.sp, 4.sp)
              : EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '10:03 AM',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: 'AbhayaLibre',
                      color: CustomColors.lightGrey,
                      fontSize: 14.sp,
                      height: hasImage ?? false ? 1.sp : 1.3.sp,
                    ),
              ),
              isMyMessage ? SizedBox(width: 10.sp) : const SizedBox.shrink(),
              isMyMessage
                  ? Image.asset(AppIcons.messageViewed,
                      width: 18.sp, height: 13.sp)
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}

class _MessageImages extends StatelessWidget {
  const _MessageImages();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10.sp),
        topLeft: Radius.circular(10.sp),
      ),
      child: SizedBox(
        height: 300.sp,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 216 / 289,
              child: Expanded(
                child: Image.asset(
                  AppImages.messageImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 3.sp),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 70 / 143,
                      child: Image.asset(
                        AppImages.messageImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.sp),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 70 / 143,
                      child: Image.asset(
                        AppImages.messageImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ReplyingMessage extends StatelessWidget {
  const _ReplyingMessage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: Row(
        children: [
          Container(
            width: 4.sp,
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            decoration: BoxDecoration(
              color: CustomColors.primaryBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.sp),
                bottomLeft: Radius.circular(10.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YouTube',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontFamily: 'AbhayaLibre',
                        fontStyle: FontStyle.italic,
                        color: CustomColors.primaryBlue,
                      ),
                ),
                Text(
                  'I see you!',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontFamily: 'AbhayaLibre'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

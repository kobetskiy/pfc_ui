// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchTextField extends StatefulWidget {
  const HomeSearchTextField({
    super.key,
    this.controller,
    this.onQrCodeTap,
    this.prefixPath,
    this.suffixPath,
    this.prefixColor,
    this.suffixColor,
    this.hintText,
    this.isBordered,
  });

  final TextEditingController? controller;
  final Function()? onQrCodeTap;
  final String? hintText;
  final String? prefixPath;
  final String? suffixPath;
  final Color? prefixColor;
  final Color? suffixColor;
  final bool? isBordered;

  @override
  _HomeSearchTextFieldState createState() => _HomeSearchTextFieldState();
}

class _HomeSearchTextFieldState extends State<HomeSearchTextField>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _widthAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isExpanded = true;
        _controller.forward();
        setState(() {});
      } else {
        isExpanded = false;
        _controller.reverse();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _widthAnimation,
          builder: (context, child) {
            return Expanded(
              flex: (_widthAnimation.value * 100).toInt(),
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
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
                    borderRadius: BorderRadius.circular(15.sp),
                    borderSide: widget.isBordered ?? true
                        ? BorderSide(
                            color: CustomColors.primaryBlue.withOpacity(0.1.sp),
                            width: 1.0.sp,
                          )
                        : BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                    borderSide: BorderSide(
                      color: CustomColors.primaryBlue,
                      width: 1.0.sp,
                    ),
                  ),
                  hintText: widget.hintText,
                  prefixIconConstraints: BoxConstraints(maxWidth: 60.sp),
                  suffixIconConstraints: BoxConstraints(maxWidth: 60.sp),
                  prefixIcon: widget.prefixPath != null
                      ? Padding(
                          padding: EdgeInsets.only(left: 16.sp, right: 12.sp),
                          child: Image.asset(
                            widget.prefixPath!,
                            width: 20.sp,
                            height: 20.sp,
                            color: widget.prefixColor ?? CustomColors.lightGrey,
                          ),
                        )
                      : null,
                  suffixIcon: widget.suffixPath != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 16.sp),
                          child: Image.asset(
                            isExpanded
                                ? AppIcons.closeRounded
                                : widget.suffixPath!,
                            width: 20.sp,
                            height: 20.sp,
                            color: widget.suffixColor ??
                                (isExpanded
                                    ? CustomColors.primaryBlack
                                    : CustomColors.lightGrey),
                          ),
                        )
                      : null,
                ),
              ),
            );
          },
        ),
        isExpanded ? const SizedBox.shrink() : SizedBox(width: 10.sp),
        isExpanded
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: widget.onQrCodeTap,
                child: Container(
                  width: 40.sp,
                  height: 40.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: CustomColors.lightWhite,
                    border: Border.all(
                      color: CustomColors.primaryBlue.withOpacity(0.1),
                      width: 1.0.sp,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Image.asset(AppIcons.qrCode),
                  ),
                ),
              ),
      ],
    );
  }
}

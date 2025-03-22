// ignore_for_file: library_private_types_in_public_api

import 'dart:ui'; // Для использования BackdropFilter

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  bool isTextFieldVisible = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void toggleTextField() {
    setState(() {
      isTextFieldVisible = !isTextFieldVisible;
    });

    if (isTextFieldVisible) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      _focusNode.unfocus();
    }
  }

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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.black87,
          ),
          Positioned(
            left: 12.sp,
            top: 60.sp,
            child: IconButton(
              onPressed: context.router.maybePop,
              icon: Image.asset(
                AppIcons.close,
                width: 20.sp,
                height: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 12.sp,
            bottom: 60.sp,
            child: IconButton(
              onPressed: toggleTextField,
              icon: Image.asset(
                AppIcons.editColored,
                width: 30.sp,
                height: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 12.sp,
            bottom: 60.sp,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppIcons.lightning,
                width: 30.sp,
                height: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 250.sp,
                height: 250.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  border:
                      Border.all(width: 6.sp, color: CustomColors.primaryWhite),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.sp),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Сканировать штрихкод',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: CustomColors.primaryWhite),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isTextFieldVisible)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: isTextFieldVisible ? 0 : -100.sp,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) => toggleTextField(),
                    decoration: inputDecoration.copyWith(
                      contentPadding: EdgeInsets.all(16.sp),
                      hintText: 'Введите номер штрихкода',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

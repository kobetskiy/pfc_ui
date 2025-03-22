// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key});

  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  final _selectedList = List.generate(5, (index) => false);
  final _namesList = ['Luda', 'Ivanova203', 'Irina', 'Natalya', 'Liya'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => _CheckboxTile(
          isSelected: _selectedList[index],
          name: _namesList[index],
          profilePhotoPath: AppImages.fiendsProfilePhotoList[index],
          onTap: () {
            setState(() {
              _selectedList[index] = !_selectedList[index];
            });
          },
        ),
      ),
    );
  }
}

class _CheckboxTile extends StatelessWidget {
  const _CheckboxTile({
    required this.isSelected,
    required this.name,
    required this.profilePhotoPath,
    required this.onTap,
  });

  final bool isSelected;
  final String profilePhotoPath;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 24.sp,
        height: 24.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isSelected ? CustomColors.primaryBlue : CustomColors.lightGrey,
            width: 2.sp,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 12.sp,
                  height: 12.sp,
                  decoration: const BoxDecoration(
                    color: CustomColors.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(profilePhotoPath, width: 52.sp, height: 52.sp),
          SizedBox(width: 10.sp),
          Text(name, style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}

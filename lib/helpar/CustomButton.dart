// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';

class CustomButton extends StatelessWidget {
  String? title;
  void Function()? onTap;
  Widget? widget;
  CustomButton({super.key, this.title, this.onTap, this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.sp,
        width: Get.size.width,
        margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8.sp),
        alignment: Alignment.center,
        child: title != null
            ? Text(
                title ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.openSansMedium,
                  fontSize: 16.sp,
                ),
              )
            : widget,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16.sp),
        ),
      ),
    );
  }
}

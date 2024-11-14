// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:velocity_x/velocity_x.dart';

class TextFieldWidget extends StatelessWidget {
  String? name;
  String? hintText;
  Color? color;
  bool? readOnly;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;

  TextFieldWidget({
    super.key,
    this.hintText,
    this.color,
    this.readOnly,
    this.controller,
    this.name,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? "",
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: FontFamily.openSansBold,
            color: Colors.white,
          ),
        ),
        Container(
          height: 30.sp,
          width: 258.sp,
          margin: EdgeInsets.symmetric(vertical: 10.sp),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly ?? false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansRegular,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.only(bottom: 0, left: 10),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hintText ?? "",
              hintStyle: TextStyle(
                color: Color(0xFF77808D),
                fontFamily: FontFamily.openSansRegular,
                fontSize: 14.sp,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF111217),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(
            //   color: Color(0xFFE6EBF2),
            // ),
          ),
        ),
      ],
    );
  }
}

// playLottieWidget() {
//   return Lottie.asset(
//     "assets/music.json",
//     height: 40.sp,
//     width: 40.sp,
//     fit: BoxFit.fill,
//   );
// }

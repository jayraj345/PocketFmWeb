// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  String? title;
  double? fontSize;
  String? fontFamily;
  Color? textColor;
  TextOverflow? textOverflow;
  double? height;
  TextAlign? textAlign;
  TextDecoration? decoration;
  CommonTextWidget({
    this.title,
    this.fontSize,
    this.fontFamily,
    this.textColor,
    this.textOverflow,
    this.height,
    this.textAlign,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: textColor,
        overflow: textOverflow,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
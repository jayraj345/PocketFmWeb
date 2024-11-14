// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/common_text.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';

class TextfeildWidget1 extends StatelessWidget {
  String? title;
  String? hintText;
  TextEditingController? controller;
  Function(String)? onChanged;
  double? width;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  int? maxLength;
  TextInputType? keyboardType;
  Color? titleColor;
  Color? cursorColor;
  Color? writeTextColor;
  Color? borderColor;
  TextfeildWidget1({
    this.title,
    this.hintText,
    this.controller,
    this.onChanged,
    this.width,
    this.focusNode,
    this.validator,
    this.maxLength,
    this.keyboardType,
    this.titleColor,
    this.cursorColor,
    this.writeTextColor,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          title: title,
          fontSize: 12,
          textColor: titleColor,
          fontFamily: FontFamily.openSansBold,
          textAlign: TextAlign.center,
          height: 0,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextFormField(
          cursorColor: cursorColor,
          validator: validator,
          style: TextStyle(
            fontSize: 15,
            color: writeTextColor,
            fontFamily: FontFamily.openSansMedium,
          ),
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          maxLength: maxLength,
          keyboardType: keyboardType,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: borderColor ?? primaryColor)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: borderColor ?? primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: borderColor ?? primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: borderColor ?? primaryColor)),
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontFamily: FontFamily.openSansMedium,
            ),
          ),
        ),
      ],
    );
  }
}

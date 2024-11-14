// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/helpar/textfield_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171414),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 36.sp,
                width: 148.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor.withOpacity(0.5),
                      primaryColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
              ),
              20.w.widthBox,
            ],
          ),
          60.h.heightBox,
          Container(
            height: 50.sp,
            width: 510.sp,
            child: Row(
              children: [
                10.w.widthBox,
                Row(
                  children: [
                    Image.asset(
                      "assets/user.png",
                      height: 18.sp,
                      width: 18.sp,
                    ),
                    8.w.widthBox,
                    Text(
                      "Account",
                      style: TextStyle(
                        fontFamily: FontFamily.openSansRegular,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                25.w.widthBox,
                Row(
                  children: [
                    Image.asset(
                      "assets/notification.png",
                      height: 18.sp,
                      width: 18.sp,
                    ),
                    8.w.widthBox,
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: FontFamily.openSansRegular,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                25.w.widthBox,
                Row(
                  children: [
                    Image.asset(
                      "assets/lock.png",
                      height: 18.sp,
                      width: 18.sp,
                    ),
                    8.w.widthBox,
                    Text(
                      "Security",
                      style: TextStyle(
                        fontFamily: FontFamily.openSansRegular,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                25.w.widthBox,
                Row(
                  children: [
                    Image.asset(
                      "assets/sort.png",
                      height: 18.sp,
                      width: 18.sp,
                    ),
                    8.w.widthBox,
                    Text(
                      "Appearance",
                      style: TextStyle(
                        fontFamily: FontFamily.openSansRegular,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9).withOpacity(0.12),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          40.h.heightBox,
          Container(
            height: 390.sp,
            width: 570.sp,
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.openSansMedium,
                    fontSize: 16.sp,
                  ),
                ),
                5.h.heightBox,
                Text(
                  "Manage your account details & preference",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.openSansRegular,
                    fontSize: 12.sp,
                  ),
                ),
                40.h.heightBox,
                Row(
                  children: [
                    Text(
                      "Stay Logged in ",
                      style: TextStyle(
                        fontFamily: FontFamily.openSansRegular,
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    200.w.widthBox,
                    SizedBox(
                      height: 15.sp,
                      child: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: primaryColor,
                      ),
                    )
                  ],
                ),
                30.h.heightBox,
                TextFieldWidget(
                  name: "Name",
                  hintText: "Mohit Mishra",
                  color: Color(0xFFD9D9D9).withOpacity(0.14),
                ),
                20.h.heightBox,
                TextFieldWidget(
                  name: "Email",
                  hintText: "mohit@pocketfm.com",
                  color: Color(0xFFD9D9D9).withOpacity(0.14),
                ),
                20.h.heightBox,
                TextFieldWidget(
                  name: "Mobile",
                  hintText: "+91 8249009939",
                  color: Color(0xFFD9D9D9).withOpacity(0.14),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ).pOnly(left: 10.sp),
    );
  }
}

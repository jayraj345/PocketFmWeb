// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/helpar/textfield_widget.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/setting_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key});

  SettingController controller = Get.put(SettingController());

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;

    // Authenticate user with current password
    final authResponse = await Supabase.instance.client.auth.signInWithPassword(
      email: "user@gmail.com",
      password: currentPassword,
    );

    if (authResponse != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Current password is incorrect')),
      );
      return;
    }

    // Update password
    final updateResponse = await Supabase.instance.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );

    print(updateResponse.toString());

    if (updateResponse != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Failed to update password: ${updateResponse}')),
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Password updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171414),
      body: GetBuilder<SettingController>(builder: (context) {
        return Column(
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
              width: 530.sp,
              child: Row(
                children: [
                  10.w.widthBox,
                  InkWell(
                    onTap: () {
                      controller.isSelect = 0;
                      controller.update();
                    },
                    child: Container(
                      height: 40.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: controller.isSelect == 0 ? 20.sp : 0),
                      decoration: BoxDecoration(
                        color: controller.isSelect == 0
                            ? primaryColor.withOpacity(0.40)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
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
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  25.w.widthBox,
                  InkWell(
                    onTap: () {
                      controller.isSelect = 1;
                      controller.update();
                    },
                    child: Container(
                      height: 40.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: controller.isSelect == 1 ? 20.sp : 0),
                      decoration: BoxDecoration(
                        color: controller.isSelect == 1
                            ? primaryColor.withOpacity(0.40)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
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
                    ),
                  ),
                  25.w.widthBox,
                  InkWell(
                    onTap: () {
                      controller.isSelect = 2;
                      controller.update();
                    },
                    child: Container(
                      height: 40.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: controller.isSelect == 2 ? 20.sp : 0),
                      decoration: BoxDecoration(
                        color: controller.isSelect == 2
                            ? primaryColor.withOpacity(0.40)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
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
                    ),
                  ),
                  25.w.widthBox,
                  InkWell(
                    onTap: () {
                      controller.isSelect = 3;
                      controller.update();
                    },
                    child: Container(
                      height: 40.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: controller.isSelect == 3 ? 20.sp : 0),
                      decoration: BoxDecoration(
                        color: controller.isSelect == 3
                            ? primaryColor.withOpacity(0.40)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
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
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.12),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            40.h.heightBox,
            controller.isSelect == 0
                ? accountWidget()
                : controller.isSelect == 1
                    ? notificationWidget()
                    : controller.isSelect == 2
                        ? securityWidget()
                        : Container(),
          ],
        ).pOnly(left: 10.sp);
      }),
    );
  }

  accountWidget() {
    return Container(
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
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  notificationWidget() {
    return Container(
      height: 260.sp,
      width: 570.sp,
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification Preference",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansMedium,
              fontSize: 16.sp,
            ),
          ),
          5.h.heightBox,
          Text(
            "Manage how you receive notifications",
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
                "Email Notifications",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.openSansRegular,
                  fontSize: 14.sp,
                ),
              ),
              150.w.widthBox,
              CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              )
            ],
          ),
          20.h.heightBox,
          Row(
            children: [
              Text(
                "Push Notifications",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.openSansRegular,
                  fontSize: 14.sp,
                ),
              ),
              150.w.widthBox,
              CupertinoSwitch(
                value: false,
                onChanged: (value) {},
              )
            ],
          ),
          20.h.heightBox,
          Row(
            children: [
              Text(
                "SMS Notifications",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.openSansRegular,
                  fontSize: 14.sp,
                ),
              ),
              150.w.widthBox,
              CupertinoSwitch(
                value: false,
                onChanged: (value) {},
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  securityWidget() {
    return Container(
      height: 344.sp,
      width: 650.sp,
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Security Settings",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansMedium,
              fontSize: 16.sp,
            ),
          ),
          5.h.heightBox,
          Text(
            "Manage your account security preference",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansRegular,
              fontSize: 12.sp,
            ),
          ),
          50.h.heightBox,
          Text(
            "Change your Password",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.openSansRegular,
              fontSize: 12.sp,
            ),
          ),
          20.h.heightBox,
          textField(
            controller: _currentPasswordController,
            hintText: "Current Password",
          ),
          textField(
            controller: _newPasswordController,
            hintText: "New Password",
          ),
          textField(
            controller: _confirmPasswordController,
            hintText: "Confirm New Password",
          ),
          20.h.heightBox,
          InkWell(
            onTap: () {
              _changePassword();
            },
            child: Container(
              height: 26.sp,
              width: 80.sp,
              alignment: Alignment.center,
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.openSansRegular,
                  fontSize: 12.sp,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.5),
                    primaryColor,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  textField({TextEditingController? controller, String? hintText}) {
    return Container(
      height: 30.sp,
      width: 258.sp,
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      child: TextFormField(
        controller: controller,
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
            fontSize: 12.sp,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF111217),
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(
        //   color: Color(0xFFE6EBF2),
        // ),
      ),
    );
  }
}

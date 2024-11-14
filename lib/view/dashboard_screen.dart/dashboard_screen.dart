// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/analytics_widget.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/content_widget.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/dashboard_controller.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/dashboard_widget.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/setting_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  final controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    controller.isLoading.value = false;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<DashBoardController>(builder: (_) {
          return Row(
            children: [
              Container(
                width: Get.width * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFF262B27),
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: 100,
                    //   width: Get.width * 0.15,
                    //   alignment: Alignment.center,
                    //   color: Color(0xff363333),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       CommonTextWidget(
                    //         title: "Pocket FM",
                    //         fontSize: 16,
                    //         textColor: Colors.white,
                    //         fontFamily: FontFamily.openSansMedium,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    30.h.heightBox,
                    Image.asset(
                      "assets/POCKETFM.png",
                      width: 124.sp,
                      height: 24.sp,
                    ),
                    SizedBox(height: Get.height * 0.2),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 0;
                        controller.update();
                      },
                      // child: Container(
                      //   height: 50,
                      //   width: Get.width * 0.15,
                      //   alignment: Alignment.centerLeft,
                      //   padding: const EdgeInsets.symmetric(horizontal: 12),
                      //   color: controller.currentIndex.value == 0
                      //       ? primaryColor
                      //       : Color(0xff363333),
                      //   child: CommonTextWidget(
                      //     title: "Category",
                      //     fontSize: 16,
                      //     textColor: Colors.white,
                      //     fontFamily: FontFamily.openSansMedium,
                      //   ),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/dashboard.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          12.w.widthBox,
                          Text(
                            "Dashbord",
                            style: TextStyle(
                              color: controller.currentIndex.value == 0
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 1;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Analytics.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          14.w.widthBox,
                          Text(
                            "Analytics",
                            style: TextStyle(
                              color: controller.currentIndex.value == 1
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 2;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Earning.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          15.w.widthBox,
                          Text(
                            "Earning",
                            style: TextStyle(
                              color: controller.currentIndex.value == 2
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 3;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/vuesax linear headphone.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          15.w.widthBox,
                          Text(
                            "Content",
                            style: TextStyle(
                              color: controller.currentIndex.value == 3
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 4;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Support.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          14.w.widthBox,
                          Text(
                            "Support",
                            style: TextStyle(
                              color: controller.currentIndex.value == 4
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 5;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/setting.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          14.w.widthBox,
                          Text(
                            "Settings",
                            style: TextStyle(
                              color: controller.currentIndex.value == 5
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        controller.currentIndex.value = 6;
                        controller.currentIndex.refresh();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logout.png",
                            height: 17.sp,
                            width: 17.sp,
                          ),
                          14.w.widthBox,
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: controller.currentIndex.value == 6
                                  ? primaryColor
                                  : Color(0xFF999999),
                              fontFamily: FontFamily.openSansMedium,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ),
              // Main content area
              Expanded(
                child: Scaffold(
                  body: controller.currentIndex.value == 0
                      ? DashBoardWidget()
                      : controller.currentIndex.value == 1
                          ? AnalyticsWidget()
                          : controller.currentIndex.value == 3
                              ? ContentWidget()
                              : controller.currentIndex.value == 5
                                  ? SettingWidget()
                                  : Container(
                                      color: Colors.black,
                                    ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

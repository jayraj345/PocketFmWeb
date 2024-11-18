// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/analytics_controller.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/theam_controller.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/linerchart_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class AnalyticsWidget extends StatelessWidget {
  AnalyticsWidget({super.key});

  AnalyticsController controller = Get.put(AnalyticsController());
  ThemeController themeController = Get.find();

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor:
            themeController.isDarkMode.value ? Color(0xFF171414) : Colors.white,
        body: SingleChildScrollView(
          child: GetBuilder<AnalyticsController>(builder: (context) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 277.sp,
                      height: 36.sp,
                      child: TextField(
                        controller: search,
                        onChanged: (value) {
                          controller.update();
                        },
                        style: TextStyle(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          fontFamily: FontFamily.openSansRegular,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 2, left: 10.sp),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          hintText: "Search ...",
                          hintStyle: TextStyle(
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 15.sp,
                            fontFamily: FontFamily.openSansMedium,
                          ),
                          suffixIcon: Image.asset(
                            "assets/search-normal.png",
                            height: 20.sp,
                            width: 20.sp,
                          ).paddingAll(10.sp),
                        ),
                      ),
                    ),
                    20.w.widthBox,
                    Container(
                      height: 36.sp,
                      width: 148.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15.sp,
                          ),
                          5.w.widthBox,
                          Text(
                            "Create new",
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
                Row(
                  children: [
                    30.w.widthBox,
                    Container(
                      height: 300.sp,
                      width: 450.sp,
                      child: Column(
                        children: [
                          15.h.heightBox,
                          Row(
                            children: [
                              15.w.widthBox,
                              Expanded(
                                child: Text(
                                  "Most Popular Categories",
                                  style: TextStyle(
                                    color: themeController.isDarkMode.value
                                        ? Color(0xFFD9D9D9)
                                        : Colors.black,
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              Image.asset(
                                "assets/vuesax linear headphone.png",
                                height: 34.sp,
                                width: 34.sp,
                                color: primaryColor,
                              ),
                              15.w.widthBox,
                            ],
                          ),
                          30.h.heightBox,
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.category.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Visibility(
                                  visible: controller.category[index].name
                                      .toLowerCase()
                                      .contains(search.text),
                                  child: Row(
                                    children: [
                                      15.w.widthBox,
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          controller.category[index].name,
                                          style: TextStyle(
                                            color:
                                                themeController.isDarkMode.value
                                                    ? Color(0xFFD9D9D9)
                                                    : Colors.black,
                                            fontFamily:
                                                FontFamily.openSansRegular,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "8700 Plays",
                                          style: TextStyle(
                                            color:
                                                themeController.isDarkMode.value
                                                    ? Color(0xFFD9D9D9)
                                                    : Colors.black,
                                            fontFamily:
                                                FontFamily.openSansRegular,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "6.9K ",
                                              style: TextStyle(
                                                color: themeController
                                                        .isDarkMode.value
                                                    ? Color(0xFFD9D9D9)
                                                    : Colors.black,
                                                fontFamily:
                                                    FontFamily.openSansRegular,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/download.png",
                                              height: 18.sp,
                                              width: 18,
                                              color: themeController
                                                      .isDarkMode.value
                                                  ? null
                                                  : Colors.black,
                                            ),
                                            15.w.widthBox,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).pOnly(top: 25.sp),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? Color(0xFF221f1f)
                            : Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    ),
                    20.w.widthBox,
                    Container(
                      height: 300.sp,
                      width: 230.sp,
                      child: Column(
                        children: [
                          10.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "70",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: FontFamily.openSansBold,
                                  fontSize: 50.sp,
                                ),
                              ),
                              15.w.widthBox,
                              Text(
                                "Live Streams\n3.4k Views",
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFFD9D9D9)
                                      : Colors.black,
                                  fontFamily: FontFamily.openSansRegular,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          20.h.heightBox,
                          Container(
                            height: 80.sp,
                            width: Get.size.width,
                            child: Column(
                              children: [
                                Text(
                                  "04 Mins",
                                  style: TextStyle(
                                    fontFamily: FontFamily.openSansBold,
                                    fontSize: 38.sp,
                                    color: Color(0xFF999999).withOpacity(0.530),
                                  ),
                                ),
                                Text(
                                  "Avg. Views",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.23),
                            ),
                          ),
                          30.h.heightBox,
                          Row(
                            children: [
                              25.w.widthBox,
                              Expanded(
                                child: Text(
                                  "Likes",
                                  style: TextStyle(
                                    color: themeController.isDarkMode.value
                                        ? Color(0xFF999999)
                                        : Colors.black,
                                    fontFamily: FontFamily.openSansLight,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "34k",
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFF999999)
                                      : Colors.black,
                                  fontFamily: FontFamily.openSansLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                              30.w.widthBox,
                            ],
                          ),
                          15.h.heightBox,
                          Row(
                            children: [
                              25.w.widthBox,
                              Expanded(
                                child: Text(
                                  "shares",
                                  style: TextStyle(
                                    color: themeController.isDarkMode.value
                                        ? Color(0xFF999999)
                                        : Colors.black,
                                    fontFamily: FontFamily.openSansLight,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "5.2k",
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFF999999)
                                      : Colors.black,
                                  fontFamily: FontFamily.openSansLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                              30.w.widthBox,
                            ],
                          ),
                          15.h.heightBox,
                          Row(
                            children: [
                              25.w.widthBox,
                              Expanded(
                                child: Text(
                                  "comments",
                                  style: TextStyle(
                                    color: themeController.isDarkMode.value
                                        ? Color(0xFF999999)
                                        : Colors.black,
                                    fontFamily: FontFamily.openSansLight,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "2.4k",
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFF999999)
                                      : Colors.black,
                                  fontFamily: FontFamily.openSansLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                              30.w.widthBox,
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? Color(0xFF221f1f)
                            : Colors.white,
                        border: Border.all(color: Color(0xFF221f1f)),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    ),
                    20.w.widthBox,
                    Column(
                      children: [
                        Container(
                          height: 200.sp,
                          width: 230.sp,
                          child: Column(
                            children: [
                              40.h.heightBox,
                              Text(
                                "Downloads",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                  fontFamily: FontFamily.openSansRegular,
                                ),
                              ),
                              50.h.heightBox,
                              Text(
                                "4.5k",
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: FontFamily.openSansBold,
                                  fontSize: 40.sp,
                                ),
                              ),
                              5.h.heightBox,
                              Text(
                                "Audiobooks",
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: FontFamily.openSansRegular,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: themeController.isDarkMode.value
                                ? Color(0xFF221f1f)
                                : Colors.white,
                            border: Border.all(color: Color(0xFF221f1f)),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                        10.h.heightBox,
                        Container(
                          height: 90.sp,
                          width: 230.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Playback\nHours",
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: FontFamily.openSansRegular,
                                  fontSize: 18.sp,
                                ),
                              ),
                              30.w.widthBox,
                              Text(
                                "38k",
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: FontFamily.openSansMedium,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: themeController.isDarkMode.value
                                ? Color(0xFF221f1f)
                                : Colors.white,
                            border: Border.all(color: Color(0xFF221f1f)),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                20.h.heightBox,
                Container(
                  height: 220.sp,
                  width: Get.size.width,
                  padding: EdgeInsets.all(20.sp),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30.sp, right: 100.sp),
                  child: SmoothLineChart(),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                ),
                30.h.heightBox,
              ],
            );
          }),
        ),
      );
    });
  }
}

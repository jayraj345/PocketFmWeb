// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/view/category/add_category_screen.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/chart_widget.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/dashboard_controller.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/theam_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoardWidget extends StatelessWidget {
  DashBoardWidget({super.key});

  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(() {
      return Scaffold(
        backgroundColor:
            themeController.isDarkMode.value ? Color(0xFF171414) : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 277.sp,
                    height: 36.sp,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 2, left: 10.sp),
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
                  InkWell(
                    onTap: () {
                      Get.to(AddCategoryScreen());
                    },
                    child: Container(
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
                            themeController.isDarkMode.value
                                ? primaryColor.withOpacity(0.5)
                                : Colors.black,
                            primaryColor,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                    ),
                  ),
                  20.w.widthBox,
                ],
              ),
              60.h.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 134,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        10.w.widthBox,
                                        Expanded(
                                          child: Text(
                                            "Total Streams",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  FontFamily.openSansRegular,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                        10.w.widthBox,
                                        Image.asset(
                                          "assets/vuesax linear headphone.png",
                                          height: 34.sp,
                                          width: 34.sp,
                                          color:
                                              !themeController.isDarkMode.value
                                                  ? Colors.white
                                                  : null,
                                        ),
                                        20.w.widthBox,
                                      ],
                                    ),
                                    5.h.heightBox,
                                    Text(
                                      "2000",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.openSansBold,
                                        fontSize: 26.sp,
                                      ),
                                    ).pOnly(left: 10.sp)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFFF6F6F6).withOpacity(0.14)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 134,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        10.w.widthBox,
                                        Expanded(
                                          child: Text(
                                            "Total Users",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  FontFamily.openSansRegular,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                        10.w.widthBox,
                                        Image.asset(
                                          "assets/profile-user.png",
                                          height: 34.sp,
                                          width: 34.sp,
                                          color:
                                              !themeController.isDarkMode.value
                                                  ? Colors.white
                                                  : null,
                                        ),
                                        20.w.widthBox,
                                      ],
                                    ),
                                    5.h.heightBox,
                                    Text(
                                      "10435",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.openSansBold,
                                        fontSize: 26.sp,
                                      ),
                                    ).pOnly(left: 10.sp)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFF34C759).withOpacity(0.10)
                                      : primaryColor,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 134,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        10.w.widthBox,
                                        Expanded(
                                          child: Text(
                                            "Earning",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  FontFamily.openSansRegular,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                        10.w.widthBox,
                                        Image.asset(
                                          "assets/trade.png",
                                          height: 34.sp,
                                          width: 34.sp,
                                          color:
                                              !themeController.isDarkMode.value
                                                  ? Colors.white
                                                  : null,
                                        ),
                                        20.w.widthBox,
                                      ],
                                    ),
                                    5.h.heightBox,
                                    Text(
                                      "₹4000",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.openSansBold,
                                        fontSize: 26.sp,
                                      ),
                                    ).pOnly(left: 10.sp)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: themeController.isDarkMode.value
                                      ? Color(0xFFF6F6F6).withOpacity(0.14)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 360.sp,
                          width: Get.size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: BarChartSample(),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500.sp,
                    width: 236.sp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        10.h.heightBox,
                        Text(
                          "Recently Added",
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? Color(0xFF999999)
                                : Colors.black,
                            fontFamily: FontFamily.openSansRegular,
                            fontSize: 16.sp,
                          ),
                        ),
                        30.h.heightBox,
                        Expanded(
                          child: ListView.builder(
                            itemCount: dashBoardController.storyList.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  10.w.widthBox,
                                  Expanded(
                                    child: Text(
                                      dashBoardController
                                          .storyList[index].storyName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: FontFamily.openSansRegular,
                                        color: themeController.isDarkMode.value
                                            ? Color(0xFF999999)
                                            : Colors.black,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  10.w.widthBox,
                                  Text(
                                    "01 episode",
                                    style: TextStyle(
                                      fontFamily: FontFamily.openSansRegular,
                                      color: themeController.isDarkMode.value
                                          ? Color(0xFF999999)
                                          : Colors.black,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  10.w.widthBox,
                                ],
                              ).pOnly(top: 15.sp);
                            },
                          ),
                        ),
                        Divider(
                          color: primaryColor,
                        ),
                        Row(
                          children: [
                            8.w.widthBox,
                            Expanded(
                              child: Text(
                                "Flagged",
                                style: TextStyle(
                                    color: themeController.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: FontFamily.openSansMedium,
                                    fontSize: 12.sp),
                              ),
                            ),
                            Image.asset(
                              "assets/right-arrow.png",
                              height: 20.sp,
                              width: 20.sp,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            8.w.widthBox,
                          ],
                        ),
                        20.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "300",
                              style: TextStyle(
                                fontFamily: FontFamily.openSansBold,
                                fontSize: 25.sp,
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ).pOnly(left: 8.sp),
                          ],
                        ),
                        20.h.heightBox,
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  )
                ],
              ),
              50.h.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "567 Pending Issues ",
                          style: TextStyle(
                              fontFamily: FontFamily.openSansRegular,
                              color: themeController.isDarkMode.value
                                  ? Color(0xFF999999)
                                  : Colors.black,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40.sp,
                    width: 1,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "5000 Coins Donated",
                          style: TextStyle(
                              fontFamily: FontFamily.openSansRegular,
                              color: themeController.isDarkMode.value
                                  ? Color(0xFF999999)
                                  : Colors.black,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40.sp,
                    width: 1,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "3000 Likes Sent",
                          style: TextStyle(
                              fontFamily: FontFamily.openSansRegular,
                              color: themeController.isDarkMode.value
                                  ? Color(0xFF999999)
                                  : Colors.black,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              60.h.heightBox,
            ],
          ),
        ),
      );
    });
  }
}

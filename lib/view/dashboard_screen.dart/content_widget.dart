// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/dashboard_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class ContentWidget extends StatelessWidget {
  ContentWidget({super.key});

  DashBoardController controller = Get.put(DashBoardController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171414),
      body: SingleChildScrollView(
        child: GetBuilder<DashBoardController>(builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 277.sp,
                    height: 36.sp,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        controller.update();
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamily.openSansRegular,
                      ),
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(bottom: 2, left: 10.sp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        hintText: "Search ...",
                        hintStyle: TextStyle(
                          color: Colors.white,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.w.widthBox,
                  Expanded(
                    child: Container(
                      height: 620.sp,
                      child: Column(
                        children: [
                          20.h.heightBox,
                          Row(
                            children: [
                              20.w.widthBox,
                              Expanded(
                                child: Text(
                                  "All Audiobooks",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 16.sp,
                                    fontFamily: FontFamily.openSansRegular,
                                  ),
                                ),
                              ),
                              Container(
                                height: 35.sp,
                                width: 77.sp,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontFamily: FontFamily.openSansLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    5.w.widthBox,
                                    Image.asset(
                                      "assets/Arrowdown.png",
                                      height: 8.sp,
                                      width: 8.sp,
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                              15.w.widthBox,
                              InkWell(
                                onTap: () {
                                  controller.isShort = !controller.isShort;
                                  controller.eventList =
                                      controller.eventList.reversed.toList();
                                  controller.update();
                                },
                                child: Container(
                                  height: 35.sp,
                                  width: 77.sp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sort",
                                        style: TextStyle(
                                          color: controller.isShort
                                              ? Colors.white
                                              : Color(0xFF999999),
                                          fontFamily: FontFamily.openSansLight,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      5.w.widthBox,
                                      Image.asset(
                                        "assets/Arrowdown.png",
                                        height: 8.sp,
                                        width: 8.sp,
                                        color: controller.isShort
                                            ? Colors.white
                                            : null,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: controller.isShort
                                        ? primaryColor
                                        : Color(0xFFD9D9D9).withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                ),
                              ),
                              20.w.widthBox,
                            ],
                          ),
                          70.h.heightBox,
                          Row(
                            children: [
                              30.w.widthBox,
                              SizedBox(
                                width: 130.sp,
                                child: Text(
                                  "Title",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160.sp,
                                child: Text(
                                  "Type",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Status",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "Actions",
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: FontFamily.openSansRegular,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.eventList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Visibility(
                                  visible: controller.eventList[index].eventName
                                      .contains(searchController.text),
                                  child: Row(
                                    children: [
                                      30.w.widthBox,
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          controller.eventList[index].eventName,
                                          style: TextStyle(
                                            color: Color(0xFF999999),
                                            fontFamily:
                                                FontFamily.openSansRegular,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          "Audiobook",
                                          style: TextStyle(
                                            color: Color(0xFF999999),
                                            fontFamily:
                                                FontFamily.openSansRegular,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: controller
                                                    .eventList[index].status ==
                                                "Approve"
                                            ? Image.asset(
                                                "assets/tick-square.png",
                                                height: 24.sp,
                                                width: 24.sp,
                                              )
                                            : controller.eventList[index]
                                                        .status ==
                                                    "Reject"
                                                ? Image.asset(
                                                    "assets/close-status.png",
                                                    height: 24.sp,
                                                    width: 24.sp,
                                                  )
                                                : SizedBox(),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            20.w.widthBox,
                                            InkWell(
                                              onTap: () {
                                                if (controller.eventList[index]
                                                        .status ==
                                                    "pending") {
                                                  controller.updateStatus(
                                                      controller
                                                          .eventList[index]
                                                          .eventId,
                                                      "Approve");
                                                }
                                              },
                                              child: Container(
                                                height: 32.sp,
                                                width: 120,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.sp),
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    controller.eventList[index]
                                                                    .status !=
                                                                "Approve" ||
                                                            controller
                                                                    .eventList[
                                                                        index]
                                                                    .status !=
                                                                "Reject"
                                                        ? Image.asset(
                                                            "assets/right_Arrow.png",
                                                            height: 24.sp,
                                                            width: 24.sp,
                                                          )
                                                        : SizedBox(),
                                                    Text(
                                                      controller
                                                                  .eventList[
                                                                      index]
                                                                  .status ==
                                                              "pending"
                                                          ? "Approve"
                                                          : "View Details",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF999999),
                                                        fontFamily: FontFamily
                                                            .openSansRegular,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  color: controller
                                                              .eventList[index]
                                                              .status ==
                                                          "Approve"
                                                      ? primaryColor
                                                          .withOpacity(0.30)
                                                      : controller
                                                                  .eventList[
                                                                      index]
                                                                  .status ==
                                                              "Reject"
                                                          ? Color(0xFF4b3e13)
                                                          : primaryColor
                                                              .withOpacity(
                                                                  0.30),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.sp),
                                                ),
                                              ),
                                            ),
                                            10.w.widthBox,
                                            controller.eventList[index]
                                                        .status ==
                                                    "pending"
                                                ? InkWell(
                                                    onTap: () {
                                                      controller.updateStatus(
                                                          controller
                                                              .eventList[index]
                                                              .eventId,
                                                          "Reject");
                                                    },
                                                    child: Container(
                                                      height: 32.sp,
                                                      width: 99,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/close-square.png",
                                                            height: 24.sp,
                                                            width: 24.sp,
                                                          ),
                                                          Text(
                                                            "Reject",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF999999),
                                                              fontFamily: FontFamily
                                                                  .openSansRegular,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF4b3e13),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.sp),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        color: Color(0xFF999999),
                                      ),
                                      10.w.widthBox,
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  10.w.widthBox,
                  Column(
                    children: [
                      Container(
                        height: 154.sp,
                        width: 239.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.h.heightBox,
                            Text(
                              "Flagged content",
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontFamily: FontFamily.openSansRegular,
                                fontSize: 16.sp,
                              ),
                            ).pOnly(left: 15.sp),
                            40.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "23",
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 40.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff5c3434),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      20.h.heightBox,
                      Container(
                        height: 154.sp,
                        width: 239.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.h.heightBox,
                            Text(
                              "Pending Approval",
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontFamily: FontFamily.openSansRegular,
                                fontSize: 16.sp,
                              ),
                            ).pOnly(left: 15.sp),
                            40.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.pendingEvent.length.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontFamily: FontFamily.openSansRegular,
                                    fontSize: 40.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff77621b),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      20.h.heightBox,
                      Container(
                        height: 300,
                        width: 239.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.h.heightBox,
                            Text(
                              "Total Content  ",
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontFamily: FontFamily.openSansRegular,
                                fontSize: 16.sp,
                              ),
                            ).pOnly(left: 15.sp),
                            40.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      controller.eventList.length.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontFamily: FontFamily.openSansRegular,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                    Text(
                                      "Audiobooks",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontFamily: FontFamily.openSansRegular,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            40.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "1122",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontFamily: FontFamily.openSansRegular,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                    Text(
                                      "Podcasts",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontFamily: FontFamily.openSansRegular,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff252222),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    ],
                  ),
                  10.w.widthBox,
                ],
              ),
              20.h.heightBox,
            ],
          );
        }),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/text_feild.dart';
import 'package:pocket_fm_web/view/category/controller/category_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171414),
      appBar: AppBar(
        backgroundColor: Color(0xFF171414),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Add Category",
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
            color: Color(0xFF171414),
          ),
          Container(
            height: Get.size.height * 0.476,
            width: Get.size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: controller.fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      "Upload Image",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                10.h.heightBox,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Container(
                      height: 50.sp,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/upload.png",
                        color: primaryColor,
                        height: 15.sp,
                        width: 15.sp,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                20.h.heightBox,
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextfeildWidget1(
                      controller: controller.name,
                      title: "Category Name ",
                      hintText: "Enter Category Name",
                      borderColor: primaryColor,
                      cursorColor: primaryColor,
                      titleColor: primaryColor,
                      writeTextColor: primaryColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Category Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                50.h.heightBox,
                Center(
                  child: InkWell(
                    onTap: () {
                      if (controller.fromkey.currentState?.validate() ??
                          false) {
                        controller.addCagegory();
                      }
                    },
                    child: Container(
                      height: 40.sp,
                      width: 150.sp,
                      alignment: Alignment.center,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.sp),
                        color: primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

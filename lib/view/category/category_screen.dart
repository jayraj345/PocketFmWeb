// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/view/category/add_category_screen.dart';
import 'package:pocket_fm_web/view/category/controller/category_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: SizedBox(),
        title: Text(
          "Category",
          style: TextStyle(
            color: Colors.white,
            fontSize: 8.sp,
            fontFamily: FontFamily.openSansMedium,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(AddCategoryScreen());
            },
            child: Container(
              height: 10.sp,
              width: 50.sp,
              alignment: Alignment.center,
              child: Text(
                "Add Category",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.sp),
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<CategoryController>(
        initState: (state) {
          controller.getCetegory();
        },
        builder: (context) {
          return ListView.builder(
            itemCount: controller.category.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 15.sp,
                width: Get.size.width,
                margin: EdgeInsets.all(3.sp),
                child: Row(
                  children: [
                    2.w.widthBox,
                    Container(
                      height: 12.sp,
                      width: 12.sp,
                      alignment: Alignment.center,
                      child: Text(
                        controller.category[index].name[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontFamily.openSansRegular,
                          fontSize: 4.sp,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff363333),
                      ),
                    ),
                    2.w.widthBox,
                    Text(
                      controller.category[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamily.openSansRegular,
                        fontSize: 4.sp,
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(5),
                  color: primaryColor.withOpacity(0.12),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

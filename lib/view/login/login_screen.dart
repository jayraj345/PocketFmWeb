// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/common_text.dart';
import 'package:pocket_fm_web/helpar/fontfamily.dart';
import 'package:pocket_fm_web/helpar/text_feild.dart';
import 'package:pocket_fm_web/view/login/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/bg.jpg"),
            ),
          ),
          child: Form(
            key: controller.fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CommonTextWidget(
                  title: "Admin LogIn",
                  fontSize: 24,
                  textColor: Colors.white,
                  fontFamily: FontFamily.openSansBold,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextfeildWidget1(
                    controller: controller.email,
                    title: "Email address",
                    hintText: "Enter Email address",
                    borderColor: primaryColor,
                    cursorColor: primaryColor,
                    titleColor: primaryColor,
                    writeTextColor: primaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextfeildWidget1(
                    controller: controller.password,
                    title: "Password",
                    hintText: "Enter password",
                    borderColor: primaryColor,
                    cursorColor: primaryColor,
                    titleColor: primaryColor,
                    writeTextColor: primaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Obx(() {
                  return InkWell(
                    onTap: () {
                      if (controller.fromKey.currentState?.validate() ??
                          false) {
                        controller.userLogin();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft,
                          tileMode: TileMode.repeated,
                          transform: const GradientRotation(2),
                          stops: const [0.1, 0.7],
                          colors: <Color>[
                            primaryColor.withOpacity(0.8),
                            primaryColor,
                          ],
                        ),
                      ),
                      child: controller.isLoading.value
                          ? CommonTextWidget(
                              title: "Log In",
                              fontFamily: FontFamily.openSansBold,
                              fontSize: 16,
                              textColor: Colors.white,
                            )
                          : CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

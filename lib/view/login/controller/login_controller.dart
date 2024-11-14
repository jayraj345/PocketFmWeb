import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/colors.dart';
import 'package:pocket_fm_web/helpar/route_helpar.dart';
import 'package:pocket_fm_web/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController(text: 'user@gmail.com');
  TextEditingController password = TextEditingController(text: 'user123');
  User? user;
  RxBool isLoading = true.obs;
  var fromKey = GlobalKey<FormState>();
  userLogin() async {
    try {
      if (email.text.trim() == "") {
        Get.snackbar(
          "Alert",
          "Please Enter Your Email!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else if (password.text.trim() == "") {
        Get.snackbar(
          "Alert",
          "Please Enter Your Password!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        isLoading.value = false;
        isLoading.refresh();
        final response = await Supabase.instance.client.auth.signInWithPassword(
          email: email.text,
          password: password.text,
        );
        if (response.user != null) {
          user = response.user;
          Get.snackbar(
            "Success",
            "User Login Successfully!",
            colorText: Colors.white,
            backgroundColor: primaryColor,
          );
          print("******************${user?.email}");
          print("******************${user?.appMetadata}");
          print("******************${user?.userMetadata?['name']}");
          prefer?.setBool("isLogin", true);
          prefer?.setString("id", user?.id ?? "");
          prefer?.setString("email", user?.email ?? "");
          prefer?.setString("name", user?.userMetadata?['name'] ?? "");
          isLoading.value = true;
          isLoading.refresh();
          Get.offAllNamed(Routes.dashBoardScreen);
        } else {
          isLoading.value = true;
          isLoading.refresh();
          Get.snackbar(
            "Alert",
            "Please Enter Valid Credentials!",
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
      }
    } catch (e) {
      isLoading.value = true;
      isLoading.refresh();
      debugPrint(e.toString());
    }
  }
}

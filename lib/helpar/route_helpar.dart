// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/dashboard_screen.dart';
import 'package:pocket_fm_web/view/login/login_screen.dart';

class Routes {
  static String initialRoute = "/";
  static String splashScreenOne = "/splashScreenOne";
  static String loginScreen = "/loginScreen";
  static String otpScreen = "/otpScreen";
  static String userDetailsScreen = "/userDetailsScreen";
  static String selectCategoryScreen = "/selectCategoryScreen";
  static String forgotPassword = "/forgotPassword";

  static String dashBoardScreen = "/dashBoardScreen";
}

final getPages = [
  // GetPage(
  //   name: Routes.initialRoute,
  //   page: () => SpleshScreen(),
  // ),
  // GetPage(
  //   name: Routes.userDetailsScreen,
  //   page: () => UserDetailsScreen(),
  // ),
  // GetPage(
  //   name: Routes.selectCategoryScreen,
  //   page: () => SelectCategoryScreen(),
  // ),
  // GetPage(
  //   name: Routes.otpScreen,
  //   page: () => OtpScreen(),
  // ),
  GetPage(
    name: Routes.initialRoute,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: Routes.dashBoardScreen,
    page: () => DashBoardScreen(),
  ),
];

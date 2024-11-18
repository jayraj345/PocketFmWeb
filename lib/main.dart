// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/helpar/route_helpar.dart';
import 'package:pocket_fm_web/helpar/supabase_info.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/theam_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefer = await SharedPreferences.getInstance();

  SupabaseConfig.initialize();
  ThemeController themeController = Get.put(ThemeController());
  runApp(
    ScreenUtilInit(
      designSize: Size(1280, 832),
      builder: (context, child) {
        return GetMaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          darkTheme: ThemeData.dark(),
          themeMode: Get.find<ThemeController>().theme,
          initialRoute: (prefer?.getBool("isLogin") ?? false)
              ? Routes.dashBoardScreen
              : Routes.initialRoute,
          // home: LoginScreen(),
          getPages: getPages,
        );
      },
    ),
  );
}

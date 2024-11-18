import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/main.dart';

class ThemeController extends GetxController {
  // final _box = GetStorage();
  final _key = 'isDarkMode';
  var isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadThemeFromBox();
  }

  bool _loadThemeFromBox() {
    print("--------" + (prefer?.getBool(_key) ?? false).toString());
    return prefer?.getBool(_key) ?? false;
  }

  void _saveThemeToBox(bool isDarkMode) {
    prefer?.setBool(_key, isDarkMode);
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    print(isDarkMode.value.toString());
    _saveThemeToBox(isDarkMode.value);
  }
}

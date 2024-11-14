import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/category/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnalyticsController extends GetxController {
  SupabaseClient supabase = Supabase.instance.client;
  List<Category> category = [];
  getCategoryList() async {
    try {
      final response = await supabase.from('category').select();
      print(response.toString());
      category.clear();
      category = response
          .map((json) => Category.fromJson(json as Map<String, dynamic>))
          .toList()
          .cast<Category>();

      update();
      log(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }
}

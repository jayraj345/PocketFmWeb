import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/category/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryController extends GetxController {
  bool isLoading = true;
  SupabaseClient supabase = Supabase.instance.client;
  TextEditingController name = TextEditingController();
  List<Category> category = [];

  var fromkey = GlobalKey<FormState>();
  getCetegory() async {
    try {
      isLoading = false;
      final response = await supabase.from('category').select();
      category.clear();
      category = response.map((json) => Category.fromJson(json)).toList();
      isLoading = true;
      update();
      log(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  addCagegory() async {
    try {
      isLoading = false;
      final response =
          await supabase.from('category').insert({"name": name.text});
      log(response.toString());
      getCetegory();
      name.clear();
      Get.back();
      isLoading = true;
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  File? imageFile;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      imageFile = File(result.files.single.path ?? "");
      update();
    }
  }
}

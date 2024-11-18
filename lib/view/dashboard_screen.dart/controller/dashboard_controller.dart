// ignore_for_file: unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/model/event_info.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/model/story_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoardController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt currentIndex = 0.obs;
  int totalUser = 0;

  bool isShort = false;
  List<Event> eventList = [];
  List<Story> storyList = [];

  List pendingEvent = [];

  getAllBookingEvent() {
    try {
      Supabase.instance.client
          .from('BookingEvent')
          .stream(primaryKey: ['id']).listen((data) {
        print('New Live: ${data.toString()}');
        eventList.clear();
        eventList = data.map((json) => Event.fromJson(json)).toList();
        pendingEvent.clear();
        for (var element in eventList) {
          if (element.status == "pending") {
            pendingEvent.add(element);
            update();
          } else if (element.status == "") {}
        }
        update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateStatus(String id, String newStatus) async {
    final response = await Supabase.instance.client
        .from('BookingEvent')
        .update({'status': newStatus})
        .eq('event_id', id)
        .execute();
    getAllBookingEvent();
    if (response != null) {
      print('Error updating status: ${response}');
    } else {
      print('Status updated successfully');
    }
  }

  Future<void> fetchLatest10Rows() async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase
          .from('series')
          .select()
          .order('id', ascending: false)
          .limit(10);

      if (response != null && response.isNotEmpty) {
        storyList.clear();
        storyList = response
            .map((json) => Story.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<Story>();
        update();
      } else {
        print('No rows found');
      }
    } catch (e) {
      print('Error fetching rows: $e');
    }
  }

  Future<void> getUserCount() async {
    final supabase = Supabase.instance.client;

    try {
      // final response = await supabase
      //     .from('users')
      //     .select('*', const FetchOptions(count: CountOption.exact))
      //     .execute();

      final response = await supabase.auth.admin.listUsers();
      // final totalUsers = response.users.length;

      // final userCount = response.count;
      print("Total User Count: ${response.toString()}");
    } catch (e) {
      print("Error fetching user count: $e");
    }
  }

  @override
  void onInit() {
    fetchLatest10Rows();
    getAllBookingEvent();
    getUserCount();
    super.onInit();
  }
}

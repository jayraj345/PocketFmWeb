// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/model/event_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoardController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt currentIndex = 0.obs;

  bool isShort = false;
  List<Event> eventList = [];

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

  @override
  void onInit() {
    getAllBookingEvent();
    super.onInit();
  }
}

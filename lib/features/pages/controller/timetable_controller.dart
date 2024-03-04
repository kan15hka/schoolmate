import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/loaders/loaders.dart';
import 'package:schoolmate/data/repositories/circular_repository.dart';
import 'package:schoolmate/features/student/model/message_notif_model.dart';

class TimeTableController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static TimeTableController get instance => Get.find();

  //Variables
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: "MON"),
    Tab(text: "TUE"),
    Tab(text: "WED"),
    Tab(text: "THU"),
    Tab(text: "FRI"),
    Tab(text: "SAT"),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

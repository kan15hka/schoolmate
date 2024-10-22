import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeTableController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static TimeTableController get instance => Get.find();

  //Variables
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(text: "MON"),
    const Tab(text: "TUE"),
    const Tab(text: "WED"),
    const Tab(text: "THU"),
    const Tab(text: "FRI"),
    const Tab(text: "SAT"),
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

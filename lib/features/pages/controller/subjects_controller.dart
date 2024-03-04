import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static SubjectsController get instance => Get.find();
  //Variables
  late TabController tabController;
  final List<String> tabTexts = ["Overall", "Tests", "Exams"];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabTexts.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

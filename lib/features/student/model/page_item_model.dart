import 'package:flutter/material.dart';

class PageItemModel {
  String title;
  String iconUrl;
  Widget widget;
  // Constructor
  PageItemModel(
      {required this.title, required this.iconUrl, required this.widget});
}

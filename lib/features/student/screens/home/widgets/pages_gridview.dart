import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/card/page_item_card.dart';
import 'package:schoolmate/features/student/controllers/home_controller.dart';

class PagesGridview extends StatelessWidget {
  const PagesGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Wrap(
        children: controller.homePageItems.map((pageItem) {
          return PageItemCard(
              onTap: () => Get.to(() => pageItem.widget),
              index: controller.homePageItems.indexOf(pageItem),
              title: pageItem.title,
              iconUrl: pageItem.iconUrl);
        }).toList(),
      ),
    );
  }
}

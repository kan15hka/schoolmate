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
      // child: GridView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   padding: const EdgeInsets.only(bottom: 100.0),
      //   shrinkWrap: true,
      //   itemCount: controller.homePageItems.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     // mainAxisExtent: 150.0,
      //   ),
      //   itemBuilder: (context, index) {
      //     final pageItem = controller.homePageItems[index];
      //     final colorIndex =
      //         SHelperFunctions.getColorIndex(index, SColors.listColors.length);
      //     final primaryColor = SColors.listColors[colorIndex]["primary"];
      //     final secondaryColor = SColors.listColors[colorIndex]["secondary"];
      //     return Container(
      //       margin: EdgeInsets.all(5.0),
      //       padding: EdgeInsets.all(5.0),
      //       decoration: BoxDecoration(
      //           // gradient: LinearGradient(
      //           //     begin: Alignment.topLeft,
      //           //     end: Alignment.bottomRight,
      //           //     colors: [
      //           //       primaryColor!.withOpacity(0.8),
      //           //       primaryColor!.withOpacity(0.6)
      //           //     ]),
      //           color: secondaryColor,
      //           borderRadius: BorderRadius.circular(7.5)),
      //       child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Image.asset(
      //               pageItem.iconUrl,
      //               // /color: const Color.fromARGB(255, 68, 68, 68),
      //               height: 42.0,
      //               width: 42.0,
      //             ),
      //             Text(
      //               pageItem.title,
      //               style: TextStyle(
      //                 fontSize: 14.0,
      //               ),
      //               textAlign: TextAlign.center,
      //             )
      //           ]),
      //     );
      //   },
      // ),
    );
  }
}

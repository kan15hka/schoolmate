import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/loaders/empty_box_loader.dart';
import 'package:schoolmate/common/widgets/shimmers/message_notif_card.dart';
import 'package:schoolmate/features/student/controllers/circular_controller.dart';
import 'package:schoolmate/common/widgets/card/message_notif_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class CircularScreen extends StatelessWidget {
  const CircularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CircularController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SAppBar(
              title: "Circular",
              showBackArrow: false,
              backgroundColor: SColors.primary,
            ),

            //Check circular is empty
            Obx(() {
              if (controller.isLoading.value) {
                return const MessageNotifScreenShimmer();
              } else {
                return (controller.circulars.isEmpty)
                    ? const EmptyBoxMessageLoader(
                        content:
                            "No Circulars Found. Check with your school for circulars , or you will get one soon ...",
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding:
                            const EdgeInsets.only(top: 15.0, bottom: 100.0),
                        itemCount: controller.circulars.length,
                        itemBuilder: (context, index) {
                          final circular = controller.circulars[index];

                          String date = DateFormat.yMMMd()
                              .format(circular.dateTime)
                              .toString();
                          String time = DateFormat.jm()
                              .format(circular.dateTime)
                              .toString();

                          return MessageNotifCard(
                              index: index,
                              title: circular.title,
                              content: circular.content,
                              date: date,
                              time: time,
                              receiveStatus: circular.receiveStatus,
                              receiveStatusFirst: circular.receiveStatusFirst);
                        });
              }
            })
          ],
        ),
      ),
    );
  }
}

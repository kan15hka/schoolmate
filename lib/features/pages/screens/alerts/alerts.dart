import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/common/widgets/card/message_notif_card.dart';
import 'package:schoolmate/common/widgets/loaders/empty_box_loader.dart';
import 'package:schoolmate/common/widgets/shimmers/message_notif_card.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/controller/alerts_controller.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlertsController());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: "Alerts",
                isHeadline: true,
                backButton: true,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const MessageNotifScreenShimmer();
              } else {
                return (controller.alerts.isEmpty)
                    ? const EmptyBoxMessageLoader(
                        content:
                            "No alerts Found. Check with your school for alerts , or you will get one soon ...",
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding:
                            const EdgeInsets.only(top: 15.0, bottom: 100.0),
                        itemCount: controller.alerts.length,
                        itemBuilder: (context, index) {
                          final alert = controller.alerts[index];

                          String date = DateFormat.yMMMd()
                              .format(alert.dateTime)
                              .toString();
                          String time =
                              DateFormat.jm().format(alert.dateTime).toString();

                          return MessageNotifCard(
                              index: index,
                              isAlerts: true,
                              title: alert.title,
                              content: alert.content,
                              date: date,
                              time: time,
                              receiveStatus: alert.receiveStatus,
                              receiveStatusFirst: alert.receiveStatusFirst);
                        });
              }
            })
          ],
        ),
      )),
    );
  }
}

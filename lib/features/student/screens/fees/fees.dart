import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/card/ticket_view.dart';
import 'package:schoolmate/common/widgets/loaders/empty_box_loader.dart';
import 'package:schoolmate/common/widgets/shimmers/fees_screen_shimmer.dart';
import 'package:schoolmate/features/student/controllers/fee_controller.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FeesController.instance;
    return Scaffold(
      backgroundColor: SColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //App Bar
            const SAppBar(
              title: "Fees",
              showBackArrow: false,
              backgroundColor: SColors.primary,
            ),

            Obx(() {
              if (controller.isLoading.value) {
                return const FeesScreenShimmer();
              } else {
                return (controller.fees.isEmpty)
                    ? const EmptyBoxMessageLoader(
                        content:
                            "No Fees Found. Check with your school for fees , or you will get one soon ...",
                      )
                    : Container(
                        color: SColors.softGrey,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 100.0),
                            itemCount: controller.fees.length,
                            itemBuilder: (context, index) {
                              final fee = controller.fees[index];
                              return Column(
                                children: [
                                  if (fee.isFirst)
                                    Container(
                                      color: SColors.softGrey,
                                      width:
                                          SDeviceUtils.getScreenWidth(context),
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 20.0, bottom: 10.0),
                                      child: Text(
                                          (fee.isPaid)
                                              ? "Payment History"
                                              : "Payment Due",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ),
                                  TicketViewCard(
                                    title: fee.title,
                                    amount: fee.amount,
                                    paymentMode: fee.paymentMode,
                                    isPaid: fee.isPaid,
                                    dueDate: fee.dueDate,
                                  ),
                                ],
                              );
                            }),
                      );
              }
            })
          ],
        ),
      ),
    );
  }
}

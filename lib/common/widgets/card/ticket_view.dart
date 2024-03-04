import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:unicons/unicons.dart';

class TicketViewCard extends StatelessWidget {
  final String title;
  final String amount;
  final DateTime dueDate;
  final String paymentMode;
  final bool isPaid;
  const TicketViewCard({
    super.key,
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.paymentMode,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SDeviceUtils.getScreenWidth(context) * 0.1,
          vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Column(
              children: <Widget>[
                //Fees title
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                //Line
                feeTicketLine(),
                //Elements
                feeTicketAttribute(
                    icon: MdiIcons.currencyInr,
                    title: "Fee Amount",
                    content: "\u{20B9}$amount",
                    iconBackColor: SColors.listColors[0]["secondary"]!,
                    context: context),
                feeTicketAttribute(
                    icon: MdiIcons.clockOutline,
                    title: "Due Date",
                    iconBackColor: SColors.listColors[1]["secondary"]!,
                    content: DateFormat.yMd().format(dueDate).toString(),
                    context: context),
                feeTicketAttribute(
                    icon: MdiIcons.swapHorizontal,
                    title: "Payment Mode",
                    content: paymentMode,
                    iconBackColor: SColors.listColors[2]["secondary"]!,
                    context: context)
              ],
            ),
          ),
          //lLine
          feeTicketLine(),
          //
          Container(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 10, top: 10.0),
            decoration: BoxDecoration(
                color: isPaid ? SColors.grey : SColors.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: SColors.lightestGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(isPaid ? UniconsLine.invoice : UniconsLine.bill,
                      color: SColors.primary),
                ),
                Text(
                  isPaid ? "Fee Paid" : "Pay Now",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: isPaid ? SColors.darkerGrey : SColors.white),
                ),
                Icon(
                  isPaid ? MdiIcons.check : MdiIcons.chevronRight,
                  color: isPaid ? SColors.dark : SColors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget feeTicketAttribute(
    {required IconData icon,
    required String title,
    required String content,
    required Color iconBackColor,
    required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7.5),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: 15.0,
                    width: 15.0,
                    margin: const EdgeInsets.only(
                      right: 5.0,
                    ),
                    decoration: BoxDecoration(
                        color: iconBackColor, shape: BoxShape.circle),
                  ),
                  Icon(
                    icon,
                    size: 23,
                    color: SColors.primary,
                  ),
                ],
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(fontSizeFactor: 1.1),
            ),
          ],
        ),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: SColors.darkerGrey, fontWeightDelta: -1),
        ),
      ],
    ),
  );
}

Widget feeTicketLine() {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        const SizedBox(
          height: 20,
          width: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: SColors.softGrey),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    (constraints.constrainWidth() / 10).floor(),
                    (index) => const SizedBox(
                          height: 1,
                          width: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: SColors.darkGrey),
                          ),
                        )),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
          width: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: SColors.softGrey),
          ),
        ),
      ],
    ),
  );
}

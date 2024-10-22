import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/formatters/formatter.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class HomeWorkCard extends StatelessWidget {
  const HomeWorkCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final colorIndex =
        SHelperFunctions.getColorIndex(index, SColors.listColors.length);
    final secondaryColor = SColors.listColors[colorIndex]["secondary"];
    final primaryColor = SColors.listColors[colorIndex]["primary"];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mathematics",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: primaryColor),
                ),
                Text(
                  SFormatter.formatDateEvent(DateTime.now()),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Trignometric Formulas",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    taskInfoCard(
                        context: context,
                        iconData: Iconsax.teacher,
                        title: "Created by",
                        value: "Tyler Durden"),
                    taskInfoCard(
                        context: context,
                        iconData: Iconsax.calendar_1,
                        title: "Due date",
                        value: "12-08-2003"),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",
                    style: Theme.of(context).textTheme.bodyLarge),
                const Text(
                  "Write all the trignometric formulas in classwork",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget taskInfoCard(
    {required BuildContext context,
    required String title,
    required String value,
    required IconData iconData}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      Row(
        children: [
          Row(children: [
            Icon(iconData),
            const SizedBox(width: 5.0),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.black),
            )
          ])
        ],
      ),
    ],
  );
}

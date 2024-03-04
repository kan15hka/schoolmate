import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class MessageNotifCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String receiveStatus;
  final bool receiveStatusFirst;
  final bool isAlerts;
  final int index;
  const MessageNotifCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.receiveStatus,
    required this.receiveStatusFirst,
    this.isAlerts = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorIndex =
        SHelperFunctions.getColorIndex(index, SColors.listColors.length);
    final primaryColor = SColors.listColors[colorIndex]["primary"];
    final secondaryColor = SColors.listColors[colorIndex]["secondary"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //if recievestatus first is true then display today yesterday old
        if (receiveStatusFirst) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(receiveStatus,
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
        if (!receiveStatusFirst && !isAlerts)
          Divider(
            thickness: 1.1,
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.grey[300],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isAlerts)
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: secondaryColor, shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  MdiIcons.checkDecagram,
                  color: primaryColor,
                )),
              ),
            Container(
              decoration: isAlerts
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 1.5))
                  : null,
              margin: EdgeInsets.only(bottom: 10.0),
              width: (isAlerts)
                  ? SDeviceUtils.getScreenWidth(context) * 0.9
                  : SDeviceUtils.getScreenWidth(context) - 70.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          fontWeightDelta: 1,
                          color: isAlerts ? primaryColor : null)),
                  //content
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      content,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    "$date  $time",
                    maxLines: 10,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(fontSizeFactor: 1.1),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

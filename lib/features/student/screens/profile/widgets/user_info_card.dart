import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class UserInfoCard extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String title;

  final String content;
  final bool isCardSizeVariable;
  const UserInfoCard(
      {super.key,
      required this.icon,
      this.iconSize = 25.0,
      required this.title,
      required this.content,
      this.isCardSizeVariable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SDeviceUtils.getScreenWidth(context) * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
        margin: const EdgeInsets.all(1),
        child: Row(
          children: [
            Container(
              height: 35.0,
              width: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: SColors.primary, width: 1.5)),
              child: Center(
                  child: Icon(
                icon,
                size: iconSize,
                color: SColors.primary,
              )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                  Text(content,
                      maxLines: (isCardSizeVariable) ? 3 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String title;
  const SettingsCard({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        width: SDeviceUtils.getScreenWidth(context) * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                SColors.primary.withOpacity(0.025),
                SColors.primary.withOpacity(0.1),
              ]),
        ),
        child: Row(
          children: [
            Container(
              height: 35.0,
              width: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: SColors.primary, width: 1.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Icon(
                icon,
                size: iconSize,
                color: SColors.primary,
              )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            Icon(
              MdiIcons.chevronRight,
              color: SColors.primary,
            ),
          ],
        ));
  }
}

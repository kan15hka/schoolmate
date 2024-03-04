import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 65.0,
      width: SDeviceUtils.getScreenWidth(context) * 0.85,
      blur: 8,
      color: Colors.white.withOpacity(0.1),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.blue.withOpacity(0.3),
        ],
      ),
      //--code to remove border
      border: const Border.fromBorderSide(BorderSide.none),
      shadowStrength: 5,
      shape: BoxShape.circle,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      shadowColor: Colors.white.withOpacity(0.24),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TSwitchTheme {
  TSwitchTheme._();

  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected) ? SColors.white : SColors.grey),
    trackColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? SColors.primary
            : SColors.light),
    trackOutlineColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? SColors.primary
            : SColors.grey),
  );

  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected) ? SColors.white : SColors.grey),
    trackColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? SColors.primary
            : SColors.dark),
    trackOutlineColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? SColors.primary
            : SColors.grey),
  );
}

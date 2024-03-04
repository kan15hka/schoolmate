import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/bindings/general_bindings.dart';
import 'package:schoolmate/navigation_menu_bar.dart';
import 'package:schoolmate/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Schoolmate",
        initialBinding: GeneralBindings(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: const NavigationMenuBar());
  }
}

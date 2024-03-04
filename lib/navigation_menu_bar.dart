import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/nav_bar/bottom_navbar.dart';
import 'package:schoolmate/common/widgets/nav_bar/nav_item.dart';
import 'package:schoolmate/features/student/screens/calendar/calendar.dart';
import 'package:schoolmate/features/student/screens/circular/circular.dart';
import 'package:schoolmate/features/student/screens/fees/fees.dart';
import 'package:schoolmate/features/student/screens/home/home.dart';
import 'package:schoolmate/features/student/screens/profile/profile.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:unicons/unicons.dart';

class NavigationMenuBar extends StatelessWidget {
  const NavigationMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
        //NAV BAR WIDGETS
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        //BOTTOM NAV BAR
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomNavBar(
          child: Obx(
            () => SizedBox(
              height: 65.0,
              width: SDeviceUtils.getScreenWidth(context) * 0.85,
              child: Transform.translate(
                offset: Offset(0, 100 * controller.animation.value.value),
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: SColors.black.withOpacity(0.05),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(controller.screens.length, (index) {
                          return InkWell(
                              onTap: () {
                                controller.selectedIndex.value = index;
                              },
                              child: NavItem(
                                isSelected:
                                    controller.selectedIndex.value == index,
                                icon: controller.icons[index],
                              ));
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rx<int> selectedIndex = 2.obs;
  final icons = [
    UniconsLine.calender,
    UniconsLine.comment_alt_lines,
    UniconsLine.estate,
    UniconsLine.invoice,
    UniconsLine.user,
  ];
  final screens = [
    const CalendarScreen(),
    const CircularScreen(),
    const HomeScreen(),
    const FeesScreen(),
    const ProfileScreen(),
  ];
  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Rx<Animation<double>> animation;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {},
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn))
        .obs;
  }
}

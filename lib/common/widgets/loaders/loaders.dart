import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class TLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: SHelperFunctions.isDarkMode(Get.context!)
                  ? SColors.darkerGrey.withOpacity(0.9)
                  : SColors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          )),
        )));
  }

  static succcesSnackBar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: SColors.white,
        backgroundColor: SColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10.0),
        icon: const Icon(
          Iconsax.check,
          color: SColors.white,
        ));
  }

  static warningSnackBar({required title, message = ""}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: SColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20.0),
        icon: const Icon(
          Iconsax.warning_2,
          color: SColors.white,
        ));
  }

  static errorSnackBar({required title, message = ""}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: SColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20.0),
        icon: const Icon(
          Iconsax.warning_2,
          color: SColors.white,
        ));
  }
}

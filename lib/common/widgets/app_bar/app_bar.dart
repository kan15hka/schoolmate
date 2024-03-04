import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar(
      {super.key,
      required this.title,
      this.toolbarHeight = 75.0,
      this.titleTextStyle,
      this.showBackArrow = false,
      this.centerTitle = true,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.backgroundColor,
      this.leading,
      this.leadingWidth});
  final String title;
  final TextStyle? titleTextStyle;
  final bool showBackArrow;
  final bool centerTitle;
  final IconData? leadingIcon;
  final Widget? leading;
  final double toolbarHeight;
  final double? leadingWidth;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return AppBar(
      leadingWidth: leadingWidth ?? leadingWidth,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? backgroundColor,
      centerTitle: centerTitle,
      leading: (leading != null)
          ? leading
          : showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: dark ? SColors.light : SColors.dark,
                  ))
              : (leadingIcon != null)
                  ? IconButton(
                      onPressed: leadingOnPressed,
                      icon: Icon(leadingIcon,
                          color: dark ? SColors.light : SColors.dark))
                  : null,
      title: Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: titleTextStyle ??
            Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: Colors.white),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}

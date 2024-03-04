import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/text_strings.dart';

class SPerfrmanceTabBar extends StatelessWidget {
  const SPerfrmanceTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBar(
              controller: tabController,

              //remove tap effect
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              physics: const BouncingScrollPhysics(),
              unselectedLabelColor: Colors.white.withAlpha(150),
              indicator: BoxDecoration(
                  color: SColors.primaryLight,
                  borderRadius: BorderRadius.circular(10.0)),
              labelPadding: EdgeInsets.zero,
              labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: STexts.fontFamily,
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                fontSize: 15.0,
                color: SColors.primary,
                fontFamily: STexts.fontFamily,
              ),
              isScrollable: false,
              tabs: tabs),
          Container(
            color: SColors.primary,
            height: 1,
          )
        ],
      ),
    );
  }
}

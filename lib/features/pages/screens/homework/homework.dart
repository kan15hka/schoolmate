import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/screens/homework/widgets/homework_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/formatters/formatter.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class HomeWorkPage extends StatelessWidget {
  const HomeWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(SSizes.h10),
                child: SSectionHeading(
                  title: "Homeworks",
                  isHeadline: true,
                  backButton: true,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomeWorkCard(index: index);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/screens/homework/widgets/homework_card.dart';

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
              const Padding(
                padding: EdgeInsets.all(SSizes.h10),
                child: SSectionHeading(
                  title: "Homeworks",
                  isHeadline: true,
                  backButton: true,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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

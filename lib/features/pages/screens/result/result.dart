import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: "Results",
                isHeadline: true,
                backButton: true,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

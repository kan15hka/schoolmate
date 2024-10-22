import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

class SSyllabus extends StatelessWidget {
  const SSyllabus({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    const syllabus =
        "Calculus: Limits, derivatives, and integrals\nAlgebra: Polynomial equations, matrices, and determinants.\nGeometry: Analytical geometry, vectors, and three-dimensional geometry.\nProbability and Statistics: Probability distributions, hypothesis testing, and data analysis.\nTrigonometry: Trigonometric functions, identities, and applications in solving triangles.";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Headingand Back button
              Padding(
                padding: const EdgeInsets.all(SSizes.h10),
                child: SSectionHeading(
                  title: "$name Syllabus",
                  isHeadline: true,
                  backButton: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "Subject syllabus as updated by the management",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SSizes.defaultSpace, vertical: 10.0),
                child: Text(
                  syllabus,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

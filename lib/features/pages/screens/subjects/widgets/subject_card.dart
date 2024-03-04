import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:schoolmate/common/widgets/buttons/combo_buttons.dart';

class SSubjectCard extends StatelessWidget {
  const SSubjectCard({
    super.key,
    required this.color,
    required this.name,
    this.onSyllabusTapped,
    this.onPerformanceTapped,
  });

  final Color color;
  final String name;
  final VoidCallback? onSyllabusTapped;
  final VoidCallback? onPerformanceTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.5)])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge),
        Text("Tyler Durden",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: Colors.black)),
        Spacer(),
        SComboButtons(
            onButtonLeftTapped: onSyllabusTapped,
            onButtonRightTapped: onPerformanceTapped)
      ]),
    );
  }
}

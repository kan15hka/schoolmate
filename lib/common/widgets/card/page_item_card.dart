import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/containers/circular_container.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class PageItemCard extends StatelessWidget {
  const PageItemCard({
    super.key,
    required this.index,
    required this.title,
    required this.iconUrl,
    required this.onTap,
  });

  final int index;
  final String title;
  final String iconUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorIndex =
        SHelperFunctions.getColorIndex(index, SColors.listColors.length);
    final color = SColors.listColors[colorIndex]["secondary"];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          color: color!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: -10.0,
                top: -10.0,
                child: KCircularContainer(
                  height: 50.0,
                  width: 50.0,
                  backgroundColor: color,
                ),
              ),
              Positioned(
                left: -10.0,
                bottom: -10.0,
                child: KCircularContainer(
                  height: 50.0,
                  width: 50.0,
                  backgroundColor: color,
                ),
              ),
              Container(
                width: 100.0,
                // /color: Colors.amber,

                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          iconUrl,
                          // /color: const Color.fromARGB(255, 68, 68, 68),
                          height: 45.0,
                          width: 45.0,
                        )),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(color: Colors.black, fontSizeFactor: 0.85),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

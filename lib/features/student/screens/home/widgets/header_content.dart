import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/containers/circular_container.dart';
import 'package:schoolmate/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:schoolmate/features/student/controllers/home_controller.dart';
import 'package:schoolmate/features/student/screens/home/widgets/home_appbar.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SHeaderContent extends StatelessWidget {
  const SHeaderContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return TCurvedEdgesWidget(
      child: Container(
        color: SColors.primary,
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Positioned(
              top: -150.0,
              right: -250.0,
              child: KCircularContainer(
                backgroundColor: SColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100.0,
              right: -300.0,
              child: KCircularContainer(
                backgroundColor: SColors.textWhite.withOpacity(0.1),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: SSizes.spaceBtwSections * 1.5,
                ),
                //Profile,Name and Appbar buttons
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SHomeAppBarCard(),
                ),
                const SizedBox(
                  height: SSizes.sm,
                ),
                //Carousel Slider
                CarouselSlider(
                    items: controller.banners.map((item) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: 100.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          width: SDeviceUtils.getScreenWidth(context) * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        //padEnds: false,
                        height: 160.0,
                        viewportFraction: 0.85,
                        enableInfiniteScroll: true)),
                const SizedBox(
                  height: SSizes.spaceBtwSections,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

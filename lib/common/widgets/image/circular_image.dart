import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 50,
    this.width = 50,
    this.radius = 100.0,
    this.padding = 0,
  });
  final BoxFit? fit;

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double height, width, padding, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ??
              ((SHelperFunctions.isDarkMode(context))
                  ? SColors.black
                  : SColors.white),
          borderRadius: BorderRadius.circular(radius)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const SShimmerEffect(
                  radius: 60,
                  width: 60,
                  height: 60,
                ),
                errorWidget: (context, url, downloadProgress) =>
                    const Icon(Icons.error),
              )
            : Image(
                image: AssetImage(image),
                fit: fit,
                color: overlayColor,
              ),
      ),
    );
  }
}

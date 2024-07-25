

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  png,
  svg,
}

class CustomImage extends StatelessWidget {
  final String imageSrc;
  final Color? imageColor;
  final double? size;
  final double? sizeWidth;
  final ImageType imageType;
  final BoxFit? fit;
  final double horizontal;
  final double vertical;

  const CustomImage({
    required this.imageSrc,
    this.imageColor,
    this.size,
    this.sizeWidth,
    this.imageType = ImageType.svg,
    super.key,
    this.fit,
    this.horizontal = 0.0,
    this.vertical = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imageType == ImageType.svg) {
      imageWidget = SvgPicture.asset(
        imageSrc,
        color: imageColor,
        height: size,
        width: size,
        fit: fit ?? BoxFit.contain,
      );
    } else {
      imageWidget = Image.asset(
        imageSrc,
        color: imageColor,
        height: size,
        width: size,
        fit: fit ?? BoxFit.contain,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      width: sizeWidth ?? size,
      child: imageWidget,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';

import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height = 48,
      this.width = double.maxFinite,
      required this.onTap,
      this.title = '',
      this.marginVertical = 0,
      this.marginHorizontal = 0,
      this.fillColor = AppColors.blue500,
      this.textColor = Colors.white,
      this.isBorder = false,
      this.fontSize = 18});

  final double height;
  final double fontSize;

  final double? width;
  final Color fillColor;
  final Color textColor;
  final VoidCallback onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: isBorder ? Border.all(color: textColor) : null,
          borderRadius: BorderRadius.circular(8),
          color: fillColor,
        ),
        child: CustomText(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}

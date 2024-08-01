import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomAddPhotoCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CustomAddPhotoCard({
    super.key,
    required this.onTap,
    this.title = AppStrings.addPhoto,
    this.borderColor = AppColors.gray300,
    this.iconColor = AppColors.blue500,
    this.textColor = AppColors.blue500,
    this.margin = const EdgeInsets.only(bottom: 10),
    this.padding = const EdgeInsets.symmetric(vertical: 21, horizontal: 35),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: AppColors.black500,
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          bottom: 8.h,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Column(
              children: [
                CustomImage(
                  imageSrc: AppIcons.photoCamera,
                  imageColor: iconColor,
                ),
                CustomText(
                  color: textColor,
                  text: title,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

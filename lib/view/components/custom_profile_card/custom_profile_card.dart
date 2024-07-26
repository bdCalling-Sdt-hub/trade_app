import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';

import '../custom_text/custom_text.dart';

class CustomProfileCard extends StatelessWidget {
  final String text;
  final String leadingIcon;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isCevron;

  const CustomProfileCard({
    super.key,
    required this.text,
    required this.leadingIcon,
    this.backgroundColor = AppColors.blue50, required this.onTap, required this.isCevron,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 54.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
            ),
            child: Row(
              children: [
                CustomImage(imageSrc: leadingIcon),
                const SizedBox(width: 10),
                CustomText(
                  text: text,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black500,
                ),
                const Spacer(),
                if(isCevron)
                const CustomImage(imageSrc: AppIcons.chevronForward),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}

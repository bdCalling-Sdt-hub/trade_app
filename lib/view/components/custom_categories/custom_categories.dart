import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomCategories extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const CustomCategories({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNetworkImage(
            borderRadius: BorderRadius.circular(12),
            imageUrl: image,
            height: 124.h,
            width: double.infinity,
          ),
          SizedBox(height: 6.h),
          CustomText(
            color: AppColors.black500,
            text: name,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomMyProduct extends StatelessWidget {
  final String image;
  final String name;
  final String value;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback editOnTap;
  final bool isEdit;

  const CustomMyProduct({
    super.key,
    required this.image,
    required this.name,
    this.backgroundColor = AppColors.white200,
    required this.onTap,
    required this.value, required this.editOnTap, required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
          border: Border.all(color: AppColors.gray300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Spacer(),
                  if(isEdit)
                  IconButton(
                    onPressed: editOnTap,
                    icon: const CustomImage(
                        imageSrc: AppIcons.borderColor),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: CustomNetworkImage(
                imageUrl: image,
                height: 106.h,
                width: 100.w,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: 1,
              child: CustomText(
                textAlign: TextAlign.start,
                text: name,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.black500,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  CustomText(
                    text: AppStrings.value.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.gray700,
                  ),
                  CustomText(
                    text: value,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.blue500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

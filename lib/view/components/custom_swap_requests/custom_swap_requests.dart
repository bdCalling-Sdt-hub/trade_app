import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomSwapRequests extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String firstProductName;
  final String exchangeProductName;
  final String acceptButton;
  final String rejectButton;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback onTapAcceptButton;
  final VoidCallback onTapRejectButton;
  final VoidCallback onTapName;

  const CustomSwapRequests({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.acceptButton,
    required this.rejectButton,
    this.backgroundColor = AppColors.white200,
    required this.onTap,
    required this.firstProductName,
    required this.exchangeProductName, required this.onTapName, required this.onTapAcceptButton, required this.onTapRejectButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
            border: Border.all(color: AppColors.gray300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: image,
                      height: 36.h,
                      width: 36.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: onTapName,
                          child: CustomText(
                            left: 8,
                            text: name,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue500,
                          ),
                        ),
                        CustomText(
                          left: 10,
                          text: date,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black400,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onTap,
                    child:  CustomText(
                      decoration: TextDecoration.underline,
                      text: AppStrings.viewDetails.tr,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue500,
                    ),
                  )
                ],
              ),
               CustomText(
                top: 10,
                left: 7,
                text: AppStrings.swapItems.tr,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.black500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: firstProductName,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black500,
                  ),
                  const CustomImage(
                    imageSrc: AppIcons.swapHoriz,
                    imageColor: AppColors.blue500,
                  ),
                  CustomText(
                    text: exchangeProductName,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black500,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: onTapAcceptButton,
                      title: acceptButton,
                      fillColor: AppColors.white,
                      textColor: AppColors.green600,
                      isBorder: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      onTap: onTapRejectButton,
                      title: rejectButton,
                      fillColor: AppColors.white,
                      textColor: AppColors.red500,
                      isBorder: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

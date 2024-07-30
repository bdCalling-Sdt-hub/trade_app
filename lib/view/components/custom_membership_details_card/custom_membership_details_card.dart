import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomMembershipDetailsCard extends StatelessWidget {
  final String userName;
  final int points;
  final String membershipLevel;
  final Widget sliderWidget;
  final String description;

  const CustomMembershipDetailsCard({
    super.key,
    required this.userName,
    required this.points,
    required this.membershipLevel,
    required this.sliderWidget,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDetailContainer(
      color: AppColors.gold,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: userName,
                color: AppColors.white50,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const CustomImage(
                      imageSrc: AppIcons.logo,
                      size: 20,
                    ),
                    CustomText(
                      left: 8,
                      text: points.toString(),
                      color: AppColors.black500,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 28.h),
          CustomText(
            text: membershipLevel,
            color: AppColors.white50,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          sliderWidget,
          CustomText(
            maxLines: 2,
            text: description,
            color: AppColors.white50,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}

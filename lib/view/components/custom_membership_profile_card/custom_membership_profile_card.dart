import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomMembershipProfileCard extends StatelessWidget {



  final String imageUrl;
  final String name;
  final int points;
  final String membershipStatus;
  final MembershipController controller;
  final VoidCallback onTap;

  const CustomMembershipProfileCard({
    required this.imageUrl,
    required this.name,
    required this.membershipStatus,
    super.key,
    required this.controller, required this.onTap, required this.points,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        color: AppColors.gold,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                children: [
                  ///=====================Image=========
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: imageUrl,
                      height: 49.h,
                      width: 49.w),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///===================Name=========
                      CustomText(
                        text: name,
                        color: AppColors.white50,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      SizedBox(height: 4.h),
                      ///=====================Status=========
                      CustomText(
                        text: '${AppStrings.membershipStatus}'
                            '$membershipStatus',
                        color: AppColors.white50,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),

              RangeSliderFlutter(
                values: [points.toDouble()],
                max: controller.diamondThreshold.toDouble(),
                min: 0,
                rangeSlider: false,
                tooltip: RangeSliderFlutterTooltip(
                  alwaysShowTooltip: true,
                  // boxStyle: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  textStyle: TextStyle(color: Colors.blue),
                ),
                trackBar: RangeSliderFlutterTrackBar(
                  activeTrackBarHeight: 6,
                  activeTrackBar: BoxDecoration(color: Colors.blue),
                  inactiveTrackBar: BoxDecoration(color: Colors.white),
                ),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  controller.updatePoints(lowerValue.toInt());
                },
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///=================Gold===========
                    Column(
                      children: [
                         CustomText(
                          text: AppStrings.gold.tr,
                          color: AppColors.white50,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        const CustomText(
                          text: '25,000',
                          color: AppColors.black50,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),                    ],
                    ),
                    ///==================Platinum=========
                    Column(
                      children: [
                        CustomText(
                          text: AppStrings.platinum.tr,
                          color: AppColors.white50,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),                      SizedBox(height: 4.h),
                        const CustomText(
                          text: '100,000',
                          color: AppColors.black50,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),                     ],
                    ),
                    ///===================Diamond=========
                    Column(
                      children: [
                        CustomText(
                          text: AppStrings.diamond.tr,
                          color: AppColors.white50,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),                    ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

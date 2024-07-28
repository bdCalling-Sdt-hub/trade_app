import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class PointsEarnedScreen extends StatelessWidget {
  const PointsEarnedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pointsData = [
      {'action': 'By swapping', 'date': '12/03/24', 'points': '+500 Points'},
      {
        'action': 'By positive comments',
        'date': '11/03/24',
        'points': '+100 Points'
      },
      {'action': 'By swapping', 'date': '10/03/24', 'points': '+800 Points'},
      {'action': 'By swapping', 'date': '09/03/24', 'points': '+500 Points'},
      {
        'action': 'By positive comments',
        'date': '08/03/24',
        'points': '+600 Points'
      },
      {'action': 'By swapping', 'date': '07/03/24', 'points': '+700 Points'},
      {'action': 'Daily Checkin', 'date': '06/03/24', 'points': '+1200 Points'},
      {
        'action': 'By positive comments',
        'date': '05/03/24',
        'points': '+600 Points'
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white50,

      ///========================Points Earn Appbar===========
      appBar: CustomAppBar(
        appBarContent: AppStrings.pointsEarn.tr,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=======================Total points=============
              CustomDetailContainer(
                  color: AppColors.white200,
                  child: Row(
                    children: [
                      CustomText(
                        text: AppStrings.totalPointsEarn.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.black500,
                      ),
                      const Spacer(),
                      CustomText(
                        text: '25850'.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.blue500,
                      ),
                    ],
                  )),
              CustomText(
                text: '${AppStrings.pointsEarn}:'.tr,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.black500,
                bottom: 10,
              ),
              Column(
                children: List.generate(pointsData.length, (index) {
                  final item = pointsData[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.gray300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: item['action']!,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.black500,
                              ),
                              CustomText(
                                text: item['date']!,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.black500,
                              ),
                            ],
                          ),
                          CustomText(
                            text: item['points']!,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.black500,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          )),
    );
  }
}

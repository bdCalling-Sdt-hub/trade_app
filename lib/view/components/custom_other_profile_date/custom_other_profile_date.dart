import 'package:flutter/material.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomOtherProfileDate extends StatelessWidget {
  final String memberSince;
  final String lastSiteVisit;

  const CustomOtherProfileDate({
    super.key,
    required this.memberSince,
    required this.lastSiteVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              left: 10,
              text: 'Member Since:',
              color: AppColors.black500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              left: 10,
              text: ' ',//Last Site Visit:
              color: AppColors.black500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              left: 10,
              text: memberSince,
              color: AppColors.black500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            // CustomText(
            //   left: 10,
            //   text: lastSiteVisit,
            //   color: AppColors.black500,
            //   fontSize: 14,
            //   fontWeight: FontWeight.w400,
            // ),
          ],
        ),
      ],
    );
  }
}

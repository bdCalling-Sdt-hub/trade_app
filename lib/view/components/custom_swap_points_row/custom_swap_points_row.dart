import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';

class CustomSwapPointsRow extends StatelessWidget {
  final String earnedPointsText;
  final String date;
  final String item1;
  final String item2;
   // The path or icon to use for swap

  const CustomSwapPointsRow({
    super.key,
    required this.earnedPointsText,
    required this.date,
    required this.item1,
    required this.item2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: earnedPointsText,
              color: AppColors.black500,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            const Spacer(),
            CustomText(
              text: date,
              color: AppColors.black500,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ],
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          children: [
            Expanded(
              child: CustomText(
                text: item1,
                color: AppColors.black500,
                fontWeight: FontWeight.w400,
                right: 10,
              ),
            ),
            const CustomImage(
              imageSrc: AppIcons.swapHoriz,
              imageColor: AppColors.blue500,
            ),
            Expanded(
              child: CustomText(
                left: 10,
                text: item2,
                color: AppColors.black500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

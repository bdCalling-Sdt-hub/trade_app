import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomOtherProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final String membershipStatus;

  const CustomOtherProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.membershipStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkImage(
          boxShape: BoxShape.circle,
          imageUrl: imageUrl,
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: name,
                  color: AppColors.black500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 35.w),
                Icon(Icons.star, color: Colors.amber),
                CustomText(
                  left: 5,
                  text: '$rating/5.0',
                  color: AppColors.black500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Row(
              children: [
                CustomText(
                  left: 10,
                  text: 'Membership Status: ',
                  color: AppColors.black500,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: membershipStatus,
                  color: AppColors.black500,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

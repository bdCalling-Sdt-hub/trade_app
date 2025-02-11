import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomRatingCard extends StatelessWidget {
  final String name;
  final String date;
  final String imageUrl;
  final int rating;
  final String review;

  const CustomRatingCard({
    super.key,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: AppColors.white200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                boxShape: BoxShape.circle,
                imageUrl: imageUrl,
                height: 36.h,
                width: 36.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: name,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.black500,
                        ),
                        CustomText(
                          text: date,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.black500,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: AppColors.gold,
                          size: 16.h,
                        );
                      }),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      textAlign: TextAlign.start,
                      maxLines: 10,
                      text: review,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.black500,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w), // Add some space between the review and the date

            ],
          ),
        ],
      ),
    );
  }
}

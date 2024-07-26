import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_rating_card/custom_rating_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class MyRatingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> ratingsData = [
    {
      'name': 'Sakib Ahmed',
      'date': '12/06/24',
      'imageUrl': AppConstants.userNtr, // Replace with actual image URL
      'rating': 5,
      'review':
          'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
    {
      'name': 'Imtiaz Rahman',
      'date': '08/06/24',
      'imageUrl': AppConstants.userNtr, // Replace with actual image URL
      'rating': 4,
      'review': 'I recommend this swapper for an overall excellent experience.',
    },
    {
      'name': 'Rakib Hossain',
      'date': '04/06/24',
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 5,
      'review': 'Recommended swapper. Overall good experience.',
    },
  ];

  MyRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white50,
      ///========================myRatingAndComments Appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myRatingAndComments.tr,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDetailContainer(
                  color: AppColors.white200,
                  child: Row(
                    children: [
                      CustomText(
                        textAlign: TextAlign.start,
                        text: AppStrings.overallRating.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black500,
                      ),
                      const Spacer(),
                      const Icon(Icons.star,color: Colors.amber,),
                      CustomText(
                        textAlign: TextAlign.start,
                        text: '4.7/5.0'.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black500,
                      ),
                    ],
                  )),
              CustomText(
                textAlign: TextAlign.start,
                text: AppStrings.allRatingAndComments.tr,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.black500,
                bottom: 19,
              ),
              Column(
                children: List.generate(ratingsData.length, (index) {
                  final item = ratingsData[index];
                  return CustomRatingCard(
                    name: item['name'],
                    date: item['date'],
                    imageUrl: item['imageUrl'],
                    rating: item['rating'],
                    review: item['review'],
                  );
                }),
              )
            ],
          )),
    );
  }
}

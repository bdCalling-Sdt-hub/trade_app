import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_membership_profile_card/custom_membership_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class MyMembershipScreen extends StatelessWidget {
  MyMembershipScreen({super.key});

  final MembershipController membershipController =
      Get.find<MembershipController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///=============== ===myMembership Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myMembership.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///======================Header Card==================
                membershipController.isLoader.value
                    ? const CustomLoader()
                    : CustomMembershipProfileCard(
                        imageUrl: AppConstants.userNtr,
                        name: 'Mohammad Rakib',
                        membershipStatus: 'Gold',
                        controller: membershipController,
                        onTap: () {
                          Get.toNamed(AppRoutes.membershipDetailsScreen);
                        },
                      ),

                ///=======================Total Points Earn=============
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.pointsEarnedScreen);
                  },
                  child: CustomDetailContainer(
                    isBorder: true,
                    color: AppColors.white200,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppStrings.totalPointsEarn.tr,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.gray900,
                            ),
                            const CustomText(
                              text: '20000',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColors.blue500,
                              bottom: 10,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CustomImage(imageSrc: AppIcons.arrowForwardIos),
                      ],
                    ),
                  ),
                ),

                ///============================Monthly Subscription fee card========================
                CustomDetailContainer(
                  isBorder: true,
                  color: AppColors.white200,
                  child: Column(
                    children: [
                      CustomText(
                        text: AppStrings.monthlySubscriptionFee.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.gray900,
                      ),
                      const CustomText(
                        text: '\$19.99',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.blue500,
                        bottom: 10,
                      ),
                      CustomButton(
                        onTap: () {},
                        title: AppStrings.payNow.tr,
                      ),
                      CustomText(
                        textAlign: TextAlign.start,
                        text: AppStrings.payYourSubscriptionFeeInTime.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.gray900,
                        bottom: 10,
                        top: 10,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),

                ///=========================Your Member ship benefits==================
                CustomText(
                  text: AppStrings.yourMembershipBenefits.tr,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.black500,
                  bottom: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      membershipController.membershipItem.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.checkCircle,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomText(
                              textAlign: TextAlign.start,
                              text: membershipController.membershipItem[index],
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_profile_card/custom_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================My Profile Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProfile.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///===================Profile Image================
              CustomNetworkImage(
                  boxShape: BoxShape.circle,
                  imageUrl: AppConstants.userNtr,
                  height: 100.h,
                  width: 100.w),

              ///=======================Name=================
              CustomText(
                text: 'Md Masum Raj'.tr,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.black500,
              ),

              ///===================Status==============
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppStrings.membershipStatus.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.black200,
                  ),
                  CustomText(
                    text: 'Gold'.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.black200,
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),

              ///=========================myMembership==============
              CustomProfileCard(
                onTap: () {
                  Get.toNamed(AppRoutes.myMembershipScreen);

                },
                text: AppStrings.myMembership.tr,
                leadingIcon: AppIcons.cardMembership, isCevron: true,
              ),

              ///=====================My Products===============
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.myProductsScreen);

                },
                text: AppStrings.myProducts.tr,
                leadingIcon: AppIcons.package_2,
              ),

              ///====================Swap Request================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.swapRequestScreen);
                },
                text: AppStrings.swapRequests.tr,
                leadingIcon: AppIcons.swapHoriz,
              ),

              ///====================Swap History================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.swapHistoryScreen);

                },
                text: AppStrings.swapHistory.tr,
                leadingIcon: AppIcons.history,
              ),

              ///====================myRatingAndComments================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.myRatingScreen);

                },
                text: AppStrings.myRatingAndComments.tr,
                leadingIcon: AppIcons.reviews,
              ),

              ///====================settings================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.settingScreen);

                },
                text: AppStrings.settings.tr,
                leadingIcon: AppIcons.settings,
              ),
              ///====================LogOut================
              CustomProfileCard(
                isCevron: false,
                onTap: () {
                  Get.toNamed(AppRoutes.signInScreen);
                },
                text: AppStrings.logOut.tr,
                leadingIcon: AppIcons.vector,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

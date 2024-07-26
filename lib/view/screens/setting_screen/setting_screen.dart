import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_profile_card/custom_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================Setting Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.settings.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               CustomText(text: AppStrings.general.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black500,
                bottom: 10,
              ),

              ///====================Account Info================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.accountInfoScreen);
                },
                text: AppStrings.accountInfo.tr,
                leadingIcon: AppIcons.person,
              ),

              ///====================Change Password================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.changePasswordScreen);
                },
                text: AppStrings.changePassword.tr,
                leadingIcon: AppIcons.key,
              ),

              ///====================Change Password================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  // Get.toNamed(AppRoutes.signInScreen);
                },
                text: AppStrings.language.tr,
                leadingIcon: AppIcons.language,
              ),

              ///====================Address================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  // Get.toNamed(AppRoutes.signInScreen);
                },
                text: AppStrings.addresss.tr,
                leadingIcon: AppIcons.myLocation,
              ),

              ///====================termsAndConditions================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.termsAndConditionScreen);
                },
                text: AppStrings.termsAndConditions.tr,
                leadingIcon: AppIcons.report,
              ),

              ///====================privacyPolicy================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                text: AppStrings.privacyPolicy.tr,
                leadingIcon: AppIcons.verifiedUser,
              ),

              ///====================helpCenter================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  // Get.toNamed(AppRoutes.signInScreen);
                },
                text: AppStrings.helpCenter.tr,
                leadingIcon: AppIcons.help,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/profile_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_profile_card/custom_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class SettingScreen extends StatelessWidget {
     SettingScreen({super.key});
   final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

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
                  controller.firstNameController.text=controller.profileModel.value.data?.result?.name?? "";
                  controller.emailController.text=controller.profileModel.value.data?.result?.email?? "";
                  controller.phoneController.text=controller.profileModel.value.data?.result?.phoneNumber?? "";
                   context.pushNamed(RoutePath.accountInfoScreen);
                },
                text: AppStrings.accountInfo.tr,
                leadingIcon: AppIcons.person,
              ),

              ///====================Change Password================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                   context.pushNamed(RoutePath.changePasswordScreen);
                },
                text: AppStrings.changePassword.tr,
                leadingIcon: AppIcons.key,
              ),

              ///====================Language================
              // CustomProfileCard(
              //   isCevron: true,
              //   onTap: () {
              //      context.pushNamed(RoutePath.languageScreen);
              //   },
              //   text: AppStrings.language.tr,
              //   leadingIcon: AppIcons.language,
              // ),



              ///====================Address================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                  context.pushNamed(RoutePath.addressScreen);
                },
                text: AppStrings.addresss.tr,
                leadingIcon: AppIcons.myLocation,
              ),

              ///====================termsAndConditions================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                   context.pushNamed(RoutePath.termsAndConditionScreen);
                },
                text: AppStrings.termsAndConditions.tr,
                leadingIcon: AppIcons.report,
              ),

              ///====================privacyPolicy================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                   context.pushNamed(RoutePath.privacyPolicyScreen);
                },
                text: AppStrings.privacyPolicy.tr,
                leadingIcon: AppIcons.verifiedUser,
              ),

              ///====================helpCenter================
              CustomProfileCard(
                isCevron: true,
                onTap: () {
                   context.pushNamed(RoutePath.helpCenterScreen);
                },
                text: AppStrings.helpCenter.tr,
                leadingIcon: AppIcons.help,
              ),
            ],
          )
        ),
      ),
    );
  }



}

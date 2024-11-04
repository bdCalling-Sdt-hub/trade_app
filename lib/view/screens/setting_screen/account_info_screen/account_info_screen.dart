import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class AccountInfoScreen extends StatelessWidget {
  AccountInfoScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================accountInfo Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.accountInfo.tr,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: AppStrings.uploadPhoto.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black500,
                    bottom: 10,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  height: profileController.size.value.toDouble(),
                ),

                ///=====================Image Upload============
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {
                        profileController.selectImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.sp, color: AppColors.white700),
                        ),
                        child: profileController.imageFile.value == null
                            ? CustomNetworkImage(
                            boxShape: BoxShape.circle,
                            imageUrl: profileController.profileModel.value
                                .data?.profileImage
                                ?.startsWith('https') ??
                                false
                                ? profileController.profileModel.value
                                .data?.profileImage ??
                                ""
                                : '${ApiUrl.baseUrl}/${profileController.profileModel.value.data?.profileImage ?? ""}',
                            // imageUrl: AppImages.user3,
                            height: 90.w,
                            width: 90.w)
                            : Container(
                          height: 90.w,
                          width: 90.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(
                                  File(profileController
                                      .imageFile!.value.path),
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 23.h,
                ),

                ///==========================First Name==============
                CustomFromCard(
                    title: AppStrings.firstName.tr,
                    controller: profileController.firstNameController),

                // ///==========================lastName==============
                // CustomFromCard(
                //     title: AppStrings.lastName.tr,
                //     controller: profileController.lastNameController),

                ///==========================email==============
                CustomFromCard(
                    title: AppStrings.email.tr,
                    controller: profileController.emailController),

                ///==========================phoneNumber==============
                CustomFromCard(
                    title: AppStrings.phoneNumber.tr,
                    controller: profileController.phoneController),

                ///==========================Update Button==============
                SizedBox(
                  height: 24.h,
                ),
                profileController.profileUpdateLoading.value
                    ? const CustomLoader()
                    : CustomButton(
                  onTap: () {
                    profileController.updateProfile(context: context);
                  },
                  title: AppStrings.update.tr,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

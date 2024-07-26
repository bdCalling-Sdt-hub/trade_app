import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class AccountInfoScreen extends StatelessWidget {
  AccountInfoScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================accountInfo Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.accountInfo.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.uploadPhoto.tr,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.black500,
                bottom: 10,
              ),

              ///=====================Image Upload============
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      profileController.selectImage();
                    },
                    child: profileController.image.isNotEmpty
                        ? Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(profileController.image.value),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle),
                          )
                        : Stack(
                            children: [
                              CustomNetworkImage(
                                boxShape: BoxShape.circle,
                                imageUrl: AppConstants.userNtr,
                                height: 85.h,
                                width: 84.w,
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        color: AppColors.blue500,
                                        shape: BoxShape.circle),
                                    child: const CustomImage(
                                        imageSrc: AppIcons.photoCamera),
                                  ))
                            ],
                          )),
              ),
              SizedBox(
                height: 23.h,
              ),

              ///==========================First Name==============
              customEditProfile(
                  title: AppStrings.firstName.tr,
                  controller: profileController.firstNameController),

              ///==========================lastName==============
              customEditProfile(
                  title: AppStrings.lastName.tr,
                  controller: profileController.lastNameController),

              ///==========================email==============
              customEditProfile(
                  title: AppStrings.email.tr,
                  controller: profileController.emailController),

              ///==========================phoneNumber==============
              customEditProfile(
                  title: AppStrings.phoneNumber.tr,
                  controller: profileController.phoneController),

              ///==========================Update Button==============
              CustomButton(
                onTap: () {
                  Get.back();
                },
                title: AppStrings.update.tr,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///================================Custom EditProfile===================
  Widget customEditProfile({
    required String title,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: AppColors.black500,
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16.w,
          bottom: 8,
        ),
        CustomTextField(
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black500),
          fillColor: AppColors.white200,
          fieldBorderColor: AppColors.gray201,
          keyboardType: isPassword ? TextInputType.phone : TextInputType.name,
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';

import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================ChangePassword Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.changePassword.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.setYourNewPassword.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black500,
                bottom: 18,
              ),

              ///==========================EnterCurrentPassword==============
              customEditProfile(
                  isPassword: true,
                  title: AppStrings.enterCurrentPassword.tr,
                  controller: profileController.currentPasswordController,
                  validator: (String? value) {}),

              ///==========================enterNewPassword==============
              customEditProfile(
                  isPassword: true,
                  title: AppStrings.enterNewPassword.tr,
                  controller: profileController.newPasswordController,
                  validator: (String? value) {}),

              ///==========================retypeNewPassword==============
              customEditProfile(
                isPassword: true,
                  title: AppStrings.retypeNewPassword.tr,
                  controller: profileController.reTypePasswordController,
                  validator: (String? value) {}),
SizedBox(
  height: 20.h,
),
              ///==========================changePassword==============
              CustomButton(
                onTap: () {
                  Get.back();
                },
                title: AppStrings.changePassword.tr,
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
    required FormFieldValidator<String> validator,
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
          validator: validator,
          prefixIcon: const Icon(Icons.lock),
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black500),
          fillColor: AppColors.white200,
          fieldBorderColor: AppColors.black300,
          keyboardType: isPassword ? TextInputType.text : TextInputType.name,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

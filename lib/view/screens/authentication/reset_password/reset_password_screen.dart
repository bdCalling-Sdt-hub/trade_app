import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white50,
      ),
      backgroundColor: AppColors.white50,
      body: GetBuilder<AuthController>(builder: (controller) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///<=================================Title Text=====================================>
                Center(
                    child: CustomText(
                  text: AppStrings.resetPassword.tr,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
                CustomText(
                  text: AppStrings.setTheNewPasswordFor.tr,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  top: 8,
                  fontSize: 16.h,
                  bottom: 24.h,
                ),

                ///<==============================Password section====================================>
                CustomText(
                  text: AppStrings.enterNewPassword.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  bottom: 16.h,
                  top: 16.h,
                ),

                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (value.length < 8 ||
                        !AppStrings.passRegexp.hasMatch(value)) {
                      return AppStrings.passwordLengthAndContain.tr;
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomImage(
                      imageSrc: AppIcons.lock,
                      size: 24.h,
                    ),
                  ),
                  textEditingController: controller.newPassController,
                  hintText: AppStrings.enterNewPassword,
                ),

                ///<==============================Confirm Password section====================================>
                CustomText(
                  text: AppStrings.confirmPassword,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  bottom: 16.h,
                  top: 24.h,
                ),

                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    } else if (controller.newPassController.text !=
                        controller.confirmPassController.text) {
                      return AppStrings.passwordShould.tr;
                    }
                    return null;
                  },
                  textEditingController: controller.confirmPassController,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomImage(
                      imageSrc: AppIcons.lock,
                      size: 24.h,
                    ),
                  ),
                  hintText: AppStrings.retypeNewPassword.tr,
                ),

                SizedBox(
                  height: 24.h,
                ),

                ///<==================================   Button ===========================>
                controller.signInLoading.value
                    ? Align(
                        alignment: Alignment.center,
                        child: Lottie.asset('assets/lottie/loading.json',
                            width: context.width / 6, fit: BoxFit.cover),
                      )
                    : CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.resetPassword(context: context);
                          }
                        },
                        title: AppStrings.continues.tr,
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

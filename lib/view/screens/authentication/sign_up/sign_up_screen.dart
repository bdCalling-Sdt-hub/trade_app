import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_sign_up_from/custom_sign_up_from.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 44.h),
                  CustomText(
                    text: AppStrings.signUp.tr,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 24.h),

                  ///==============Welcome=============
                  Row(
                    children: [
                      CustomText(
                        text: AppStrings.welcomeBack.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.h,
                        right: 8.w,
                      ),
                      const CustomImage(
                        imageSrc: AppIcons.emoji,
                      ),
                    ],
                  ),

                  ///===============just a few quick=========
                  CustomText(
                    text: AppStrings.justAFewQuickThingsToGet.tr,
                    fontWeight: FontWeight.w500,
                    top: 4.h,
                    bottom: 24.h,
                  ),

                  ///================firstName===============
                  CustomSignUpFrom(
                    label: AppStrings.firstName,
                    hintText: AppStrings.enterYourFirstName,
                    controller: controller.firstNameController,
                    icon: AppIcons.person,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///====================Last Name============
                  CustomSignUpFrom(
                    label: AppStrings.lastName,
                    hintText: AppStrings.enterYourLastName,
                    controller: controller.lastNameController,
                    icon: AppIcons.person,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///================Email================
                  CustomSignUpFrom(
                    label: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    controller: controller.emailSignUp,
                    icon: AppIcons.mail,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///==================Mobile Number=-==========
                  CustomSignUpFrom(
                    label: AppStrings.mobileNumber,
                    hintText: AppStrings.enterYourNumber,
                    controller: controller.phoneSignUp,
                    icon: AppIcons.call,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///====================Address================
                  CustomSignUpFrom(
                    label: AppStrings.address,
                    hintText: AppStrings.enterYourAddress,
                    controller: controller.addressSignUp,
                    icon: AppIcons.locationHome,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///====================Password=================
                  CustomSignUpFrom(
                    label: AppStrings.password,
                    hintText: AppStrings.enterYourPassword,
                    controller: controller.passSignUp,
                    icon: AppIcons.lock,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  ///=======================Confirm Password===========
                  CustomSignUpFrom(
                    label: AppStrings.confirmPassword,
                    hintText: AppStrings.confirmPassword,
                    controller: controller.confirmPassSignup,
                    icon: AppIcons.lock,
                    isPassword: true,
                  ),
                  SizedBox(height: 8.h),

                  ///===================Checkbox here=================
                  _buildTermsAndConditions(controller: controller, context: context),
                  SizedBox(height: 8.h),

                  ///=========================Sign Up Button=============
                  controller.verifyLoading.value
                      ? Align(
                          alignment: Alignment.center,
                          child: Lottie.asset('assets/lottie/loading.json',
                              width: context.width / 6, fit: BoxFit.cover),
                        )
                      :  CustomButton(
                          onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.isTerms == false? toastMessage(message: 'Required the term condition'):    controller.signup(context: context);
                            }
                          },
                          title: AppStrings.signUp.tr,
                        ),
                  SizedBox(height: 24.h),

                  ///================Already Have a Account===============
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.alreadyHaveAnAccount.tr,
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutePath.signInScreen);
                        },
                        child: CustomText(
                          text: AppStrings.signIn.tr,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTermsAndConditions({required AuthController controller,required BuildContext context}) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.isTerms = !controller.isTerms;
              controller.update();
            },
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: AppColors.blue500,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: controller.isTerms
                      ? const Icon(
                          Icons.check,
                          color: AppColors.white50,
                          size: 14,
                        )
                      : const SizedBox(),
                ),
                CustomText(
                  left: 8.w,
                  fontWeight: FontWeight.w400,
                  text: AppStrings.iAgreeWithTheTermsAnd.tr,
                ),
              ],
            ),
          ),
          IconButton(
            icon: CustomText(
              text: 'terms and condition',
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,

            ),
            onPressed: () {
              context.pushNamed(RoutePath.termsAndConditionScreen);
            },
          )
        ],
      );
    });
  }
}

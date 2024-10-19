import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class OtpScreen extends StatelessWidget {
    OtpScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController pinController = TextEditingController();
  AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white50,
      ),
      backgroundColor: AppColors.white50,
      body: Obx((){
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
          child: Column(
            children: [
              ///<=================================Title Text=====================================>
              Center(
                  child: CustomText(
                    text: AppStrings.verificationCode.tr,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
              CustomText(
                text: AppStrings.weSendYouAVerificationCode.tr,
                fontWeight: FontWeight.w400,
                maxLines: 3,
                top: 8,
                fontSize: 16.h,
              ),

              SizedBox(
                height: 44.h,
              ),

              ///<======================================Pin Code Field============================>

              Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: AppStrings.enterYourCodeHere.tr,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    bottom: 16.h,
                  )),
              PinCodeTextField(
                cursorColor: AppColors.blue500,
                keyboardType: TextInputType.number,
                controller: pinController,
                enablePinAutofill: true,
                appContext: (context),
                onCompleted: (value) {
                  controller.OtpScreen.value = value.toString();
                  controller.update();
                },
                autoFocus: true,
                textStyle: TextStyle(color: AppColors.black500, fontSize: 24.h),
                pinTheme: PinTheme(
                  disabledColor: Colors.transparent,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 56.h,
                  fieldWidth: 47,
                  activeFillColor: AppColors.blue50,
                  selectedFillColor: AppColors.blue50,
                  inactiveFillColor: AppColors.white50,
                  borderWidth: 0.5,
                  errorBorderColor: Colors.red,
                  activeBorderWidth: 0.8,
                  selectedColor: AppColors.blue50,
                  inactiveColor: AppColors.blue50,
                  activeColor: AppColors.blue800,
                ),
                length: 6,
                enableActiveFill: true,
              ),

              SizedBox(
                height: 16.h,
              ),

              ///<==============================Resend Button=============================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Did not received any code?',
                  ),
                  TextButton(
                      onPressed: () {
                        if (controller.secondsRemaining.value == 0) {
                          //controller.secondsRemaining.value = 3;
                          // controller.startTimer();
                          controller.forgotResendOTP(context).then((value) {
                            if (value == false) {
                              controller.timer.cancel();
                              controller.secondsRemaining.value = 0;
                            }
                          });
                        }
                        // authController.secondsRemaining.value = 10;
                        // authController.startTimer();
                      },
                      child: CustomText(
                        text: controller.secondsRemaining.value == 0
                            ? "Resend OTP".tr
                            : "Resend OTP in ${controller.secondsRemaining}",
                      ))
                ],
              ),

              SizedBox(
                height: 24.h,
              ),

              ///<==================================Verify Button===========================>
              controller.signInLoading.value
                  ? Align(
                alignment: Alignment.center,
                child: Lottie.asset('assets/lottie/loading.json',
                    width: context.width / 6, fit: BoxFit.cover),
              )
                  : CustomButton(
                onTap: () {
                  controller.forgotOtpVerify(context: context);
                },
                title: AppStrings.continues.tr,
              ),
            ],
          ),
        );
      }),
    );
  }
}

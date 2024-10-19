import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class SignUpOtp extends StatefulWidget {
  const SignUpOtp({super.key});

  @override
  State<SignUpOtp> createState() => _SignUpOtpState();
}

class _SignUpOtpState extends State<SignUpOtp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController pinController = TextEditingController();
  AuthController controller=Get.find<AuthController>();

  int _secondsRemaining = 120;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

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
                   controller.signUpOtp.value = value.toString();
                  controller.update();
                },
                autoFocus: true,
                textStyle:   TextStyle(color: AppColors.black500,fontSize: 24.h),
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
                          controller.resendOTP(context).then((value) {
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
              controller.signUpLoading.value
                  ? Align(
                alignment: Alignment.center,
                child: Lottie.asset('assets/lottie/loading.json',
                    width: context.width / 6, fit: BoxFit.cover),
              ):  CustomButton(
                onTap: () {
                   controller.signUpOtpVerify(context: context);
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

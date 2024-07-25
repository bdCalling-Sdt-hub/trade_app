import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
      appBar: AppBar(),
      body: GetBuilder<AuthController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
              child: Column(
                children: [
                  ///<=================================Title Text=====================================>
                  const Center(
                      child: CustomText(
                        text: AppStrings.verificationCode,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  const CustomText(
                    text: AppStrings.weSendYouAVerificationCode,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    maxLines: 3,
                    top: 8,
                  ),

                  SizedBox(
                    height: 68.h,
                  ),

                  ///<======================================Pin Code Field============================>

                  PinCodeTextField(
                    cursorColor: AppColors.blue500,
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    enablePinAutofill: true,
                    appContext: (context),
                    onCompleted: (value) {
                     // controller.signUpOtp = value.toString();
                      controller.update();
                    },
                    autoFocus: true,
                    textStyle: const TextStyle(color: AppColors.black500),
                    pinTheme: PinTheme(
                      disabledColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 49.h,
                      fieldWidth: 47,
                      activeFillColor: AppColors.black50,
                      selectedFillColor: AppColors.white50,
                      inactiveFillColor: AppColors.white50,
                      borderWidth: 0.5,
                      errorBorderColor: Colors.red,
                      activeBorderWidth: 0.8,
                      selectedColor: AppColors.black50,
                      inactiveColor: AppColors.white50,
                      activeColor: AppColors.white50,
                    ),
                    length: 4,
                    enableActiveFill: true,
                  ),

                  SizedBox(
                    height: 28.h,
                  ),

                  ///<==============================Resend Button=============================>

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            const CustomText(
                              text: "Resend Otp",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            Container(
                              height: 1.h,
                              width: 105.w,
                              color: AppColors.blue500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      *//*TextButton(
                        onPressed: () {},
                        child: const CustomText(text: AppStrings.resendOTP)),*//*
                      GestureDetector(
                        onTap: () {
                          if (_secondsRemaining == 0) {
                            _secondsRemaining = 120;
                            startTimer();
                            controller.signUpResentOtp().then((value) {
                              if (value == false) {
                                setState(() {
                                  _timer.cancel();
                                  _secondsRemaining = 0;
                                });
                              }
                            }
                            );
                          }
                        },
                        child: CustomText(
                            text: _secondsRemaining == 0
                                ? "Resend OTP".tr
                                : "Resend SMS $_secondsRemaining",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),*/

                  SizedBox(
                    height: 56.h,
                  ),

                  ///<==================================Verify Button===========================>
                  CustomButton(
                    onTap: () {

                    },
                    title: AppStrings.continues.tr,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                  // controller.OtpScreen = value.toString();
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
                length: 4,
                enableActiveFill: true,
              ),

              SizedBox(
                height: 16.h,
              ),

              ///<==============================Resend Button=============================>

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: AppStrings.resendOtp.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue500,
                  ),
                ),
              ),

              /* Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      */ /*TextButton(
                        onPressed: () {},
                        child: const CustomText(text: AppStrings.resendOTP)),*/ /*
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
                height: 24.h,
              ),

              ///<==================================Verify Button===========================>
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.resetPasswordScreen);
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  String? _savedVideoUrl;


  Future<void> _saveUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('youtube_url', _urlController.text);
    setState(() {
      _savedVideoUrl = _urlController.text;
      _urlController.clear();
    });
  }

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
                  SizedBox(
                    height: 44.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: AppStrings.signIn.tr,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(
                    height: 24.h,
                  ),
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
                      )
                    ],
                  ),

                  CustomText(
                    text: AppStrings.pleaseSignInToContinueAccess,
                    fontWeight: FontWeight.w500,
                    top: 4.h,
                    bottom: 24.h,
                  ),

                  ///<======================================= Email section ======================================>
                  CustomText(
                    text: AppStrings.email.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8.h,
                  ),

                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.fieldCantBeEmpty.tr;
                      } else if (!AppStrings.emailRegexp
                          .hasMatch(controller.signInEmail.text)) {
                        return AppStrings.enterValidEmail;
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.next,
                    textEditingController: controller.signInEmail,
                    hintText: AppStrings.enterYourEmail.tr,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomImage(
                        imageSrc: AppIcons.mail,
                        size: 24.h,
                      ),
                    ),
                  ),

                  ///<=======================================Password section======================================>
                  CustomText(
                    text: AppStrings.password.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    top: 16.h,
                    bottom: 8.h,
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
                    textEditingController: controller.passWordSignIn,
                    textInputAction: TextInputAction.done,
                    isPassword: true,
                    hintText: AppStrings.enterYourPassword.tr,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomImage(
                        imageSrc: AppIcons.lock,
                        size: 24.h,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 24.h,
                  ),

                  ///<======================================= remember && forgot pass ======================================>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// <===============================================Remember button==============================>
                      GestureDetector(
                        onTap: () {
                          controller.isRemember.value = !controller.isRemember.value;
                          controller.update();
                          SharePrefsHelper.setBool(AppConstants.isRememberMe, controller.isRemember.value);
                          print(controller.isRemember.value);
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
                              child: Center(
                                child: controller.isRemember.value
                                    ? Icon(
                                        Icons.check,
                                        color: controller.isRemember.value
                                            ? AppColors.white50
                                            : AppColors.blue500,
                                        size: 14,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                            CustomText(
                              left: 8.w,
                              fontWeight: FontWeight.w400,
                              text: AppStrings.rememberMe.tr,
                            ),
                          ],
                        ),
                      ),

                      /// <===============================================Forgot Password  Button============================>

                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutePath.forgotPasswordScreen);
                        },
                        child: CustomText(
                          text: AppStrings.forgotPassword.tr,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 24.h,
                  ),

                  ///<======================================= sign in button ======================================>
                  controller.signInLoading.value
                      ? Align(
                          alignment: Alignment.center,
                          child: Lottie.asset('assets/lottie/loading.json',
                              width: context.width / 6, fit: BoxFit.cover),
                        )
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              controller.signIn(context: context);
                            }
                          },
                          title: AppStrings.signIn.tr,
                        ),

                  SizedBox(
                    height: 24.h,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          textEditingController: _urlController,
                          hintText: 'Enter youtube video url',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      ElevatedButton(
                        onPressed: () {
                          if (_urlController.text.isNotEmpty) {
                            _saveUrl();
                          }
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 24.h,
                  ),

                  ///<======================================= dontHaveAnAccount ======================================>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.dontHaveAnAccount.tr,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),

                      /// <============================== Sign Up ==============================>
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutePath.signUpScreen);
                        },
                        child: CustomText(
                          text: AppStrings.signUp.tr,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue500,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
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
              children: [
                ///<=================================Title Text=====================================>
                Center(
                    child: CustomText(
                  text: AppStrings.forgotPassword.tr,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
                CustomText(
                  text: AppStrings.enterYourEmailAndWeWillSendYou.tr,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  top: 16,
                  fontSize: 16.h,
                ),

                SizedBox(
                  height: 44.h,
                ),

                ///<====================================== email ============================>

                Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: AppStrings.email.tr,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      bottom: 16.h,
                    )),

                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (!AppStrings.emailRegexp
                        .hasMatch(controller.forgotPassEmailController.text)) {
                      return AppStrings.enterValidEmail;
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  textEditingController: controller.forgotPassEmailController,
                  hintText: AppStrings.enterYourEmail.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomImage(
                      imageSrc: AppIcons.mail,
                      size: 24.h,
                    ),
                  ),
                ),

                SizedBox(
                  height: 24.h,
                ),

                ///<==================================Verify Button===========================>
                CustomButton(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                          context.pushNamed(RoutePath.otpScreen);
                    }
                    // Get.toNamed(AppRoutes.signInScreen);
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

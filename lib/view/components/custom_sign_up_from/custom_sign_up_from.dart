import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

class CustomSignUpFrom extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final String icon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomSignUpFrom({super.key,
     this.label ,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label!.tr,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          bottom: 8.h,
        ),
        CustomTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.fieldCantBeEmpty.tr;
            }
            if (label == AppStrings.email &&
                !AppStrings.emailRegexp.hasMatch(value)) {
              return AppStrings.enterValidEmail.tr;
            }
            if (label == AppStrings.password &&
                (value.length < 8 || !AppStrings.passRegexp.hasMatch(value))) {
              return AppStrings.passwordLengthAndContain.tr;
            }
            if (label == AppStrings.confirmPassword &&
                value != authController.passSignUp.text) {
              return AppStrings.passwordShould.tr;
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          textEditingController: controller,
          hintText: hintText.tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomImage(
              imageSrc: icon,
              size: 24.h,
            ),
          ),
          isPassword: isPassword,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

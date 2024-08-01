import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class CustomFromCard extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool isIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isBackgroundColor;
  final bool isMaxLine;
  final String? Function(String?)? validator;

  const CustomFromCard({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.isIcon = false,
    this.readOnly = false,
    this.onTap,
    this.isBackgroundColor = false, this.isMaxLine=false, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textAlign: TextAlign.start,
          color: AppColors.black500,
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          bottom: 8.h,
          maxLines: 2,
        ),
        CustomTextField(
          validator: validator,
          readOnly: readOnly,
          suffixIcon: isIcon ? const Icon(Icons.keyboard_arrow_down) : null,
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black500),
          fillColor: isBackgroundColor ? AppColors.blue100 : AppColors.white200,
          fieldBorderColor: AppColors.gray201,
          keyboardType: isPassword ? TextInputType.phone : TextInputType.name,
          onTap: onTap,
          maxLines: isMaxLine?8:1,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

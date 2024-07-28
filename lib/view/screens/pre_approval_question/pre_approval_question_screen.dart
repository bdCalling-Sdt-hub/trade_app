import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class PreApprovalQuestionScreen extends StatelessWidget {
  const PreApprovalQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///============================ preApprovalQuestions =======================>
      appBar: CustomAppBar(
        appBarContent: AppStrings.preApprovalQuestions.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: AppStrings.pleaseFillUpThisForm.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 16.h,),

            ///<================================= name ====================================>
            CustomText(text: AppStrings.name.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,),
            CustomTextField(
             // textEditingController: controller,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),
          ],
        ),
      ),
    );
  }
}

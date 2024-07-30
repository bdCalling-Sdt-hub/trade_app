import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';
import 'package:trade_app/view/screens/questions/inner/question_submit_pop.dart';

class PreApprovalQuestion3Screen extends StatelessWidget {
  PreApprovalQuestion3Screen({super.key});

  PackageController controller=Get.find<PackageController>();
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

            ///<================================= datesOfTravel ====================================>
            CustomText(text: AppStrings.datesOfTravel.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,),
            CustomTextField(
              textEditingController: controller.dateTravelController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            SizedBox(height: 16.h,),
            CustomText(text: AppStrings.travelStart.tr,fontSize: 18.h,fontWeight: FontWeight.w500,),

            ///<================================= destination ====================================>
            CustomText(text: AppStrings.destination.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
               textEditingController: controller.destinationStartController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= state ====================================>
            CustomText(text: AppStrings.state.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.stateStartController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= country ====================================>
            CustomText(text: AppStrings.country.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.countryStartController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            CustomText(text: AppStrings.travelEnd.tr,fontSize: 18.h,fontWeight: FontWeight.w500,top: 16.h,),

            ///<================================= destination ====================================>
            CustomText(text: AppStrings.destination.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.destinationEndController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= state ====================================>
            CustomText(text: AppStrings.state.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.stateEndController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= country ====================================>
            CustomText(text: AppStrings.country.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.countryEndController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= profession ====================================>
            CustomText(text: AppStrings.profession.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.professionController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= whatYourReligion ====================================>
            CustomText(text: AppStrings.whatYourReligion.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.religionController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            SizedBox(height: 24.h,),
            ///<================================= submit button ====================================>
            CustomButton(onTap: (){
              showDialog(context: context, builder: (index){
                return QuestionSubmitPop();
              });
            },title: AppStrings.submit.tr,)

          ],
        ),
      ),
    );
  }
}

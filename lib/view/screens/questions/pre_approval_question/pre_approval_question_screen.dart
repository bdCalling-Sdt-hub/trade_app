import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PreApprovalQuestionScreen extends StatelessWidget {
    PreApprovalQuestionScreen({super.key});

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

            ///<================================= name ====================================>
            CustomText(text: AppStrings.name.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,),
            CustomTextField(
              textEditingController: controller.nameController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= dateOfBirth ====================================>
            CustomText(text: AppStrings.dateOfBirth.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              // textEditingController: controller.,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= placeOfBirth ====================================>
            CustomText(text: AppStrings.placeOfBirth.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
               textEditingController: controller.placeBirthController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= licenceNo ====================================>
            CustomText(text: AppStrings.licenceNo.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.licenseNoController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= password ====================================>
            CustomText(text: AppStrings.password.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.passwordController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= email ====================================>
            CustomText(text: AppStrings.email.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.emailController,
              inputTextStyle: const TextStyle(color: AppColors.black500),
              fillColor: AppColors.white200,
              fieldBorderColor: AppColors.gray201,
            ),

            ///<================================= phoneNumber ====================================>
            CustomText(text: AppStrings.phoneNumber.tr,fontSize: 18.h,fontWeight: FontWeight.w500,bottom: 8.h,top: 16.h,),
            CustomTextField(
              textEditingController: controller.phnNumberController,
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
            ///<================================= next button ====================================>
             Align(
               alignment: Alignment.center,
               child: GestureDetector(
                 onTap: (){
                   Get.toNamed(AppRoutes.preApprovalQuestion2Screen);
                 },
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.w),
                   decoration: BoxDecoration(
                     color: AppColors.blue500,
                     borderRadius: BorderRadius.circular(4.sp)
                   ),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       CustomText(text: AppStrings.next,color: AppColors.white50,right: 8.h,fontWeight: FontWeight.w500,fontSize: 18.h,),
                       const CustomImage(imageSrc: AppIcons.arrowRight,imageColor: AppColors.white50,),
                     ],
                   ),
                 ),
               ),
             ),


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PreApprovalQuestionScreen extends StatelessWidget {
  PreApprovalQuestionScreen({super.key});

  final PackageController controller = Get.find<PackageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================ preApprovalQuestions =======================>
      appBar: CustomAppBar(
        appBarContent: AppStrings.preApprovalQuestions.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.pleaseFillUpThisForm.tr,
              fontSize: 18.h,
              fontWeight: FontWeight.w500,
              bottom: 16.h,
            ),

            ///<================================= name ====================================>
            CustomFromCard(
                title: AppStrings.name, controller: controller.nameController),

            ///<================================= dateOfBirth ====================================>
            CustomFromCard(
                onTap: () {},
                title: AppStrings.dateOfBirth,
                controller: controller.destinationStartController),

            ///<================================= placeOfBirth ====================================>
            CustomFromCard(
                title: AppStrings.placeOfBirth,
                controller: controller.placeBirthController),

            ///<================================= licenceNo ====================================>
            CustomFromCard(
                title: AppStrings.licenceNo,
                controller: controller.licenseNoController),

            ///<================================= password ====================================>
            CustomFromCard(
                isPassword: true,
                title: AppStrings.password,
                controller: controller.passwordController),

            ///<================================= email ====================================>
            CustomFromCard(
                title: AppStrings.email,
                controller: controller.emailController),

            ///<================================= phoneNumber ====================================>
            CustomFromCard(
                title: AppStrings.phoneNumber,
                controller: controller.destinationStartController),

            ///<================================= profession ====================================>
            CustomFromCard(
                title: AppStrings.profession,
                controller: controller.professionController),

            ///<================================= whatYourReligion ====================================>
            CustomFromCard(
                title: AppStrings.whatYourReligion,
                controller: controller.religionController),

            SizedBox(
              height: 24.h,
            ),

            ///<================================= next button ====================================>

            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.preApprovalQuestion2Screen);
                },
                child: CustomDetailContainer(
                    color: AppColors.blue500,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: AppStrings.next,
                          color: AppColors.white50,
                          right: 8.h,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.h,
                        ),
                        const CustomImage(
                          imageSrc: AppIcons.arrowRight,
                          imageColor: AppColors.white50,
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

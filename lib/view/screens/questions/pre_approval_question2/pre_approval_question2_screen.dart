import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_radio_button/custom_radio_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PreApprovalQuestion2Screen extends StatelessWidget {
  PreApprovalQuestion2Screen({super.key, required this.planId, required this.amount, required this.planType});
  final String planId;
  final int amount;
  final String planType;

  PackageController controller = Get.find<PackageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///========================question 2================
      appBar: CustomAppBar(
        appBarContent: AppStrings.preApprovalQuestions.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.pleaseFillUpThisForm.tr,
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
              ),
              CustomRadioButton(
                title: 'Do you have pets?',
                options: const ['Yes', 'No'],
                selectedOption: controller.selectedPets.value,
                onOptionChanged: (index) {
                  controller.selectedPets.value = index;
                },
              ),
              SizedBox(height: 12.h),
              CustomRadioButton(
                title: 'Do you have children?',
                options: const ['Yes', 'No'],
                selectedOption: controller.selectedChildren.value,
                onOptionChanged: (index) {
                  controller.selectedChildren.value = index;
                },
              ),
              CustomRadioButton(
                title: 'Do you own a vehicle?',
                options: const ['Yes', 'No'],
                selectedOption: controller.haveVehicle.value,
                onOptionChanged: (index) {
                  controller.haveVehicle.value = index;
                },
              ),
              CustomRadioButton(
                title: 'Are you willing to swap your vehicles?',
                options: const ['Yes', 'No'],
                selectedOption: controller.willingVehicle.value,
                onOptionChanged: (index) {
                  controller.willingVehicle.value = index;
                },
              ),
              CustomRadioButton(
                title: 'Are you owner or leasing your property?',
                options: const ['Yes', 'No'],
                selectedOption: controller.ownerOfProperty.value,
                onOptionChanged: (index) {
                  controller.ownerOfProperty.value = index;
                },
              ),
              CustomRadioButton(
                title:
                    'Will you able to provide approval from owner for temp swap?',
                options: const ['Yes', 'No'],
                selectedOption: controller.ableApproveForm.value,
                onOptionChanged: (index) {
                  controller.ableApproveForm.value = index;
                },
              ),
              CustomRadioButton(
                title: 'Is your property insured?',
                options: const ['Yes', 'No'],
                selectedOption: controller.propertyInsured.value,
                onOptionChanged: (index) {
                  controller.propertyInsured.value = index;
                },
              ),
              CustomRadioButton(
                title: 'Will your utilities be upto date for swap?',
                options: const ['Yes', 'No'],
                selectedOption: controller.utilitiesUptoDate.value,
                onOptionChanged: (index) {
                  controller.utilitiesUptoDate.value = index;
                },
              ),
              // CustomRadioButton(
              //   title: 'What do you want to swap and for how long?',
              //   options: const ['Yes', 'No'],
              //   selectedOption: selectedChildren.value,
              //   onOptionChanged: (index) {
              //     selectedChildren.value = index;
              //   },
              // ),
              CustomFromCard(
                  isMaxLine: true,
                  title: 'What do you want to swap and for how long?',
                  controller: controller.swapAboutController),
              CustomRadioButton(
                title:
                    'Do you want to arrive on departure or depart on arrival?',
                options: const ['Arrive on departure', 'Depart on arrival '],
                selectedOption: controller.departureArrival.value,
                onOptionChanged: (index) {
                  controller.departureArrival.value = index;
                },
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        border: Border.all(width: 1, color: AppColors.blue500),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomImage(
                            imageSrc: AppIcons.arrowLeftAlt,
                            imageColor: AppColors.blue500,
                          ),
                          CustomText(
                            text: AppStrings.back,
                            color: AppColors.blue500,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {
                      print(controller.planType.value);
                      print(controller.planId.value);
                      print(controller.amount.value);


                      context.pushNamed(RoutePath.preApprovalQuestion3Screen,

                        queryParameters: {
                          "plan_id": planId ?? '',
                          "amount": (amount ?? 0).toString(),
                          "planType":planType  ?? '',
                        },
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.blue500,
                        borderRadius: BorderRadius.circular(4.sp),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: AppStrings.next,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                          const CustomImage(
                            imageSrc: AppIcons.arrowRight,
                            imageColor: AppColors.white50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

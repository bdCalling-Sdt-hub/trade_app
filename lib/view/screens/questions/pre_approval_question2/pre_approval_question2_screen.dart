import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_radio_button/custom_radio_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PreApprovalQuestion2Screen extends StatelessWidget {
  const PreApprovalQuestion2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final PackageController controller = Get.find<PackageController>();
    final RxInt selectedPets = 0.obs;
    final RxInt selectedChildren = 0.obs;
    final RxInt one = 0.obs;
    final RxInt two = 0.obs;
    final RxInt three = 0.obs;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: AppStrings.preApprovalQuestions.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Obx(
        () {
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
                  options: ['Yes', 'No'],
                  selectedOption: selectedPets.value,
                  onOptionChanged: (index) {
                    selectedPets.value = index;
                  },
                ),
                SizedBox(height: 12.h),
                CustomRadioButton(
                  title: 'Do you have children?',
                  options: ['Yes', 'No'],
                  selectedOption: selectedChildren.value,
                  onOptionChanged: (index) {
                    selectedChildren.value = index;
                  },
                ),
                CustomRadioButton(
                  title: 'Do you own a vehicle?',
                  options: ['Yes', 'No'],
                  selectedOption: one.value,
                  onOptionChanged: (index) {
                    one.value = index;
                  },
                ), CustomRadioButton(
                  title: 'Are you willing to swap your vehicles?',
                  options: ['Yes', 'No'],
                  selectedOption: two.value,
                  onOptionChanged: (index) {
                    two.value = index;
                  },
                ), CustomRadioButton(
                  title: 'Are you owner or leasing your property?',
                  options: ['Yes', 'No'],
                  selectedOption: selectedChildren.value,
                  onOptionChanged: (index) {
                    selectedChildren.value = index;
                  },
                ),CustomRadioButton(
                  title: 'Will you able to provide approval from owner for temp swap?',
                  options: ['Yes', 'No'],
                  selectedOption: three.value,
                  onOptionChanged: (index) {
                    three.value = index;
                  },
                ),CustomRadioButton(
                  title: 'Is your property insured?',
                  options: ['Yes', 'No'],
                  selectedOption: selectedChildren.value,
                  onOptionChanged: (index) {
                    selectedChildren.value = index;
                  },
                ),CustomRadioButton(
                  title: 'Will your utilities be upto date for swap?',
                  options: ['Yes', 'No'],
                  selectedOption: one.value,
                  onOptionChanged: (index) {
                    one.value = index;
                  },
                ),CustomRadioButton(
                  title: 'What do you want to swap and for how long?',
                  options: ['Yes', 'No'],
                  selectedOption: selectedChildren.value,
                  onOptionChanged: (index) {
                    selectedChildren.value = index;
                  },
                ),CustomRadioButton(
                  title: 'Do you want to arrive on departure or depart on arrival?',
                  options: ['Yes', 'No'],
                  selectedOption: three.value,
                  onOptionChanged: (index) {
                    three.value = index;
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
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
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
                        Get.toNamed(AppRoutes.preApprovalQuestion3Screen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
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
          }
        ),
      ),
    );
  }
}


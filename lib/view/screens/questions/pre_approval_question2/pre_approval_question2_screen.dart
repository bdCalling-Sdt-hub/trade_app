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

class PreApprovalQuestion2Screen extends StatefulWidget {
  PreApprovalQuestion2Screen({super.key});

  @override
  State<PreApprovalQuestion2Screen> createState() =>
      _PreApprovalQuestion2ScreenState();
}

class _PreApprovalQuestion2ScreenState
    extends State<PreApprovalQuestion2Screen> {
  PackageController controller = Get.find<PackageController>();
  String? _selectedGender = 'Male';

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedGender = value;
    });
  }

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

            CustomText(
              text: "Do you have a question ?",
              fontSize: 18.h,
              fontWeight: FontWeight.w500,
              bottom: 16.h,
            ),

            RadioListTile<String>(
              title: Text('Yes'),
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: _handleRadioValueChange,
            ),
            RadioListTile<String>(
              title: Text('NO'),
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: _handleRadioValueChange,
            ),

            ///<================================= next button ====================================>
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
                        border: Border.all(width: 1, color: AppColors.blue500)),
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
                          left: 8.h,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.preApprovalQuestion3Screen);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: AppColors.blue500,
                        borderRadius: BorderRadius.circular(4.sp)),
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
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

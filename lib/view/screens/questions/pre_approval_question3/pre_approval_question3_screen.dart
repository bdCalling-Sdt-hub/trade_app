import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_radio_button/custom_radio_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';
import 'package:trade_app/view/screens/questions/inner/question_submit_pop.dart';

class PreApprovalQuestion3Screen extends StatelessWidget {
  PreApprovalQuestion3Screen({super.key});

  final PackageController controller = Get.find<PackageController>();
  final RxInt three = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================ Section 3 Appbar =======================>
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
                bottom: 16.h,
              ),

              ///<================================= datesOfTravel ====================================>

              CustomFromCard(
                  title: AppStrings.datesOfTravel,
                  controller: controller.dateTravelController),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                text: AppStrings.travelStart.tr,
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                bottom: 10,
              ),

              ///<================================= destination ====================================>

              CustomFromCard(
                  title: AppStrings.destination,
                  controller: controller.destinationStartController),

              ///<================================= state ====================================>
              CustomFromCard(
                  title: AppStrings.state,
                  controller: controller.stateStartController),
              SizedBox(
                height: 10.h,
              ),

              ///=========================County================
              CustomFromCard(
                  title: AppStrings.county,
                  controller: TextEditingController()),

              ///<================================= country ====================================>
              CustomFromCard(
                  title: AppStrings.country,
                  controller: controller.countryStartController),

              CustomText(
                text: AppStrings.travelEnd.tr,
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                top: 16.h,
              ),

              ///<================================= destination ====================================>
              CustomFromCard(
                  title: AppStrings.destination,
                  controller: controller.destinationEndController),

              ///<================================= state ====================================>
              CustomFromCard(
                  title: AppStrings.state,
                  controller: controller.stateEndController),
              SizedBox(
                height: 10.h,
              ),

              ///=========================County================
              CustomFromCard(
                  title: AppStrings.county,
                  controller: TextEditingController()),

              ///<================================= country ====================================>
              CustomFromCard(
                  title: AppStrings.country,
                  controller: controller.countryEndController),
              SizedBox(
                height: 10.h,
              ),
              ///========================Purpose of travel?================
              /*CustomRadioButton(
                title: 'Purpose of travel?',
                options: const ['Business', 'Pleasure', 'Recreational'],
                selectedOption: three.value,
                onOptionChanged: (index) {
                  three.value = index;
                },
              ),*/

              SizedBox(
                height: 24.h,
              ),

              ///<================================= submit button ====================================>
              CustomButton(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (index) {
                        return const QuestionSubmitPop();
                      });
                },
                title: AppStrings.submit.tr,
              )
            ],
          );
        }),
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PreApprovalQuestionScreen extends StatelessWidget {
  PreApprovalQuestionScreen(
      {super.key,
      required this.planId,
      required this.amount,
      required this.planType});

  final String planId;
  final int amount;
  final String planType;

  final PackageController controller = Get.find<PackageController>();
  final PostController postController = Get.find<PostController>();

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

              ///<================================= name ====================================>
              CustomFromCard(
                  title: AppStrings.name,
                  controller: controller.nameController),

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

              ///<================================= PassPort ====================================>
              CustomFromCard(
                  title: AppStrings.passport,
                  controller: controller.passwordController),

              ///<================================= email ====================================>
              // CustomFromCard(
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return AppStrings.fieldCantBeEmpty.tr;
              //       } else if (!AppStrings.emailRegexp
              //           .hasMatch(controller.emailController.text)) {
              //         return AppStrings.enterValidEmail;
              //       } else {
              //         return null;
              //       }
              //     },
              //     title: AppStrings.email,
              //     controller: controller.emailController),
              CustomText(
                textAlign: TextAlign.start,
                color: AppColors.black500,
                text: AppStrings.email,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                bottom: 8.h,
                maxLines: 2,
              ),
              CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.fieldCantBeEmpty.tr;
                    } else if (!AppStrings.emailRegexp
                        .hasMatch(controller.emailController.text)) {
                      return AppStrings.enterValidEmail;
                    } else {
                      return null;
                    }
                  },
                  textEditingController: controller.emailController),

              SizedBox(
                height: 12.h,
              ),

              ///<================================= phoneNumber ====================================>
              CustomFromCard(
                  title: AppStrings.phoneNumber,
                  controller: controller.phnNumberController),

              ///<================================= profession ====================================>
              CustomText(
                textAlign: TextAlign.start,
                color: AppColors.black500,
                text: AppStrings.profession,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                bottom: 8.h,
                maxLines: 2,
              ),
              // CustomDropdown(
              //   dropdownName: 'developer',
              //   length: 2,
              //   title: AppStrings.profession,
              //   textColor: AppColors.white200,
              //   controller: postController.professionController,
              //   isDropdownVisible: postController.isProfession.value,
              //   onTap: () {
              //     postController.isProfession.value =
              //         !postController.isProfession.value;
              //   },
              //   options: postController.profession,
              //   onSelect: (index) {
              //     postController.selectProfession.value = index;
              //     postController.professionController.text = postController
              //         .profession[postController.selectProfession.value];
              //     postController.isProfession.value = false;
              //     postController.isProfession.refresh();
              //   },
              // ),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                value: postController.profession.first,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                items: postController.profession.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14)),
                )).toList(),
                onChanged: (value) {
                  if(value != null){
                    controller.professionController.text = value;
                  }
                },
                onSaved: (value) {

                },
              ),
              CustomText(
                textAlign: TextAlign.start,
                color: AppColors.black500,
                text: AppStrings.whatYourReligion,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                bottom: 8.h,
                maxLines: 2,
                top: 10,
              ),

              ///<================================= whatYourReligion ====================================>
              DropdownButtonFormField2<String>(
                isExpanded: true,
                value: postController.religion.first,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                items: postController.religion.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14)),
                )).toList(),
                onChanged: (value) {
                  if(value != null){
                    controller.religionController.text = value;
                  }
                },
                onSaved: (value) {

                },
              ),

              SizedBox(
                height: 24.h,
              ),

              ///<================================= next button ====================================>
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      RoutePath.preApprovalQuestion2Screen,
                      queryParameters: {
                        "plan_id": planId ?? '',
                        "amount": (amount ?? 0).toString(),
                        "planType": planType ?? '',
                      },
                    );
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
          );
        }),
      ),
    );
  }
}

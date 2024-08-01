import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PostAddScreen extends StatelessWidget {
  PostAddScreen({super.key});

  final PostController postController = Get.find<PostController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 3),

      ///======================Post  add appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.postAnAd.tr,
      ),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///==========================productDetails=======
                    CustomText(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                      fontSize: 18,
                      text: '${AppStrings.productDetails}:'.tr,
                      bottom: 12,
                    ),

                    ///========================Product Categories===========
                    CustomFromCard(
                        isBackgroundColor: true,
                        readOnly: true,
                        title: AppStrings.productCategory.tr,
                        controller: postController.productCategoryController),

                    CustomText(
                      color: AppColors.black500,
                      text: AppStrings.subCategory.tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      bottom: 8.h,
                    ),
                    ///=========================subCategory====================
                    CustomDropdown(
                      title: AppStrings.subCategory,
                      textColor: AppColors.white200,
                      controller: postController.subCategoriesController,
                      isDropdownVisible: postController.isSubCategories.value,
                      onTap: () {
                        postController.isSubCategories.value =
                        !postController.isSubCategories.value;
                        postController.update();
                      },
                      options: postController.subCategoriesList,
                      onSelect: (index) {
                        postController.selectedCategory.value = index;
                        postController.subCategoriesController.text =
                        postController.subCategoriesList[
                        postController.selectedCategory.value];
                        postController.isSubCategories.value = false;
                        postController.isSubCategories.refresh();
                      },
                    ),

                    ///========================Product Title===========
                    CustomFromCard(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.fieldCantBeEmpty;
                          }
                          return null;
                        },
                        title: AppStrings.productTitle.tr,
                        controller: postController.productTitleController),

                    ///========================Condition===========
                    CustomFromCard(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.fieldCantBeEmpty;
                          }
                          return null;
                        },
                        title: AppStrings.condition.tr,
                        controller: postController.conditionController),

                    ///========================Description===========
                    CustomFromCard(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.fieldCantBeEmpty;
                          }
                          return null;
                        },
                        isMaxLine: true,
                        title: AppStrings.description.tr,
                        controller: postController.descriptionController),

                    ///========================Product Value===========
                    CustomFromCard(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.fieldCantBeEmpty;
                          }
                          return null;
                        },
                        title: AppStrings.productValue.tr,
                        controller: postController.productValueController),

                    ///========================Address===========
                    CustomFromCard(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.fieldCantBeEmpty;
                          }
                          return null;
                        },
                        title: AppStrings.addresss.tr,
                        controller: postController.addressController),

                    ///======================Add Photo================

                    ///========================Post ad Button===============
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.back();
                        }
                      },
                      title: AppStrings.postAd,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

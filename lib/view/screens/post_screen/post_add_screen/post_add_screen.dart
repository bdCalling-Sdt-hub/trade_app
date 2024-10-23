import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class PostAddScreen extends StatefulWidget {
  PostAddScreen({super.key, required this.catName});

  final String catName;

  @override
  State<PostAddScreen> createState() => _PostAddScreenState();
}

class _PostAddScreenState extends State<PostAddScreen> {
  final PostController postController = Get.find<PostController>();

  HomeController controller = Get.find<HomeController>();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSubCategory(context: context,category: widget.catName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 3),
      appBar: CustomAppBar(
        appBarContent: AppStrings.postAnAd.tr,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black500,
                    fontSize: 18,
                    text: '${AppStrings.productDetails}:'.tr,
                    bottom: 12,
                  ),
                  CustomText(
                    color: AppColors.black500,
                    text: AppStrings.categories.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    bottom: 8.h,
                  ),
                  ///<============================ category name =======================>
                  Container(
                    width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.blue100,
                        borderRadius: BorderRadius.circular(8.sp)
                      ),
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: widget.catName,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.h,

                      )),
                  SizedBox(height: 16.h,),

                  // CustomFromCard(
                  //   isBackgroundColor: true,
                  //   readOnly: true,
                  //   title: AppStrings.productCategory.tr,
                  //   controller: postController.productCategoryController,
                  // ),

                  CustomText(
                    color: AppColors.black500,
                    text: AppStrings.subCategory.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    bottom: 8.h,
                  ),
                  CustomDropdown(
                    title: AppStrings.subCategory,
                    textColor: AppColors.white200,
                    controller: postController.subCategoriesController,
                    isDropdownVisible: postController.isSubCategories.value,
                    onTap: () {
                      postController.isSubCategories.value =
                          !postController.isSubCategories.value;
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
                  CustomFromCard(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    title: AppStrings.productTitle.tr,
                    controller: postController.productTitleController,
                  ),
                  CustomFromCard(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    title: AppStrings.condition.tr,
                    controller: postController.conditionController,
                  ),
                  CustomFromCard(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    isMaxLine: true,
                    title: AppStrings.description.tr,
                    controller: postController.descriptionController,
                  ),
                  CustomFromCard(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    title: AppStrings.productValue.tr,
                    controller: postController.productValueController,
                  ),
                  CustomFromCard(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    title: AppStrings.address.tr,
                    controller: postController.addressController,
                  ),
                  CustomText(
                    color: AppColors.black500,
                    text: AppStrings.addPhoto.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    bottom: 8.h,
                  ),
                  GestureDetector(
                    onTap: postController.pickMultiImage,
                    child: const CustomDetailContainer(
                      isBorder: true,
                      height: 100,
                      weight: double.infinity,
                      color: AppColors.white200,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          CustomImage(
                            imageSrc: AppIcons.photoCamera,
                            imageColor: AppColors.blue500,
                          ),
                          CustomText(
                            text: AppStrings.addPhoto,
                            color: AppColors.blue500,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        postController.selectedImagesMulti.length,
                        (index) {
                          final imageFile =
                              postController.selectedImagesMulti[index];

                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 5.w),
                                height: 100.h,
                                width: 100.w,
                                // Set a width for the image container
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(imageFile),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    postController.selectedImagesMulti
                                        .removeAt(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red.withOpacity(0.8),
                                    ),
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // Handle the post ad submission logic here
                        Get.back(); // Navigate back or to the desired screen
                      }
                    },
                    title: AppStrings.postAd,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

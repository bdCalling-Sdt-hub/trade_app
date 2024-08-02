import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class PostEditScreen extends StatelessWidget {
   PostEditScreen({super.key});

  final PostController postController = Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      ///======================editAd appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.editAd.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Obx(
           () {
              return Column(
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
                      title: AppStrings.productCategory.tr,
                      controller: TextEditingController(text: 'Phone')),

                  ///========================Product Title===========
                  CustomFromCard(
                      title: AppStrings.productTitle.tr,
                      controller: TextEditingController(text: 'Title Here')),

                  ///========================Condition===========
                  CustomFromCard(
                      title: AppStrings.condition.tr,
                      controller: TextEditingController(text: 'Used')),

                  ///========================Description===========
                  CustomFromCard(
                      isMaxLine: true,
                      title: AppStrings.description.tr,
                      controller: TextEditingController(text: 'This is Good Product')),

                  ///========================Product Value===========
                  CustomFromCard(
                      title: AppStrings.productValue.tr,
                      controller: TextEditingController(text: '100')),

                  ///========================Address===========
                  CustomFromCard(
                      title: AppStrings.addresss.tr,
                      controller: TextEditingController(text: 'Dhaka')),
                  ///======================Add Photo================
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

                  ///========================Update Button===============
                  CustomButton(onTap: (){
                      Get.toNamed(AppRoutes.myProductsScreen);
                  },
                    title: AppStrings.update,
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }


}

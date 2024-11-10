import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class MyProductDetailsScreen extends StatelessWidget {
    MyProductDetailsScreen({super.key, required this.image, required this.title, required this.condition, required this.description, required this.productValue, required this.catName, required this.catId, required this.productId, required this.userId});

    final String image;
    final String title;
    final int productValue;
    final String condition;
    final String description;
    final String catName;
    final String catId;
    final String productId;
    final String userId;

    PostController controller=Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///============================My Product Details Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProductDetails.tr,
      ),
      body: Obx((){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///======================Image Here=============
                CustomNetworkImage(
                  imageUrl: image,
                  height: 252.h,
                  width: double.infinity,
                ),
                SizedBox(height: controller.size.value.toDouble(),),
                CustomDetailContainer(
                  color: AppColors.white200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///======================Item Name==============
                      CustomText(
                        text: title,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black500,
                        bottom: 10.h,
                      ),
                      Row(
                        children: [
                          ///=========================Price=============
                          CustomText(
                            text: '${ productValue.toString()}',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.blue500,
                            bottom: 10.h,
                          ),
                          const Spacer(),
                          CustomText(
                            text: AppStrings.postedOn.tr,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                          ///======================Posted on===========
                          CustomText(
                            text: ' : 21 Mar 2:45 PM'.tr,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ///=========================This is Condition==============
                CustomDetailContainer(
                  color: AppColors.white200,
                  child: Row(
                    children: [
                      CustomText(
                        text: AppStrings.condition.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black500,
                        bottom: 10.h,
                      ),
                      const Spacer(),
                      CustomText(
                        text: condition,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black500,
                        bottom: 10.h,
                      ),
                    ],
                  ),
                ),
                ///===================This is Description===============
                CustomDetailContainer(
                  color: AppColors.white200,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppStrings.description.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                          bottom: 10.h,
                        ),
                        CustomText(
                          textAlign: TextAlign.start,
                          maxLines: 30,
                          text:description,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                          bottom: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ///==========================Edit Button=============
            Expanded(
              child: GestureDetector(
                onTap: (){
                  controller.productTitleController.text= title;
                  controller.conditionController.text= condition;
                  controller.descriptionController.text= description;
                  //controller.addressController.text= addres;
                  controller.productValueController.text= productValue.toString();
                  context.pushNamed(RoutePath.postEditScreen,
                    queryParameters: {
                      "cateName": catName,
                      "cateId": catId,
                      "productId": productId,
                      "userId": userId,
                    },
                  );
                },
                child: CustomDetailContainer(

                    color: AppColors.blue500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomImage(
                          imageSrc: AppIcons.borderColor,
                          imageColor: AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: AppStrings.edit.tr,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.white,
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
             SizedBox(height: controller.size.value.toDouble(),),
             ///=======================Delete Button===============
            controller.addProductLoading.value? const CustomLoader(): Expanded(
              child: GestureDetector(
                onTap: (){
                  controller.deleteProduct(context: context,productId: productId);
                },
                child: CustomDetailContainer(
                    color: AppColors.blue500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomImage(
                          imageSrc: AppIcons.delete,
                          imageColor: AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: AppStrings.delete.tr,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.white,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

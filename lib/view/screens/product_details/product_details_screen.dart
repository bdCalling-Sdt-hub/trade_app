import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================My Product Details Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProductDetails.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.selectedProduct.tr,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.black500,
                bottom: 10.h,
              ),
              ///======================Image Here=============
              CustomNetworkImage(
                imageUrl: AppConstants.electronics,
                height: 252.h,
                width: double.infinity,
              ),
              CustomDetailContainer(
                color: AppColors.white200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///======================Item Name==============
                    CustomText(
                      text: 'Samsung Galaxy S22 Ultra 5G'.tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black500,
                      bottom: 10.h,
                    ),
                    Row(
                      children: [
                        ///=========================Price=============
                        CustomText(
                          text: '\$820+'.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.h,
                          color: AppColors.blue500,
                          bottom: 10.h,
                        ),
                        const Spacer(),
                        CustomText(
                          text: AppStrings.postedOn.tr,
                          fontWeight: FontWeight.w500,
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

                    ///<======================= post by name =======================>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(text: AppStrings.postBy,right: 4.w,),
                            CustomText(text: "${'Nadim hasan'} ${'(Gold)'}",fontWeight: FontWeight.w500,decoration: TextDecoration.underline,color: AppColors.blue500,),
                          ],
                        ),
                       const Row(
                          children: [
                            CustomImage(imageSrc: AppIcons.locationOn,imageColor: AppColors.black500,),
                            CustomText(text: "Napervilla")
                          ],
                        )
                      ],
                    )
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
                      text: 'Used',
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
                      text:
                      'Galaxy S22 Ultra, a powerhouse of performance and aesthetics. Its sleek design features a smooth curved display, crafted from premium armor aluminum. With the option of dual SIM, the S22 Ultra marries style and functionality seamlessly. The integrated stylus ensures precise input, while the vibrant 6.8" Dynamic AMOLED 2X display offers stunning visuals with HDR10+ support.'
                          .tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black500,
                      bottom: 10.h,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h,),

              CustomText(text: AppStrings.iWantToSwapFor,fontWeight: FontWeight.w500,fontSize: 18.h,bottom: 16.h,),

              CustomTextField(
                readOnly: true,
                fillColor: AppColors.white200,
                suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
              ),
              SizedBox(height: 16.h,),
              ///=================== sendSwapRequest button ===============
              CustomButton(onTap: (){},title: AppStrings.sendSwapRequest,),

              CustomText(text: "By swapping you can earn upto 500 points".tr,top: 8.h,bottom: 16.h,),

              ///============================ similarProducts =============================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.similarProducts.tr,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.categoryScreen);
                    },
                    child: CustomText(
                      text: AppStrings.viewAll,
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: CustomMyProduct(
                        isMargin: false,
                        isEdit: false,
                        image: AppConstants.electronics,
                        name: 'Samsung Galaxy s22'.tr,
                        onTap: () {
                          Get.toNamed(AppRoutes.productDetailsScreen);
                        },
                        value: '\$825+',
                        editOnTap: () {},
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24.h,),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ///==========================Edit Button=============
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.postEditScreen);
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
            ///=======================Delete Button===============
            Expanded(
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
          ],
        ),
      ),*/
    );
  }
}

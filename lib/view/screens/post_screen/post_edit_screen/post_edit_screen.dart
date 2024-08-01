import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PostEditScreen extends StatelessWidget {
  const PostEditScreen({super.key});

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


              ///========================Update Button===============
              CustomButton(onTap: (){
                  Get.toNamed(AppRoutes.myProductsScreen);
              },
                title: AppStrings.update,
              )
            ],
          ),
        ),
      ),
    );
  }


}

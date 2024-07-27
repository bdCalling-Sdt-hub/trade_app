import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PostAddScreen extends StatelessWidget {
  const PostAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 3),

      ///======================Post  add appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.postAnAd.tr,
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
                isBackgroundColor:  true,
                  readOnly: true,
                  title: AppStrings.productCategory.tr,
                  controller: TextEditingController(text: 'Phone')),

              ///========================Product Title===========
              CustomFromCard(
                  title: AppStrings.productTitle.tr,
                  controller: TextEditingController()),

              ///========================Condition===========
              CustomFromCard(
                  title: AppStrings.condition.tr,
                  controller: TextEditingController()),

              ///========================Description===========
              CustomFromCard(
                isMaxLine: true,
                  title: AppStrings.description.tr,
                  controller: TextEditingController()),

              ///========================Product Value===========
              CustomFromCard(
                  title: AppStrings.productValue.tr,
                  controller: TextEditingController()),

              ///========================Address===========
              CustomFromCard(
                  title: AppStrings.addresss.tr,
                  controller: TextEditingController()),
              ///======================Add Photo================


              ///========================Button===============
              CustomButton(onTap: (){

              },
              title: AppStrings.postAd,
              )
            ],
          ),
        ),
      ),
    );
  }


}

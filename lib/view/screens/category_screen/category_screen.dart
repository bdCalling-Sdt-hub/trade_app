import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      appBar:  CustomAppBar(
        appBarContent: AppStrings.categories.tr,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10, // You can adjust the item count
        itemBuilder: (BuildContext context, int index) {
          return customCategories(
            onTap: () {
              // Get.toNamed(AppRoutes.homeScreen);
            },
            image: AppConstants.electronics,
            name: 'Electronics'.tr,
          );
        },
      ),
    );
  }

  Widget customCategories({
    required String image,
    required String name,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          child: Column(
            children: [
              CustomNetworkImage(
                borderRadius: BorderRadius.circular(8),
                imageUrl: image,
                height: 124.h,
                width: 166.w,
              ),
              CustomText(
                top: 6,
                color: AppColors.black500,
                text: name,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      );
}

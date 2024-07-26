import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProducts.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75, // Adjust the aspect ratio as needed
          ),
          itemCount: 5,
          physics: const PageScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomMyProduct(
              isEdit: true,
              image: AppConstants.electronics,
              name: 'Samsung Galaxy s22'.tr,
              onTap: () {},
              value: '\$825+', editOnTap: () {  },
            );
          },
        ),
      ),
    );
  }
}

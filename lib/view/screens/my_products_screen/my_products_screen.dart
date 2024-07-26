import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///============================My Product Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProducts.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.availableProducts.tr,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.black500,
              bottom: 10,
            ),
            Expanded(
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
                    onTap: () {
                      Get.toNamed(AppRoutes.myProductDetailsScreen);

                    },
                    value: '\$825+', editOnTap: () {
                      print('edit======');
                  },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

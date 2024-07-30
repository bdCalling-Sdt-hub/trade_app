import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';

class TopProductsScreen extends StatelessWidget {
  const TopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================  topProducts ===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.topProducts.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 240
            // Adjust the aspect ratio as needed
          ),
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomMyProduct(
              isMargin: false,
              isEdit: false,
              image: AppConstants.electronics,
              name: 'Samsung Galaxy s22'.tr,
              onTap: () {
                Get.toNamed(AppRoutes.productDetailsScreen);
              },
              value: '\$825+',
              editOnTap: () {},
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class SubCategoryProducts extends StatelessWidget {
  const SubCategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: data['name'],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: data['name'],
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.black500,
              bottom: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 200.h),
                itemCount: 5,
                physics: const PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomMyProduct(
                    isMargin: false,
                    isEdit: false,
                    image: AppConstants.electronics,
                    name: data['name'],
                    onTap: () {
                      Get.toNamed(AppRoutes.productDetailsScreen);
                    },
                    value: '\$825+',
                    editOnTap: () {
                      // Get.toNamed(AppRoutes.postEditScreen);
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

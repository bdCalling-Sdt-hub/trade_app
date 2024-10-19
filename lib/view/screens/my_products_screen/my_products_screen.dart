import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class MyProductsScreen extends StatelessWidget {
  MyProductsScreen({super.key});
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///============================My Product Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProducts.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///========================Available Products============
            CustomText(
              text: AppStrings.availableProducts.tr,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.black500,
              bottom: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 250.h),
                itemCount: 5,
                physics: const PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomMyProduct(
                    isMargin: false,
                    isEdit: true,
                    image: AppConstants.electronics,
                    name: 'Samsung Galaxy s22'.tr,
                    onTap: () {
                      context.pushNamed(RoutePath.myProductDetailsScreen);
                    },
                    value: '\$825+',
                    editOnTap: () {
                       context.pushNamed(RoutePath.postEditScreen);
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

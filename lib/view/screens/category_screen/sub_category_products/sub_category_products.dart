import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class SubCategoryProducts extends StatelessWidget {
  const SubCategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: data['name'],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: data['name'],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.black500,
                ),
                 const Spacer(),
                 CustomDetailContainer(
                    color: AppColors.white200,
                    child: Row(
                      children: [
                        const CustomImage(
                            imageSrc: AppIcons.filterList),
                        CustomText(
                          text: AppStrings.filter.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                        ),
                      ],
                    ))
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 240
                ),
                itemCount: 5,
                physics: const PageScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomMyProduct(
                    isMargin: false,
                    isEdit: false,
                    image: AppConstants.electronics,
                    name: data['name'],
                    onTap: () {
                      // Get.toNamed(AppRoutes.myProductDetailsScreen);
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
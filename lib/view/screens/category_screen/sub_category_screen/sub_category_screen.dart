import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({super.key});

  final CategoryController categoryController = Get.find<CategoryController>();

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
          children: [
            Column(
              children: List.generate(
                  categoryController.subCategoriesList.length, (index) {
                var data = categoryController.subCategoriesList[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.subCategoryProducts, arguments: data);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: data['name'],
                            color: AppColors.black500,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          const Spacer(),
                          const CustomImage(imageSrc: AppIcons.chevronForward),
                        ],
                      ),
                      Divider(
                        color: AppColors.black50,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

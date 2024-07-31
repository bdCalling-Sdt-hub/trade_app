import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_categories/custom_categories.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),

      ///===================Categories appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.categories.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categoryController.cateGoriList.length??0, // You can adjust the item count
          itemBuilder: (BuildContext context, int index) {
            var data = categoryController.cateGoriList[index];

            return CustomCategories(
              onTap: () {
                Get.toNamed(AppRoutes.subCategoryScreen,
                    arguments: data);
              },
              image: data['image'],
              name: data['name'],
            );
          },
        ),
      ),
    );
  }
}

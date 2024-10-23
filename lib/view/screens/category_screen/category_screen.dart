import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_categories/custom_categories.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final CategoryController categoryController = Get.find<CategoryController>();
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 2),

      ///===================Categories appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.categories.tr,
      ),
      body: Obx(() {
        switch (controller.popularCategory.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getPopularCategory(
                  context: context,
                );
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getPopularCategory(context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var popularCategoryList = controller.popularCategoryList.value;
            return GridView.builder(
              padding:
              EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              scrollDirection: Axis.vertical,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 160,
              ),
              itemCount: popularCategoryList.length,
              physics: const BouncingScrollPhysics(), // Allow scrolling
              itemBuilder: (BuildContext context, int index) {
                return CustomCategories(
                  onTap: () {
                    print(controller
                        .popularCategoryList.value[index].name ??
                        "");

                    context.pushNamed(RoutePath.subCategoryScreen,extra: controller.popularCategoryList.value[index].name ?? '');

                  },
                  image:
                  '${ApiUrl.baseUrl}${controller.popularCategoryList.value[index].image ?? ''}',
                  name:
                  controller.popularCategoryList.value[index].name ??
                      "",
                );
              },
            );
        }
      }),
    );
  }
}


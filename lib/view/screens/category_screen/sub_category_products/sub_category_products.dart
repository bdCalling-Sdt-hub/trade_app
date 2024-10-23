import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class SubCategoryProducts extends StatefulWidget {
    SubCategoryProducts({super.key, required this.catId, required this.subCatId});

    final String catId;
    final String subCatId;

  @override
  State<SubCategoryProducts> createState() => _SubCategoryProductsState();
}

class _SubCategoryProductsState extends State<SubCategoryProducts> {

  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSubCategoryProduct(context: context,catId: widget.catId,subCatID: widget.subCatId);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: 'nnn',
      ),
      body:Obx(() {
        switch (controller.subCategoryProduct.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getSubCategoryProduct(context: context,catId: widget.catId,subCatID: widget.subCatId);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getSubCategoryProduct(context: context,catId: widget.catId,subCatID: widget.subCatId);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var subCategoryProductList = controller.subCategoryProductList.value;
            return
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomText(
                  //   text: '',
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 16,
                  //   color: AppColors.black500,
                  //   bottom: 10,
                  // ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 220.h),
                      itemCount: subCategoryProductList.length,
                      physics: const PageScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomMyProduct(
                          isMargin: false,
                          isEdit: false,
                          image: '${ApiUrl.baseUrl}${subCategoryProductList[index].images?[0] ?? ""}',
                          name: subCategoryProductList[index].title ?? '',
                          onTap: () {

                            context.pushNamed(RoutePath.productDetailsScreen);
                          },
                          value: '\$${subCategoryProductList[index].productValue ?? ""}',
                          editOnTap: () {
                            // Get.toNamed(AppRoutes.postEditScreen);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
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

class MyProductsScreen extends StatelessWidget {
  MyProductsScreen({super.key});
  PostController controller=Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///============================My Product Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProducts.tr,
      ),
      body: Obx(() {
        switch (controller.myProductLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getMyProduct(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getMyProduct(context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var myProductList = controller.myProductList.value;
            return Padding(
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
                      itemCount: myProductList.length,
                      physics: const PageScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomMyProduct(
                          isMargin: false,
                          isEdit: true,
                          image: '${ApiUrl.baseUrl}${myProductList[index].images?[0] ?? ""}',
                          name: myProductList[index].title ?? "",
                          onTap: () {
                            context.pushNamed(RoutePath.myProductDetailsScreen,
                            queryParameters: {
                              "image" : '${ApiUrl.baseUrl}${myProductList[index].images?[0] ?? ""}',
                              "title" : myProductList[index].title ?? "",
                              "condition" : myProductList[index].condition ?? "",
                              "description" : myProductList[index].description ?? "",
                              "productValue" :  (myProductList[index].productValue ?? 0).toString(),
                              "cateName": myProductList[index].category?.name ?? '',
                              "cateId":myProductList[index].category?.id  ?? '',
                              "productId":myProductList[index].id  ?? '',
                              "userId":myProductList[index].user  ?? '',
                            }
                            );
                          },
                          value: '\$${myProductList[index].productValue ?? 0}',
                          editOnTap: () {
                            controller.productTitleController.text=myProductList[index].title ?? '';
                            controller.conditionController.text=myProductList[index].condition ?? '';
                            controller.descriptionController.text=myProductList[index].description ?? '';
                             controller.addressController.text= myProductList[index].address ?? '';
                             controller.productValueController.text= (myProductList[index].productValue ?? 0).toString();
                            context.pushNamed(RoutePath.postEditScreen,
                              queryParameters: {
                                "cateName": myProductList[index].category?.name ?? '',
                                "cateId":myProductList[index].category?.id  ?? '',
                                "productId":myProductList[index].id  ?? '',
                                "userId":myProductList[index].user  ?? '',
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
        }
      })
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/search_controller/search_controller.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_filter/custom_filter.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/search_screen/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  SearchesController controller = Get.find<SearchesController>();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: 'Search'.tr,
      ),
      body: Obx(() {
        switch (controller.searchLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getSearch(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getSearch(context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
          //  var swapHistoryList = controller.swapHistoryList.value;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  ///===================Search Field=============
                  CustomTextField(
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        controller.getSearch(
                            search: value ,location: value);
                      }
                    },
                    hintText: AppStrings.whatAreYouLookingFor,
                    suffixIcon: IconButton(
                        onPressed: () {
                           controller.getSearch();
                        },
                        icon: const Icon(Icons.close)),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Get.dialog(
                  //         CustomFilter(
                  //           locationController: _locationController,
                  //         ),
                  //       );
                  //     },
                  //
                  //     ///===================Filter Icon===========
                  //     child: CustomDetailContainer(
                  //       height: 50.h,
                  //       weight: 70.w,
                  //       color: AppColors.white200,
                  //       child: const CustomImage(imageSrc: AppIcons.filterList),
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                      child:  controller.searchList.isEmpty ?  Center(
                        child: CustomText(
                          text: 'No Data Found',
                          fontWeight: FontWeight.w500,
                          top: 8.h,
                          bottom: 8.h,
                        ),
                      ): GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 16.h,),
                        scrollDirection: Axis.vertical,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 230,
                        ),
                        itemCount: controller.searchList.length,
                        physics: const BouncingScrollPhysics(), // Allow scrolling
                        itemBuilder: (BuildContext context, int index) {
                          return CustomMyProduct(
                            isMargin: false,
                            isEdit: controller.isEdit,
                            image: '${ApiUrl.baseUrl}${controller.searchList.value[index].images?[0]}',
                            name: controller.searchList.value[index].title ?? "", //,
                            onTap: () {
                              context.pushNamed(
                                RoutePath.productDetailsScreen,
                                queryParameters: {
                                  "productId":
                                  controller.searchList[index].id ??
                                      '',
                                },
                              );
                            },
                            value: '\$${controller.searchList.value[index].productValue ?? ""}', //,
                            editOnTap: () {},
                          );
                        },
                      ))
                ],
              ),
            );
        }
      }),
    );
  }
}

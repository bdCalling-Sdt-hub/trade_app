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
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key, required this.productId});
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PostController controller = Get.find<PostController>();

  final List<String> swapList = ["Samsung Galaxy s22", "Redmi Note 11"];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getProductDetails(
          productId: widget.productId, context: context);
    });
    super.initState();
  }

  var myProductId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================My Product Details Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.productDetails.tr,
      ),
      body: Obx(() {
        switch (controller.productDetailsLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getProductDetails(
                    productId: widget.productId, context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getProductDetails(
                    productId: widget.productId, context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var productDetailsModel = controller.productDetailsModel.value;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.selectedProduct.tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black500,
                      bottom: 10.h,
                    ),

                    ///======================Image Here=============
                    CustomNetworkImage(
                      imageUrl:
                          '${ApiUrl.baseUrl}/${productDetailsModel.data?.product?.images?[0] ?? ""}',
                      height: 220.h,
                      width: double.infinity,
                    ),
                    CustomDetailContainer(
                      color: AppColors.white200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///======================Item Name==============
                          CustomText(
                            text:
                                productDetailsModel.data?.product?.title ?? "",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                          Row(
                            children: [
                              ///=========================Price=============
                              CustomText(
                                text:
                                    '\$${productDetailsModel.data?.product?.productValue ?? 0}'
                                        .tr,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.h,
                                color: AppColors.blue500,
                                bottom: 10.h,
                              ),
                              const Spacer(),
                              CustomText(
                                text: AppStrings.postedOn.tr,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.black500,
                                bottom: 10.h,
                              ),

                              ///======================Posted on===========
                              CustomText(
                                text: ' : 21 Mar 2:45 PM'.tr,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.black500,
                                bottom: 10.h,
                              ),
                            ],
                          ),

                          ///<======================= post by name =======================>
                          Row(
                             
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: AppStrings.postBy,
                                      right: 4.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.pushNamed(RoutePath.otherProfile,extra: productDetailsModel.data?.product?.user?.id ?? 0);
                                      },
                                      child: CustomText(
                                        text:
                                            "${productDetailsModel.data?.product?.user?.name ?? ""}-${productDetailsModel.data?.product?.user?.userType ?? ""}",
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                        color: AppColors.blue500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomImage(
                                      imageSrc: AppIcons.locationOn,
                                      imageColor: AppColors.black500,
                                    ),
                                    Flexible(
                                      child: CustomText(
                                        maxLines: 2,
                                          textAlign: TextAlign.start,
                                          text: productDetailsModel
                                                  .data?.product?.address ??
                                              ""),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    ///=========================This is Condition==============
                    CustomDetailContainer(
                      color: AppColors.white200,
                      child: Row(
                        children: [
                          CustomText(
                            text: AppStrings.condition.tr,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                          const Spacer(),
                          CustomText(
                            text:
                                productDetailsModel.data?.product?.condition ??
                                    "",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                        ],
                      ),
                    ),

                    ///===================This is Description===============
                    CustomDetailContainer(
                      weight: double.infinity,
                      color: AppColors.white200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppStrings.description.tr,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                          CustomText(
                            textAlign: TextAlign.start,
                            maxLines: 30,
                            text: productDetailsModel
                                    .data?.product?.description ??
                                "",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16.h,
                    ),

                    CustomText(
                      text: AppStrings.iWantToSwapFor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.h,
                      bottom: 16.h,
                    ),

                    CustomTextField(
                      onTap: () {
                        controller.isSwap.value = !controller.isSwap.value;
                        controller.isSwap.refresh();
                      },
                      textEditingController: controller.swapController,
                      readOnly: true,
                      fillColor: AppColors.white200,
                      suffixIcon: controller.isSwap.value
                          ? const Icon(Icons.keyboard_arrow_up)
                          : const Icon(Icons.keyboard_arrow_down_sharp),
                    ),

                    ///<========================= dropdown ============================>
                    controller.isSwap.value
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    controller.myProductList.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        // themeController.selectedCategory.value = index;
                                        controller.swapController.text =
                                            controller.myProductList[index]
                                                    .title ??
                                                "";
                                        myProductId = controller
                                                .myProductList[index].id ??
                                            "";
                                        controller.isSwap.value = false;
                                        controller.update();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: CustomText(
                                            text: controller
                                                    .myProductList[index]
                                                    .title ??
                                                "",
                                            fontWeight: FontWeight.w500,
                                            bottom: 4.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        : const SizedBox(),

                    SizedBox(
                      height: 16.h,
                    ),

                    ///=================== sendSwapRequest button ===============
                    controller.addProductLoading.value
                        ? const CustomLoader()
                        : CustomButton(
                            onTap: () {
                              controller.swapProduct(
                                  productUserID: productDetailsModel.data?.product?.user?.id ?? "",
                                  productProductID: productDetailsModel.data?.product?.id ?? "",
                                  myUserID: controller.myProductList[0].user ?? "",
                                  myProductId: myProductId,
                                  context: context);
                              print(myProductId);
                            },
                            title: AppStrings.sendSwapRequest,
                          ),

                    CustomText(
                      text:
                          "By swapping you can earn upto ${productDetailsModel.data?.point ?? ""} points"
                              .tr,
                      top: 8.h,
                      bottom: 16.h,
                    ),

                    ///============================ similarProducts =============================>
                    Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: AppStrings.similarProducts.tr,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     context.pushNamed(RoutePath.categoryScreen);
                        //   },
                        //   child: CustomText(
                        //     text: AppStrings.viewAll,
                        //     fontSize: 18.h,
                        //     fontWeight: FontWeight.w500,
                        //     color: AppColors.blue500,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            productDetailsModel.data!.similarProduct!.length,
                            (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: CustomMyProduct(
                              isMargin: false,
                              isEdit: false,
                              image:
                                  '${ApiUrl.baseUrl}/${productDetailsModel.data?.similarProduct?[index].images?[0] ?? ""}',
                              name: productDetailsModel
                                      .data?.similarProduct?[index].title ??
                                  "",
                              onTap: () {
                                context.pushNamed(RoutePath.productDetailsScreen,
                                    queryParameters: {
                                    "productId": productDetailsModel.data?.similarProduct?[index].id ?? '',
                                    });
                              },
                              value:
                                  '\$${productDetailsModel.data?.similarProduct?[index].productValue ?? ""}',
                              editOnTap: () {},
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}

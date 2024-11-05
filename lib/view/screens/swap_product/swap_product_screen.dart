import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
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
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class SwapProductScreen extends StatefulWidget {
   SwapProductScreen({super.key, required this.swapId});
   final String swapId;

  @override
  State<SwapProductScreen> createState() => _SwapProductScreenState();
}

class _SwapProductScreenState extends State<SwapProductScreen> {

  final SwapRequestController controller = Get.find<SwapRequestController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSwapProductDetails(context: context,swapId: widget.swapId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================My Product Details Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.swapProduct.tr,
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getSwapProductDetails(context: context,swapId: widget.swapId);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getSwapProductDetails(context: context,swapId: widget.swapId);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var swapProductDetailsModel = controller.swapProductDetailsModel.value;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    imageUrl: '${ApiUrl.baseUrl}/${swapProductDetailsModel.data?.productTo?.images?[0] ?? ""}',
                    height: 210.h,
                    width: double.infinity,
                  ),
                  CustomDetailContainer(
                    color: AppColors.white200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///======================Item Name==============
                        CustomText(
                          text: swapProductDetailsModel.data?.productTo?.title ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                          bottom: 10.h,
                        ),
                        Row(
                          children: [
                            ///=========================Price=============
                            CustomText(
                              text: '\$${swapProductDetailsModel.data?.productTo?.productValue ?? ""}'.tr,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.h,
                              color: AppColors.blue500,
                              bottom: 10.h,
                            ),
                            const Spacer(),
                            CustomText(
                              text: '${AppStrings.postedOn.tr}: ',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.black500,
                              bottom: 10.h,
                            ),
                            ///======================Posted on===========
                            CustomText(
                              text:  swapProductDetailsModel.data?.userTo?.createdAt.toString() ?? "",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.black500,
                              bottom: 10.h,
                            ),
                          ],
                        ),

                        ///<======================= post by name =======================>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomText(text: AppStrings.postBy,right: 4.w,),
                                GestureDetector(
                                    onTap: (){
                                      context.pushNamed(RoutePath.otherProfile);
                                    },
                                    child:   CustomText(text: "${swapProductDetailsModel.data?.userTo?.name ?? "" } ${'(Gold)'}",fontWeight: FontWeight.w500,decoration: TextDecoration.underline,color: AppColors.blue500,)),
                              ],
                            ),
                              Row(
                              children: [
                                CustomImage(imageSrc: AppIcons.locationOn,imageColor: AppColors.black500,),
                                CustomText(text: swapProductDetailsModel.data?.userTo?.address ?? "")
                              ],
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
                          text: swapProductDetailsModel.data?.productTo?.condition ?? "",
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
                    color: AppColors.white200,
                    child: Container(
                      width: double.infinity,
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
                            text: swapProductDetailsModel.data?.productTo?.description ?? "",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h,),

                  ///<=============================== swap product =========================>
                  CustomText(
                    text: AppStrings.swapProduct.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black500,
                    bottom: 10.h,
                  ),
                  ///======================Image Here=============
                  CustomNetworkImage(
                    imageUrl: '${ApiUrl.baseUrl}/${swapProductDetailsModel.data?.productFrom?.images?[0] ?? ""}',
                    height: 210.h,
                    width: double.infinity,
                  ),
                  CustomDetailContainer(
                    color: AppColors.white200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///======================Item Name==============
                        CustomText(
                          text: swapProductDetailsModel.data?.productFrom?.title ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                          bottom: 10.h,
                        ),
                        Row(
                          children: [
                            ///=========================Price=============
                            CustomText(
                              text: '\$${swapProductDetailsModel.data?.productFrom?.productValue ?? ""}',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.blue500,
                              bottom: 10.h,
                            ),
                            const Spacer(),
                            CustomText(
                              text: AppStrings.postedOn.tr,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.black500,
                              bottom: 10.h,
                            ),
                            ///======================Posted on===========
                            CustomText(
                              text: ' : ${swapProductDetailsModel.data?.userFrom?.createdAt ?? ""}',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.black500,
                              bottom: 10.h,
                            ),
                          ],
                        ),
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
                          text: swapProductDetailsModel.data?.productFrom?.condition ?? "",
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
                    color: AppColors.white200,
                    child: Container(
                      width: double.infinity,
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
                            text: swapProductDetailsModel.data?.productFrom?.description ?? "",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black500,
                            bottom: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      }),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ///==========================Edit Button=============
            Expanded(
              child: GestureDetector(
                onTap: (){
                  controller.launchPhone('01731090564');
                },
                child: CustomDetailContainer(

                    color: AppColors.blue500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomImage(
                          imageSrc: AppIcons.call,
                          imageColor: AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: AppStrings.call.tr,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.white,
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            ///======================= chat button===============
            Expanded(
              child: GestureDetector(
                onTap: (){
                   context.pushNamed(RoutePath.messageScreen);
                },
                child: CustomDetailContainer(
                    color: AppColors.blue500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomImage(
                          imageSrc: AppIcons.forum,
                          imageColor: AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: AppStrings.chat.tr,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.white,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

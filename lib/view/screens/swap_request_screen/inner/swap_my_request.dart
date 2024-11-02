import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class SwapMyRequest extends StatelessWidget {
  SwapMyRequest({super.key});
  SwapRequestController controller = Get.find<SwapRequestController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.swapMyReqLoading.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(
            onTap: () {
              controller.getSwapMyRequest(context: context);
            },
          );
        case Status.error:
          return GeneralErrorScreen(
            onTap: () {
              controller.getSwapMyRequest(context: context);
            },
          );
        case Status.noDataFound:
          return Center(
            child: CustomText(text: AppStrings.noDataFound),
          );
        case Status.completed:
          var swapMyReqList = controller.swapMyReqList.value;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white200,
                    border: Border.all(color: AppColors.gray300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomNetworkImage(
                              boxShape: BoxShape.circle,
                              imageUrl: '',
                              height: 36.h,
                              width: 36.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    context.pushNamed(RoutePath.otherProfile);
                                  },
                                  child: CustomText(
                                    left: 8,
                                    text: 'name',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blue500,
                                  ),
                                ),
                                CustomText(
                                  left: 10,
                                  text: 'date',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black400,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){},
                            child:  CustomText(
                              decoration: TextDecoration.underline,
                              text: AppStrings.viewDetails.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue500,
                            ),
                          )
                        ],
                      ),
                      CustomText(
                        top: 10,
                        left: 7,
                        text: AppStrings.swapItems.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.black500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 't product',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black500,
                          ),
                          const CustomImage(
                            imageSrc: AppIcons.swapHoriz,
                            imageColor: AppColors.blue500,
                          ),
                          CustomText(
                            text: 'm product',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomButton(
                        onTap: (){},
                        title: 'Cancel',
                        fillColor: AppColors.white,
                        textColor: AppColors.red500,
                        isBorder: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
      }
    });
  }
}

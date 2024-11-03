import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_swap_requests/custom_swap_requests.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class SwapAnotherRequest extends StatelessWidget {
  SwapAnotherRequest({super.key});
  SwapRequestController controller = Get.find<SwapRequestController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.swapTheirReqLoading.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(
            onTap: () {
              controller.getSwapTheirRequest(context: context);
            },
          );
        case Status.error:
          return GeneralErrorScreen(
            onTap: () {
              controller.getSwapTheirRequest(context: context);
            },
          );
        case Status.noDataFound:
          return Center(
            child: CustomText(text: AppStrings.noDataFound),
          );
        case Status.completed:
          var swapTheirReqList = controller.swapTheirReqList.value;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    children: List.generate(swapTheirReqList.length, (index) {
                      return CustomSwapRequests(
                        onTapName: () {
                          context.pushNamed(RoutePath.otherProfile);
                        },
                        image: AppConstants.userNtr,
                        name: 'Zahid Hossain'.tr,
                        date: '12/06/24'.tr,
                        acceptButton: 'accept'.tr,
                        rejectButton: 'reject'.tr,
                        onTap: () {
                          context.pushNamed(RoutePath.swapProductScreen);
                        },
                        firstProductName: 'Samsung Galaxy S22'.tr,
                        exchangeProductName: 'Sony Y1G Android TV'.tr,
                        onTapAcceptButton: () {},
                        onTapRejectButton: () {},
                      );
                    }))
              ],
            ),
          );
      }
    });
  }
}

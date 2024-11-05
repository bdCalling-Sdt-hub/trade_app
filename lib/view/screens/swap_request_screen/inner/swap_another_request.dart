import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_swap_requests/custom_swap_requests.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class SwapAnotherRequest extends StatefulWidget {
  SwapAnotherRequest({super.key});

  @override
  State<SwapAnotherRequest> createState() => _SwapAnotherRequestState();
}

class _SwapAnotherRequestState extends State<SwapAnotherRequest> {
  SwapRequestController controller = Get.find<SwapRequestController>();

  @override
  void initState() {
    controller.getSwapTheirRequest(context: context);
    super.initState();
  }
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
          return swapTheirReqList.isEmpty? Center(child: CustomText(text: 'No Data Found')) : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    children: List.generate(swapTheirReqList.length, (index) {
                      return CustomSwapRequests(
                        onTapName: () {
                          context.pushNamed(RoutePath.otherProfile);
                        },
                        image: '${ApiUrl.baseUrl}${swapTheirReqList[index].userFrom?.profileImage ?? ""}',
                        name: swapTheirReqList[index].userFrom?.name ?? "",
                        date: swapTheirReqList[index].userFrom?.createdAt.toString() ?? "",
                        acceptButton: 'accept'.tr,
                        rejectButton: 'reject'.tr,
                        onTap: () {
                          context.pushNamed(RoutePath.swapProductScreen,extra: swapTheirReqList[index].id);
                        },
                        firstProductName: swapTheirReqList[index].productFrom?.title ?? '',
                        exchangeProductName: swapTheirReqList[index].productTo?.title ?? '',
                        onTapAcceptButton: () {
                          controller.swapAccept(context: context,swapId: swapTheirReqList[index].id ?? "");
                        },
                        onTapRejectButton: () {
                          controller.swapRemove(context: context,swapId: swapTheirReqList[index].id ?? "");
                        },
                      );
                    }))
              ],
            ),
          );
      }
    });
  }
}

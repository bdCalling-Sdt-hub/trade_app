import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/controller/profile_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_review_dialoge/custom_review_dialoge.dart';
import 'package:trade_app/view/components/custom_swap_history/custom_swap_history.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class SwapHistoryScreen extends StatelessWidget {
  SwapHistoryScreen({super.key});

  ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================swapHistory Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.swapHistory.tr,
      ),
      body: RefreshIndicator(onRefresh: ()async{
       await controller.getSwapHistory(context: context);
      },
      child: Obx(() {
        switch (controller.myProductLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getSwapHistory(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getSwapHistory(context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var swapHistoryList = controller.swapHistoryList.value;
            return swapHistoryList.isEmpty ?
            Center(
              child: CustomText(
                text: 'No Data Found',
                fontWeight: FontWeight.w500,
                top: 8.h,
                bottom: 8.h,
              ),
            ): Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        children:
                        List.generate(swapHistoryList.length, (index) {
                          return CustomSwapHistory(
                            onTapName: () {
                              context.pushNamed(RoutePath.otherProfile);
                            },
                            image: '${ApiUrl.baseUrl}${swapHistoryList[index].productFrom?.user?.profileImage ?? ""}',
                            name:
                            swapHistoryList[index].productFrom?.user?.name ?? "",
                            date:DateFormat('yMMMd').format(swapHistoryList[index].createdAt!.toLocal()),
                            onTap: () {
                              showDialog(context: context, builder: (context){
                                return  CustomReviewDialog(swapId: swapHistoryList[index].id?? "",);
                              });
                            },
                            firstProductName: swapHistoryList[index].productFrom?.title ?? "",
                            exchangeProductName:
                            swapHistoryList[index].productTo?.title ?? "",
                          );
                        }))
                  ],
                ),
              ),
            );
        }
      }),
      ),
    );
  }

  ///========================This is Accept Button Dialog box==============
  void showDialogBox(BuildContext context) {

  }
}

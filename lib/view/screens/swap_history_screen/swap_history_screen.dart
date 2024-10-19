import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_review_dialoge/custom_review_dialoge.dart';
import 'package:trade_app/view/components/custom_swap_history/custom_swap_history.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class SwapHistoryScreen extends StatelessWidget {
  const SwapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================swapHistory Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.swapHistory.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  children: List.generate(4, (index) {
                return CustomSwapHistory(
                  onTapName: () {
                     context.pushNamed(RoutePath.otherProfile);
                  },
                  image: AppConstants.userNtr,
                  name: 'Zahid '.tr,
                  date: '12/06/24'.tr,
                  onTap: () {
                    showDialogBox(context);
                  },
                  firstProductName: 'Samsung Galaxy S22'.tr,
                  exchangeProductName: 'Sony Y1G Android TV'.tr,
                );
              }))
            ],
          ),
        ),
      ),
    );
  }

  ///========================This is Accept Button Dialog box==============
  void showDialogBox(BuildContext context) {
    Get.dialog(CustomReviewDialog(
      commentController: TextEditingController(),
      onSubmit: () {
        Get.back();
      },
      initialRating: 0, // Pass the initial rating value here
    ));
  }
}

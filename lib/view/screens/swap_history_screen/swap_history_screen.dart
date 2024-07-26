import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_swap_history/custom_swap_history.dart';
import 'package:trade_app/view/components/custom_swap_requests/custom_swap_requests.dart';

class SwapHistoryScreen extends StatelessWidget {
  const SwapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================Terms ANd Condition Appbar===============
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
                  children:List.generate(4, (index){
                    return     CustomSwapHistory(
                      image: AppConstants.userNtr,
                      name: 'Zahid '.tr,
                      date: '12/06/24'.tr,
                      onTap: () {
                        print('this is -============');
                      },
                      firstProductName: 'Samsung Galaxy S22'.tr,
                      exchangeProductName: 'Sony Y1G Android TV'.tr,
                    );
                  })
              )
            ],
          ),
        ),
      ),
    );
  }
}

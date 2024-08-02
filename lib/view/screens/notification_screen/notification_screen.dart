import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_chat/custom_chat.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(appBarContent: AppStrings.notifications,),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                // Get.toNamed(AppRoutes.messageScreen);
              },
              child: CustomChat(
                imageUrl: AppConstants.userNtr,
                name: 'Robert Smith'.tr,
                subTitle: 'Hello, Good morning. I think'.tr,
                time: '11:26 AM'.tr,)
          );
        },
      ),

    );
  }
}

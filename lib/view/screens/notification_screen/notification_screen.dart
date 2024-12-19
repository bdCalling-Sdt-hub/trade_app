import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_chat/custom_chat.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/notification_screen/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
    NotificationScreen({super.key});

    NotificationController controller=Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(appBarContent: AppStrings.notifications,),
      body: Obx(() {
        switch (controller.notificationLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getNotification(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getNotification(context: context);
              },
            );

          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );

          case Status.completed:

            return  ListView.builder(
              itemCount: controller.notificationList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.messageScreen);
                    },
                    child: CustomChat(
                      imageUrl: AppConstants.userNtr,
                      name: controller.notificationList[index].title ?? "",
                      subTitle: controller.notificationList[index].message ?? "",
                      time: DateFormat('yMMMd').format(controller.notificationList[index].createdAt?.toLocal() ?? DateTime.now()),)
                );
              },
            );
        }
      }),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_chat/custom_chat.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///=========================Chat  Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.chat.tr,
      ),
      bottomNavigationBar: const NavBar(currentIndex: 1),
      body: Obx(() {
        switch (controller.chatLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getConversation(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getConversation(context: context);
              },
            );

          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );

          case Status.completed:
            var chatList = controller.chatList.value;
            return chatList.isEmpty ?Center(
              child: CustomText(
                text: 'No Data Found',
                fontWeight: FontWeight.w500,
                top: 8.h,
                bottom: 8.h,
              ),
            ):  ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      context.pushNamed(RoutePath.messageScreen,
                          queryParameters: {
                            "receiverID": chatList[index].participants?[0]?.id ?? '',
                            "name":chatList[index].participants?[0]?.name ?? '',
                          },
                       );
                    },
                    child: CustomChat(
                      imageUrl:
                          '${ApiUrl.baseUrl}${chatList[index].participants?[0]?.profileImage ?? ""}',
                      name: chatList[index].participants?[0]?.name ?? "",
                      subTitle: chatList[index].messages != null && chatList[index].messages!.isNotEmpty? chatList[index].messages!.last.message??"" :"",
                      time: DateFormat('yMMMd').format(
                          chatList[index].messages != null && chatList[index].messages!.isNotEmpty?chatList[index].messages?.last.createdAt?.toLocal() ?? DateTime.now():DateTime.now()),
                    ));
              },
            );
        }
      }),
    );
  }
}

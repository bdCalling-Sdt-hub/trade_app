import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';

import 'Inner/chat_bubble.dart';
import 'Inner/input_field.dart';
import 'MessgaeController/message_controller.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      appBar: CustomAppBar(
        appBarContent: 'Robert Smith'.tr,
      ),
      bottomNavigationBar: MessageInputField(),
      body: const ChatBubbleMessage(),
    );
  }
}

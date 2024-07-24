import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

import 'Inner/chat_bubble.dart';
import 'Inner/input_field.dart';
import 'Inner/message_app_bar.dart';
import 'MessgaeController/message_controller.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  // final String image = Get.arguments[0];

  // final String name = Get.arguments[1];

  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.amber,
        title: const CustomText(
          text: 'Message',
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MessageInputField(),
      body: Column(children: [


        MessageAppBar(
          img: AppConstants.userNtr,
          userName: "Tamim", phoneNumber: '01-235689-258',
        ),

        ///============================== Chat Bubble ==============================

        const Expanded(child: ChatBubbleMessage()),
      ]),
    );
  }
}

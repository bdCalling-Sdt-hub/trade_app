import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trade_app/service/socket_service.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/screens/message_screen/message_list_model.dart';
import 'package:timeago/timeago.dart'  as timeago;
import 'Inner/input_field.dart';
import 'MessgaeController/message_controller.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key, required this.receiverId});
  final String receiverId;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final MessageController controller = Get.find<MessageController>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.pagingController.addPageRequestListener((pageKey) {
      controller.getAllChat(page: pageKey, receiverId: widget.receiverId);
    });
    SocketApi.init();
    controller.listenForNewMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      appBar: CustomAppBar(
        appBarContent: 'Robert Smith'.tr,
      ),
      body: Column(
        children: [
          MessageListCard(controller: controller, scrollController: scrollController),
          MessageInputField(senderId: widget.receiverId),
        ],
      ),
    );
  }
}

class MessageListCard extends StatelessWidget {
  const MessageListCard({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  final MessageController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: PagedListView<int, MessageModel>(
          pagingController: controller.pagingController,
          scrollController: scrollController,
          reverse: true,
          builderDelegate: PagedChildBuilderDelegate<MessageModel>(
            itemBuilder: (context, message, index) {
              print("${controller.myId.value} ${ message.receiverId}${message.message}");
              return ChatBubble(
                message: message,
                isSentByMe: controller.myId.value == message.receiverId,
              );
            },
            firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
            newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
            noItemsFoundIndicatorBuilder: (_) => const Center(child: Text('No messages found')),
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final bool isSentByMe;
  const ChatBubble({super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.black : const Color(0xFF5C5C5C),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: isSentByMe ? const Radius.circular(15) : const Radius.circular(0),
            bottomRight: isSentByMe ? const Radius.circular(0) : const Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message.message??"", style: const TextStyle(color: Colors.white, fontSize: 12)),
            const SizedBox(height: 5),
            Text(timeago.format(message.createdAt??DateTime.now()), style: const TextStyle(color: Colors.white60, fontSize: 8)),
          ],
        ),
      ),
    );
  }
}


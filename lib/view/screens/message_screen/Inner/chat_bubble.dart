import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';



class ChatBubbleMessage extends StatefulWidget {
  const ChatBubbleMessage({
    super.key,
  });

  @override
  State<ChatBubbleMessage> createState() => _ChatBubbleMessageState();
}

class _ChatBubbleMessageState extends State<ChatBubbleMessage> {
  @override
  void dispose() {
    // voiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      ),
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<MessageController>(builder: (controller) {
        return ListView.builder(
            reverse: true,
            controller: controller.scrollController,
            itemCount: controller.inboxChat.length,
            itemBuilder: (context, index) {
              if (index < controller.inboxChat.length){
                return Column(
                  //=======================Align the text based on user=================
                  crossAxisAlignment:
                  controller.inboxChat[index]["sender"] == "0"
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment:
                        controller.inboxChat[index]["sender"] == "0"
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),

                          if (controller.inboxChat[index]["messageType"] ==
                              "text")
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                controller.inboxChat[index]["sender"] == "0"
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //=======================Show time if Getting Message=================

                                  if (controller.inboxChat[index]["sender"] ==
                                      "0")
                                    CustomText(
                                      right: 10.w,
                                      text: "3.20",
                                      fontSize: 10.w,
                                      fontWeight: FontWeight.w200,
                                    ),

                                  //============================Message Body==============================

                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     color: AppColors.blackColor),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.r),
                                            topRight: Radius.circular(8.r),
                                            bottomLeft:
                                            controller.inboxChat[index]
                                            ["sender"] ==
                                                //"0"
                                                "1"
                                                ? Radius.circular(8.r)
                                                : Radius.circular(0.r),
                                            bottomRight:
                                            controller.inboxChat[index]
                                            ["sender"] !=
                                               // "0"
                                                "1"
                                                ? Radius.circular(8.r)
                                                : Radius.circular(0.r),
                                          ),
                                          color: controller.inboxChat[index]
                                          ["sender"] ==
                                              //"0"
                                             "1"
                                              ? Colors.cyanAccent
                                              : Colors.green),
                                      child: CustomText(
                                        maxLines: 10,
                                        textAlign: TextAlign.left,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        text: controller.inboxChat[index]
                                        ["message"],
                                        color: controller.inboxChat[index]
                                        ["sender"] ==
                                           // "0"
                                          "1"
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),

                                  //=======================Show time if Sending Message=================

                                  if (controller.inboxChat[index]["sender"] !=
                                      "0"
                                  )
                                    CustomText(
                                      left: 10.w,
                                      text: "3.20",
                                      fontSize: 10.w,
                                      fontWeight: FontWeight.w200,
                                    ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            });
      }),
    );
  }
}
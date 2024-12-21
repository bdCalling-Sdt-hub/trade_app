import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';

class MessageInputField extends StatelessWidget {
  MessageInputField({Key? key, required this.senderId, required this.receiverId})
      : super(key: key);

  final String senderId;
  final String receiverId;
  final MessageController controller = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 80.h,
            color: AppColors.white,
            child: Row(
              children: [
                //=============================== Gallery Button ==========================
                Obx(() {
                  return controller.imageFile.value == null
                      ? IconButton(
                    onPressed: () {
                      controller.selectImage();
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      size: 36,
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(
                            File(controller.imageFile.value!.path),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),

                //============================ Text Input Field ==========================
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CustomTextField(
                      textInputAction: TextInputAction.done,
                      hintText: "Write your message",
                      textEditingController: controller.message,
                      fieldBorderColor: Colors.amber,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),

                //=============================== Send Button ==========================
                GestureDetector(
                  onTap: () {
                    if (controller.message.text.isNotEmpty || controller.imageFile.value != null) {
                      controller.sendMessageImage(
                        context: context,
                        receiverId: receiverId,
                      );
                      print('receiverId ==================== $receiverId');
                    } else {
                      toastMessage(message: "Please write something or attach an image");
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 4.w),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.send_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

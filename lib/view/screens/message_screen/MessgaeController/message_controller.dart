import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/service/socket_service.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/message_screen/chat_model.dart';
import 'package:trade_app/view/screens/message_screen/message_list_model.dart';

class MessageController extends GetxController {
  ApiClient apiClient = ApiClient();
  var messageListLoading = Status.loading.obs;
  RxBool isLoadingMove = false.obs;
  final message = TextEditingController();
  MessageListLoadingMethod(Status status) => messageListLoading.value = status;
  RxString myId = "".obs;

  final PagingController<int, MessageModel> pagingController = PagingController(firstPageKey: 1);

  ///<============================ Fetch paginated chat history ====================================>
  Future<void> getAllChat(
      {required int page, required String receiverId}) async {
    if (isLoadingMove.value) return;
    isLoadingMove.value = true;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    myId.value = sharedPreferences.getString(AppConstants.userId) ?? "";
    print("===============Init");
    try {
      final response = await apiClient.get(
          url: ApiUrl.getMessage(page: page, id: receiverId), showResult: true);

      if (response.statusCode == 200) {
        final userServiceAll = MessageListModel.fromJson(response.body);
        final newItems = userServiceAll.messages ?? [];

        if (newItems.isEmpty) {
          pagingController.appendLastPage(newItems);
        } else {
          pagingController.appendPage(newItems, page + 1);
        }
      } else {
        pagingController.error = 'Error fetching data';
      }
    } catch (e) {
      pagingController.error = 'An error occurred';
    } finally {
      isLoadingMove.value = false;
    }
  }

  ///<====================== Send a message via socket ============================>
  void sendMessage(String senderId) {
    if (SocketApi.socket.connected) {
      SocketApi.socket.emit('new-message', {
        'message': message.text,
        'receiverId': senderId,
      });
      message.clear();
    } else {
      debugPrint("Socket disconnected. Attempting to reconnect...");
      SocketApi.reconnect();
    }
  }

  ///<========================== Listen for new messages ============================>
  void listenForNewMessages() {
    SocketApi.socket.on('new-message', (data) {
      final newMessage = MessageModel.fromJson(data);
      print(data);
      final currentMessages = pagingController.itemList ?? [];
      if (!currentMessages.any((msg) => msg.id == newMessage.id)) {
        pagingController.itemList = [newMessage, ...currentMessages];
        print(pagingController.itemList?.length);
      }
    });
  }

  ///<========================== conversation list ==========================>
  var myUserId;
  var chatLoading = Status.loading.obs;
  ChatLoadingMethod(Status status) => chatLoading.value = status;
  RxList<ChatList> chatList = <ChatList>[].obs;

  getConversation({BuildContext? context}) async {
    chatLoading(Status.loading);

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    myUserId = sharedPreferences.getString(AppConstants.userId) ?? "";
    var response = await apiClient.get(
        url: '${ApiUrl.getConversation.addBaseUrl}/$myUserId',
        showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      chatList.value = List<ChatList>.from(
          response.body["data"].map((x) => ChatList.fromJson(x)));
      chatLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        chatLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        chatLoading(Status.noDataFound);
      } else {
        chatLoading(Status.error);
      }
    }
  }

  ///<========================== send message & image ==========================>
  RxBool sendMsgLoading = false.obs;
  sendMessageImage({required BuildContext context, String receiverId = ""}) async {
    sendMsgLoading.value = true;
    Map<String, dynamic> body = {
      "message": message.text.isNotEmpty?message.text:"",
      "receiverId": receiverId,
    };

    var response = imageFile.value == null
        ? await apiClient.post(
      url: ApiUrl.sendMessage.addBaseUrl,
      showResult: true,
      context: context,
    ) : await apiClient.multipartRequest(
      url: ApiUrl.sendMessage.addBaseUrl,
      reqType: 'post',
      body: body,
      multipartBody: [
        MultipartBody("message_img", File(imageFile.value!.path)),
      ],
    );

    message.clear();
    imageFile.value = null;
    if (response.statusCode == 200) {
    } else if (response.statusCode == 402) {
      toastMessage(message: response.body?["message"]??"something want wrong");
    } else {
      checkApi(response: response, context: context);
    }

    sendMsgLoading.value = false;
    sendMsgLoading.refresh();
  }

  ///========================== Pick Image ========================
  Rx<File?> imageFile = Rx<File?>(null);

  Future<void> selectImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (pickedImage != null) {
        imageFile.value = File(pickedImage.path);
      }
    } catch (error) {

    } finally {
      update();
    }
  }

  @override
  void onInit() {
    getConversation();
    super.onInit();
  }
}

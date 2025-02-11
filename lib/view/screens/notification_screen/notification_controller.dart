import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/notification_screen/notification_model.dart';

class NotificationController extends GetxController{
  ApiClient apiClient=ApiClient();

  var notificationLoading = Status.loading.obs;
  PopularCategoryLoadingMethod(Status status) => notificationLoading.value = status;

  RxList<Datum> notificationList = <Datum>[].obs;
  getNotification({BuildContext? context}) async {
    notificationLoading(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.notification.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      notificationList.value = List<Datum>.from(
          response.body["data"].map((x) => Datum.fromJson(x)));
      notificationLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        notificationLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        notificationLoading(Status.noDataFound);
      } else {
        notificationLoading(Status.error);
      }
    }
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/swap_request_screen/model/swap_my_request_model.dart';

class SwapRequestController extends GetxController{
 RxInt selectedTabIndex=0.obs;

 ApiClient apiClient=ApiClient();
 /// ======================= TopProduct List =========================>
 RxList<MySwapDatum> swapMyReqList = <MySwapDatum>[].obs;

 var swapMyReqLoading = Status.loading.obs;
 SwapMyReqLoadingLoadingMethod(Status status) => swapMyReqLoading.value = status;

 getSwapMyRequest({BuildContext? context}) async {
  swapMyReqLoading(Status.loading);

  var response = await apiClient.get(
      url: ApiUrl.swapMyReq.addBaseUrl, showResult: true);

  if (response.statusCode == 200) {
   // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
   swapMyReqList.value = List<MySwapDatum>.from(
       response.body["data"].map((x) => MySwapDatum.fromJson(x)));
   swapMyReqLoading(Status.completed);
  } else {
   checkApi(response: response, context: context);
   if (response.statusCode == 503) {
    swapMyReqLoading(Status.internetError);
   } else if (response.statusCode == 404) {
    swapMyReqLoading(Status.noDataFound);
   } else {
    swapMyReqLoading(Status.error);
   }
  }
 }

 @override
  void onInit() {
    getSwapMyRequest();
    super.onInit();
  }
}
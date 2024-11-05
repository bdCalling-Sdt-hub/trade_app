import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/swap_product/swap_product_details_model.dart';
import 'package:trade_app/view/screens/swap_request_screen/model/swap_my_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SwapRequestController extends GetxController {
  RxInt selectedTabIndex = 0.obs;

  ApiClient apiClient = ApiClient();


  ///===================Customer care method ==========
  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      await launchUrl(
        phoneUri,
        mode: LaunchMode.externalApplication, // Ensure it uses the external app to handle the call
      );
    } catch (e) {
      debugPrint('Could not launch $phoneNumber: $e');
      throw 'Could not launch $phoneNumber';
    }
  }

  /// ======================= swapMyReqList =========================>
  RxList<MySwapDatum> swapMyReqList = <MySwapDatum>[].obs;

  var swapMyReqLoading = Status.loading.obs;
  SwapMyReqLoadingLoadingMethod(Status status) =>
      swapMyReqLoading.value = status;

  getSwapMyRequest({BuildContext? context}) async {
    swapMyReqLoading(Status.loading);

    var response =
        await apiClient.get(url: ApiUrl.swapMyReq.addBaseUrl, showResult: true);

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

  /// ======================= swapTheirReqList =========================>
  RxList<MySwapDatum> swapTheirReqList = <MySwapDatum>[].obs;

  var swapTheirReqLoading = Status.loading.obs;
  SwapTheirReqLoadingLoadingMethod(Status status) => swapTheirReqLoading.value = status;

  getSwapTheirRequest({BuildContext? context}) async {
    swapTheirReqLoading(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.swapTheirReq.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      swapTheirReqList.value = List<MySwapDatum>.from(
          response.body["data"].map((x) => MySwapDatum.fromJson(x)));
      swapTheirReqLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        swapTheirReqLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        swapTheirReqLoading(Status.noDataFound);
      } else {
        swapTheirReqLoading(Status.error);
      }
    }
  }

  ///<=================== swap accept ==============================>

  RxBool profileUpdateLoading = false.obs;
  swapAccept({required BuildContext context, String swapId = ''}) async {
    profileUpdateLoading = true.obs;

    update();
    Map<String, dynamic> body = {};

    var response = await apiClient.patch(
        url: '${ApiUrl.swapApprove.addBaseUrl}/$swapId',
        showResult: true,
        context: context,
        body: body);

    if (response.statusCode == 200) {
      getSwapTheirRequest();
      // AppRouter.route.replaceNamed(RoutePath.profileScreen);
    } else {
      checkApi(response: response, context: context);
    }

    profileUpdateLoading = false.obs;
    update();
  }

  ///<=================== swap remove ==============================>

  swapRemove({required BuildContext context, String swapId = ''}) async {
    profileUpdateLoading = true.obs;

    update();
    Map<String, dynamic> body = {};

    var response = await apiClient.patch(
        url: '${ApiUrl.swapReject.addBaseUrl}/$swapId',
        showResult: true,
        context: context,
        body: body);

    if (response.statusCode == 200) {
      getSwapTheirRequest();
    } else {
      checkApi(response: response, context: context);
    }

    profileUpdateLoading = false.obs;
    update();
  }

  ///<=================== swap delete ==============================>

  swapDelete({required BuildContext context, String swapId = ''}) async {
    profileUpdateLoading = true.obs;

    update();

    var response = await apiClient.delete(
      url: '${ApiUrl.swapDelete.addBaseUrl}$swapId',
      showResult: true,
      context: context,
    );

    if (response.statusCode == 200) {

      getSwapMyRequest();
    } else {
      checkApi(response: response, context: context);
    }

    profileUpdateLoading = false.obs;
    update();
  }

  ///<=============================== swap Details ================================>
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<SwapProductDetailsModel> swapProductDetailsModel = SwapProductDetailsModel().obs;


  Future<void> getSwapProductDetails({BuildContext? context,String swapId=''}) async {
   setRxRequestStatus(Status.loading);
   refresh();

   var response =
   await apiClient.get(url: '${ApiUrl.swapDetails.addBaseUrl}/$swapId', showResult: true);

   if (response.statusCode == 200) {
     swapProductDetailsModel.value = SwapProductDetailsModel.fromJson(response.body);
    setRxRequestStatus(Status.completed);
    update();
   } else {
    checkApi(response: response, context: context);
    if (response.statusCode == 503) {
     setRxRequestStatus(Status.internetError);
    } else if (response.statusCode == 404) {
     setRxRequestStatus(Status.noDataFound);
    } else {
     setRxRequestStatus(Status.error);
    }
   }
  }

  @override
  void onInit() {

    // getSwapMyRequest();
    // getSwapTheirRequest();
    super.onInit();
  }
}

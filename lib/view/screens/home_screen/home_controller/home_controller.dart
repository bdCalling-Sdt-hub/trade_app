import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/home_screen/model/top_product_model.dart';

class HomeController extends GetxController {
  RxInt bannerIndex = 0.obs;
  bool isEdit = false;
  RxBool isSwap = false.obs;
  Rx<PageController> pageController = PageController().obs;
  TextEditingController swapController = TextEditingController();

  var topProductLoading = Status.loading.obs;
  spamLoadingMethod(Status status) => topProductLoading.value = status;

  ApiClient apiClient = serviceLocator();

  /// ======================= TopProduct List =========================

  RxList<TopProductDatum> topProductList = <TopProductDatum>[].obs;

  getTopProduct({BuildContext? context}) async {
    topProductLoading(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.getTopProduct.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
     // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      topProductList.value = List<TopProductDatum>.from(
          response.body["data"].map((x) => TopProductDatum.fromJson(x)));
      topProductLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        topProductLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        topProductLoading(Status.noDataFound);
      } else {
        topProductLoading(Status.error);
      }
    }
  }

  @override
  void onInit() {
    getTopProduct();
    super.onInit();
  }
}

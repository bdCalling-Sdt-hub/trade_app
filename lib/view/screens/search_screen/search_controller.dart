import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/search_screen/search_model.dart';

class SearchesController extends GetxController{

  var selectedCategory = 'Electronics'.obs;
  var selectedSubCategory = 'Television'.obs;

  List<String> categories = ['Electronics', 'Furniture', 'Clothing','Mobile'];
  List<String> subCategories = ['Television', 'Sofa', 'Shirt','Freez'];

  void updateCategory(String newCategory) {
    selectedCategory.value = newCategory;
  }

  void updateSubCategory(String newSubCategory) {
    selectedSubCategory.value = newSubCategory;
  }
  bool isEdit = false;

  var searchLoading = Status.loading.obs;
  TopProductLoadingMethod(Status status) => searchLoading.value = status;

  ApiClient apiClient = ApiClient();

  /// ======================= TopProduct List =========================>
  RxList<SearchList> searchList = <SearchList>[].obs;
  getSearch({BuildContext? context, String search="",String location= ""}) async {
    searchLoading(Status.loading);

    var response = await apiClient.get(
        url: '${ApiUrl.search.addBaseUrl}?searchTerm=$search', showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      searchList.value = List<SearchList>.from(response.body["data"].map((x) => SearchList.fromJson(x)));
      searchLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        searchLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        searchLoading(Status.noDataFound);
      } else {
        searchLoading(Status.error);
      }
    }
  }

  @override
  void onInit() {
    getSearch();
    super.onInit();
  }
}

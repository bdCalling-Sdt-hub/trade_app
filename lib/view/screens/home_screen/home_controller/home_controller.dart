import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/category_screen/model/sub_category_model.dart';
import 'package:trade_app/view/screens/category_screen/model/sub_category_product_model.dart';
import 'package:trade_app/view/screens/home_screen/model/just_for_you.dart';
import 'package:trade_app/view/screens/home_screen/model/popular_category_model.dart';
import 'package:trade_app/view/screens/home_screen/model/slider.dart';
import 'package:trade_app/view/screens/home_screen/model/top_product_model.dart';

class HomeController extends GetxController {
  RxInt bannerIndex = 0.obs;
  bool isEdit = false;
  RxBool isSwap = false.obs;
  Rx<PageController> pageController = PageController().obs;
  TextEditingController swapController = TextEditingController();

  var topProductLoading = Status.loading.obs;
  TopProductLoadingMethod(Status status) => topProductLoading.value = status;

  ApiClient apiClient = serviceLocator();

  /// ======================= TopProduct List =========================>
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

  /// ======================= justForYou List =========================>
  var justForYouLoading = Status.loading.obs;
  JustForYouLoadingMethod(Status status) => justForYouLoading.value = status;
  RxList<JustForYouDatum> justForYouList = <JustForYouDatum>[].obs;
  getJustForYouProduct({BuildContext? context}) async {
    justForYouLoading(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.justForYou.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      justForYouList.value = List<JustForYouDatum>.from(
          response.body["data"].map((x) => JustForYouDatum.fromJson(x)));
      justForYouLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        justForYouLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        justForYouLoading(Status.noDataFound);
      } else {
        justForYouLoading(Status.error);
      }
    }
  }

  /// ======================= getPopularCategory List =========================>
  var popularCategory = Status.loading.obs;
  PopularCategoryLoadingMethod(Status status) => popularCategory.value = status;

  RxList<CategoryDatum> popularCategoryList = <CategoryDatum>[].obs;
  getPopularCategory({BuildContext? context}) async {
    popularCategory(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.getCategory.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      popularCategoryList.value = List<CategoryDatum>.from(
          response.body["data"].map((x) => CategoryDatum.fromJson(x)));
      popularCategory(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        popularCategory(Status.internetError);
      } else if (response.statusCode == 404) {
        popularCategory(Status.noDataFound);
      } else {
        popularCategory(Status.error);
      }
    }
  }

  /// ======================= Banner List =========================>
  var banner = Status.loading.obs;
  BannerLoadingMethod(Status status) => banner.value = status;

  RxList<SliderDatum> bannerList = <SliderDatum>[].obs;
  getBanner({BuildContext? context}) async {
    banner(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.allAdds.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      bannerList.value = List<SliderDatum>.from(
          response.body["data"].map((x) => SliderDatum.fromJson(x)));
      banner(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        banner(Status.internetError);
      } else if (response.statusCode == 404) {
        banner(Status.noDataFound);
      } else {
        banner(Status.error);
      }
    }
  }

  /// ======================= getSubCategory List =========================>
  var subCategory = Status.loading.obs;
  SubCategoryLoadingMethod(Status status) => subCategory.value = status;

  RxBool isDropdownVisible=false.obs;

  RxList<SubCategoryModelForEdit> subCategoryList = <SubCategoryModelForEdit>[].obs;
  getSubCategory({BuildContext? context,String category=''}) async {
    SubCategoryLoadingMethod(Status.loading);

    var response = await apiClient.get(
        url: '${ApiUrl.getSubCategory.addBaseUrl}?category=$category', showResult: true);

    if (response.statusCode == 200) {
      final data = List<SubDatum>.from(response.body["data"].map((x) => SubDatum.fromJson(x)));

      data.forEach((item){
        subCategoryList.add(SubCategoryModelForEdit(item.id, item.name, item.category?.id));
      });

      print("masum==============${response.body["data"]}");
      SubCategoryLoadingMethod(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        SubCategoryLoadingMethod(Status.internetError);
      } else if (response.statusCode == 404) {
        SubCategoryLoadingMethod(Status.noDataFound);
      } else {
        SubCategoryLoadingMethod(Status.error);
      }
    }
  }

  /// ======================= getSubCategoryProduct List =========================>
  var subCategoryProduct = Status.loading.obs;
  SubCategoryProductLoadingMethod(Status status) => subCategoryProduct.value = status;
  var totalPage = 0;
  var currentPage = 0;

  ScrollController scrollController = ScrollController();

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  RxList<SubProductDatum> subCategoryProductList = <SubProductDatum>[].obs;
  getSubCategoryProduct({BuildContext? context,String catId='',String subCatID=''}) async {
    SubCategoryProductLoadingMethod(Status.loading);

    var response = await apiClient.get(
        url: '${ApiUrl.getSubProduct.addBaseUrl}?category=$subCatID&subCategory=$catId', showResult: true);

    if (response.statusCode == 200) {
      subCategoryProductList.value = List<SubProductDatum>.from(
          response.body["data"].map((x) => SubProductDatum.fromJson(x)));

      if (subCategoryProductList.isNotEmpty) {
        currentPage = response.body['meta']['page'];
        totalPage = response.body['meta']['totalPage'];
      }

      SubCategoryProductLoadingMethod(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        SubCategoryProductLoadingMethod(Status.internetError);
      } else if (response.statusCode == 404) {
        SubCategoryProductLoadingMethod(Status.noDataFound);
      } else {
        SubCategoryProductLoadingMethod(Status.error);
      }
    }
  }

  //==================================Pagination============================

  var isLoadMoreRunning = false.obs;
  RxInt pages = 1.obs;

  loadMore({BuildContext? context,String catId='',String subCatID=''}) async {
    debugPrint("===============load more=============");
    if (subCategoryProduct.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      pages.value += 1;
      refresh();

      Response response = await apiClient.get(
          url: '${ApiUrl.getSubProduct.addBaseUrl}', showResult: true
      );
      currentPage = response.body['meta']['page'];
      totalPage = response.body['meta']['totalPage'];

      if (response.statusCode == 200) {
        var demoList = List<SubProductDatum>.from(
            response.body["data"].map((x) => SubProductDatum.fromJson(x)));
        subCategoryProductList.addAll(demoList);

        subCategoryProductList.refresh();
      } else {
        checkApi(response: response, context: context);
      }
      isLoadMoreRunning(false);
    }
  }

  @override
  void onInit() {
    getTopProduct();
    getJustForYouProduct();
    getPopularCategory();
    getBanner();
    scrollController.addListener(addScrollListener);
    super.onInit();
  }
}
class SubCategoryModelForEdit{
  final String? id;
  final String? name;
  final String? categoryId;
  SubCategoryModelForEdit(this.id, this.name, this.categoryId);
}

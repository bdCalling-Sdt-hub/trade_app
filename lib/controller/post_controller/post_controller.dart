import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/my_products_screen/model/my_product_model.dart';
import 'package:trade_app/view/screens/product_details/product_details_model.dart';

class PostController extends GetxController {
  TextEditingController productCategoryController =
      TextEditingController(text: 'Mobile Accessories');
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController productTitleController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController productValueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isSubCategories = false.obs;
  RxInt selectedCategory = 0.obs;
  TextEditingController subCategoriesController = TextEditingController();

  RxBool isProfession = false.obs;
  RxInt selectProfession = 0.obs;
  TextEditingController professionController = TextEditingController();

  final List<String> religion = [
    'Islam',
    "Buddhism",
    'Hinduism',
    'christianity'
  ];

  final List<String> profession = [
    'Accountant',
    "Doctor",
    'Software Engineer',
    'farmer'
  ];

  ///============================Single Image picker method================
  RxString image = "".obs;

  Rx<File> imageFile = File("").obs;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      image.value = getImages.path;
    }
  }

  ///============================Multi Image picker method================
  RxList<File> selectedImagesMulti = <File>[].obs;
  final ImagePicker picker = ImagePicker();
  ApiClient apiClient = serviceLocator();
  void pickMultiImage() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 80,
      );

      if (pickedFiles.isEmpty) {
        Get.snackbar('No Images Selected', 'No images were selected.');
        selectedImagesMulti.clear();
        return;
      }

      if (pickedFiles.length > 6) {
        Get.snackbar(
            'Image Limit Exceeded', 'You can only select up to 6 images.');
        return;
      }

      selectedImagesMulti.clear();
      for (var xFile in pickedFiles) {
        if (selectedImagesMulti.length < 6) {
          selectedImagesMulti.add(File(xFile.path));
        } else {
          Get.snackbar(
              '', 'You can only pick up to 6 images for each product.');
          break;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while picking images: $e');
    } finally {
      // Notify listeners of changes
      update();
    }
  }

  ///<=============================== add product ===============================>
  RxBool addProductLoading = false.obs;
  addProduct(
      {String catId = '',
      String subCatId = "",
      String userID = "",
      required BuildContext context}) async {
    print('======================== Nadim');
    addProductLoading.value = true;

    update();
    Map<String, dynamic> body = {
      "category": catId,
      "subCategory": subCatId,
      "user": userID,
      "title": productTitleController.text,
      "condition": conditionController.text,
      "description": descriptionController.text,
      "productValue": int.parse(productValueController.text).toString(),

      ///productValueController.text.toString()
      "address": addressController.text,
    };

    // Prepare a list of MultipartBody items for each image
    List<MultipartBody> multipartBodyList = selectedImagesMulti.map((file) {
      return MultipartBody("product_img", file);
    }).toList();

    var response = selectedImagesMulti.isEmpty
        ? await apiClient.post(
            url: ApiUrl.addProduct.addBaseUrl, context: context, body: body)
        : await apiClient.multipartRequest(
            url: ApiUrl.addProduct.addBaseUrl,
            reqType: 'Post',
            body: body,
            multipartBody: multipartBodyList,
          );

    if (response.statusCode == 200) {
      productTitleController.clear();
      subCategoriesController.clear();
      conditionController.clear();
      descriptionController.clear();
      productValueController.clear();
      addressController.clear();
      addProductLoading.value = false;
      multipartBodyList.clear();
      AppRouter.route.replaceNamed(RoutePath.myProductsScreen);
    } else {
      checkApi(response: response, context: context);
    }

    addProductLoading.value = false;
    update();
  }

  ///<=============================== add product ===============================>

  updateProduct(
      {String catId = '',
      String subCatId = "",
      String userID = "",
      String productId = "",
      required BuildContext context}) async {
    print('======================== Nadim');
    addProductLoading.value = true;

    update();
    Map<String, dynamic> body = {
      "category": catId,
      "subCategory": subCatId,
      "user": userID,
      "title": productTitleController.text,
      "condition": conditionController.text,
      "description": descriptionController.text,
      "productValue": int.parse(productValueController.text).toString(),

      ///productValueController.text.toString()
      "address": addressController.text,
    };

    // Prepare a list of MultipartBody items for each image
    // List<MultipartBody> multipartBodyList = selectedImagesMulti.map((file) {
    //   return MultipartBody("product_img", file);
    // }).toList();

    RxList<MultipartBody>? array = <MultipartBody>[].obs;
    for (int i = 0; i < selectedImagesMulti.length; i++) {
      array.add(
        MultipartBody("product_img", selectedImagesMulti[i]),
      );
    }

    var response = selectedImagesMulti.isEmpty
        ? await apiClient.patch(
            url: '${ApiUrl.editProduct.addBaseUrl}/$productId',
            context: context,
            body: body)
        : await apiClient.multipartRequest(
            url: '${ApiUrl.editProduct.addBaseUrl}/$productId',
            reqType: 'patch',
            body: body,
            multipartBody: array,
          );

    if (response.statusCode == 200) {
      productTitleController.clear();
      subCategoriesController.clear();
      conditionController.clear();
      descriptionController.clear();
      productValueController.clear();
      addressController.clear();
      addProductLoading.value = false;
      array.clear();

      AppRouter.route.replaceNamed(RoutePath.myProductsScreen);
    } else {
      checkApi(response: response, context: context);
    }

    addProductLoading.value = false;
    update();
  }

  ///<=============================== delete product ===============================>

  RxInt size = 0.obs;
  deleteProduct({required BuildContext context, String productId = ''}) async {
    print('======================== Nadim');
    addProductLoading.value = true;

    update();
    var response = await apiClient.delete(
      url: '${ApiUrl.deleteProduct.addBaseUrl}/$productId',
      context: context,
    );

    if (response.statusCode == 200) {
      getMyProduct(context: context);
      toastMessage(message: 'Product delete Successfully');
      AppRouter.route.replaceNamed(RoutePath.myProductsScreen);
    } else {
      checkApi(response: response, context: context);
    }

    addProductLoading.value = false;
    update();
  }

  /// ======================= My product List =========================>
  var myProductLoading = Status.loading.obs;
  MyProductLoadingMethod(Status status) => myProductLoading.value = status;

  RxList<Datum> myProductList = <Datum>[].obs;
  getMyProduct({
    BuildContext? context,
  }) async {
    MyProductLoadingMethod(Status.loading);

    var response = await apiClient.get(
        url: '${ApiUrl.myProduct.addBaseUrl}', showResult: true);

    if (response.statusCode == 200) {
      myProductList.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));
      getMyProduct(context: context);
      MyProductLoadingMethod(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        MyProductLoadingMethod(Status.internetError);
      } else if (response.statusCode == 404) {
        MyProductLoadingMethod(Status.noDataFound);
      } else {
        MyProductLoadingMethod(Status.error);
      }
    }
  }

  RxBool isSwap = false.obs;
  Rx<PageController> pageController = PageController().obs;
  TextEditingController swapController = TextEditingController();

  ///<=========================== product details =================================>

  var productDetailsLoading = Status.loading.obs;
  ProductDetailsLoadingMethod(Status status) =>
      productDetailsLoading.value = status;
  Rx<ProductDetailsModel> productDetailsModel = ProductDetailsModel().obs;

  Future<void> getProductDetails(
      {BuildContext? context, required productId}) async {
    print(
        'product id =========================> ${ApiUrl.productDetails.addBaseUrl}/$productId');
    ProductDetailsLoadingMethod(Status.loading);
    refresh();

    var response = await apiClient.get(
        url: '${ApiUrl.productDetails.addBaseUrl}/$productId',
        showResult: true);

    if (response.statusCode == 200) {
      productDetailsModel.value = ProductDetailsModel.fromJson(response.body);

      ProductDetailsLoadingMethod(Status.completed);
      update();
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        ProductDetailsLoadingMethod(Status.internetError);
      } else if (response.statusCode == 404) {
        ProductDetailsLoadingMethod(Status.noDataFound);
      } else {
        ProductDetailsLoadingMethod(Status.error);
      }
    }
  }

  ///<==================== swap product =======================>
  swapProduct(
      {required String productUserID,
      required String productProductID,
      required String myUserID,
      required String myProductId,
      required BuildContext context}) async {
    addProductLoading.value = true;

    update();
    Map<String, dynamic> body = {
      "userFrom": myUserID,
      "userTo": productUserID,
      "productFrom": myProductId,
      "productTo": productProductID,
    };

    var response = await apiClient.post(
        url: ApiUrl.swapProduct.addBaseUrl, context: context, body: body);

    if (response.statusCode == 200) {
      AppRouter.route.replaceNamed(RoutePath.swapRequestScreen);
    } else {
      checkApi(response: response, context: context);
    }

    addProductLoading.value = false;
    update();
  }

  @override
  void onInit() {
  //  getMyProduct();
    super.onInit();
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/swap_history_screen/swap_history_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  ///============================Image picker method================
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

  ///=======================Controller here=====================
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController currentPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController reTypePasswordController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController zipCodeController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController countryController = TextEditingController();

///==========================Update Country Picker================
  var selectedCountry = ''.obs;

  void updateCountry(String country) {
    selectedCountry.value = country;
  }



  final List<Map<String, String>> faqList = [
    {"que": "What is your exchange policy?", "ans": "This is an dummy answer, To show in UI"},
    {"que": "How do I exchange a product?", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Are there any items that cannot be exchanged?", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Do I have to pay for return shipping?", "ans": "This is an dummy answer, To show in UI"},
    {"que": "How long does the exchange process take?", "ans": "This is an dummy answer, To show in UI"},
  ];


  ///===================Customer care method ==========
  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  /// ======================= My product List =========================>
  var myProductLoading = Status.loading.obs;
  MyProductLoadingMethod(Status status) => myProductLoading.value = status;

  ApiClient apiClient=ApiClient();
  RxList<SwapHistoryDatum> swapHistoryList = <SwapHistoryDatum>[].obs;
  getSwapHistory({
    BuildContext? context,
  }) async {
    MyProductLoadingMethod(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.swapHistory.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      swapHistoryList.value =
      List<SwapHistoryDatum>.from(response.body["data"].map((x) => SwapHistoryDatum.fromJson(x)));

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

@override
  void onInit() {
    getSwapHistory();
    super.onInit();
  }
}

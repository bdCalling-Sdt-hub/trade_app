import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/profile_screen/profile_model.dart';
import 'package:trade_app/view/screens/setting_screen/help_center_screen/help_center_model.dart';
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

  RxInt size = 0.obs;

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

  RxBool profileUpdateLoading = false.obs;
  updateProfile({required BuildContext context}) async {
    profileUpdateLoading = true.obs;

    update();
    Map<String, dynamic> body = {
      "name": firstNameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
    };

    var response = imageFile == null
        ? await apiClient.patch(
            url: ApiUrl.editProfile.addBaseUrl,
            showResult: true,
            context: context,
          )
        : await apiClient.multipartRequest(
            url: ApiUrl.editProfile.addBaseUrl,
            reqType: 'patch',
            body: body,
            multipartBody: [
              MultipartBody("profile_image", File(imageFile!.value.path)),
            ],
          );

    if (response.statusCode == 200) {
      firstNameController.clear();
      emailController.clear();
      phoneController.clear();
      getProfile();
      AppRouter.route.replaceNamed(RoutePath.profileScreen);
    } else {
      checkApi(response: response, context: context);
    }

    profileUpdateLoading = false.obs;
    update();
  }

  updateAddress({required BuildContext context}) async {
    profileUpdateLoading = true.obs;

    update();
    Map<String, dynamic> body = {
      "address": addressController.text,
      "country": countryController.text,
      "zip": zipCodeController.text,
      "city": cityController.text,
    };

    var response = await apiClient.patch(
        url: ApiUrl.editProfile.addBaseUrl,
        showResult: true,
        context: context,
        body: body);

    if (response.statusCode == 200) {
      addressController.clear();
      countryController.clear();
      zipCodeController.clear();
      getProfile();
      AppRouter.route.replaceNamed(RoutePath.profileScreen);
    } else {
      checkApi(response: response, context: context);
    }

    profileUpdateLoading = false.obs;
    update();
  }

  ///<=============================== get profile ================================>
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<ProfileModel> profileModel = ProfileModel().obs;

  ApiClient apiClient = ApiClient();
  Future<void> getProfile({BuildContext? context}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response =
        await apiClient.get(url: ApiUrl.profile.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      profileModel.value = ProfileModel.fromJson(response.body);
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

  ///==========================Update Country Picker================
  var selectedCountry = ''.obs;

  void updateCountry(String country) {
    selectedCountry.value = country;
  }

  final List<Map<String, String>> faqList = [
    {
      "que": "What is your exchange policy?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How do I exchange a product?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "Are there any items that cannot be exchanged?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "Do I have to pay for return shipping?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How long does the exchange process take?",
      "ans": "This is an dummy answer, To show in UI"
    },
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

  RxList<SwapHistoryDatum> swapHistoryList = <SwapHistoryDatum>[].obs;
  getSwapHistory({
    BuildContext? context,
  }) async {
    MyProductLoadingMethod(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.swapHistory.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      swapHistoryList.value = List<SwapHistoryDatum>.from(
          response.body["data"].map((x) => SwapHistoryDatum.fromJson(x)));

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

  ///<========================== change password ===========================>
  RxBool signUpLoading = false.obs;
  changePassword({required BuildContext context}) async {
    signUpLoading.value = true;
    Map<String, dynamic> body = {
      "oldPassword": currentPasswordController.value.text,
      "newPassword": newPasswordController.value.text,
      "confirmPassword": reTypePasswordController.value.text,
    };

    var response = await apiClient.patch(
      context: context,
      body: body,
      url: ApiUrl.changePassword.addBaseUrl,
    );

    if (response.statusCode == 200) {
      AppRouter.route.pushNamed(RoutePath.settingScreen);
    } else if (response.statusCode == 402) {
      toastMessage(message: response.body["message"]);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signUpLoading.value = false;
    signUpLoading.refresh();
  }

  ///<========================== change password ===========================>

  final TextEditingController commentController = TextEditingController();
  reviewRating(
      {required BuildContext context,
      required double rating,
      required String swapId}) async {
    signUpLoading.value = true;
    Map<String, dynamic> body = {
      "swapId": swapId,
      "ratting": rating,
      "comment": commentController.value.text,
    };

    var response = await apiClient.post(
      context: context,
      body: body,
      url: ApiUrl.reviewSend.addBaseUrl,
    );

    if (response.statusCode == 200) {
      AppRouter.route.pushNamed(RoutePath.swapHistoryScreen);
    }
    else if (response.statusCode == 402) {
      toastMessage(message: response.body["message"]);

    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signUpLoading.value = false;
    signUpLoading.refresh();
  }


  Rx<HelpCenterModel> helpCenterModel = HelpCenterModel().obs;
  Future<void> getFaq({BuildContext? context}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response =
    await apiClient.get(url: ApiUrl.getFaq.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      helpCenterModel.value = HelpCenterModel.fromJson(response.body);
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
    getSwapHistory();
    getProfile();
    getFaq();
    super.onInit();
  }
}

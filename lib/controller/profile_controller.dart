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


  List<Map<String, String>> helpList = [
    {
      'ans': 'What is a product swap?',
      'que':
          'A product swap allows users to exchange items they no longer need for something they want, without using money.'
    },
    {
      'ans': 'Is there a fee to use this platform?',
      'que': 'No, our platform is free to use for listing and swapping items.'
    },
    {
      'ans': 'What types of products can I swap?',
      'que':
          'You can swap almost anything, such as electronics, clothing, furniture, books, or even services, as long as it complies with our terms and conditions.'
    },
    {
      'ans': 'How do I contact someone for a swap?',
      'que':
          'Use the chat feature on the platform to discuss the details and finalize the swap arrangement.'
    },
    {
      'ans': 'What if the product I receive is not as described?',
      'que':
          'Please report the issue to our support team. We encourage users to share accurate descriptions and images of their items.'
    },
    {
      'ans':
          'Are there safety guidelines for meeting in person to exchange items?',
      'que':
          'Yes, we recommend meeting in public places and bringing a friend for added safety when exchanging items in person.'
    },
    {
      'ans': 'How do I list a product for swapping?',
      'que':
          'You can create a listing by uploading photos of your item, adding a description, and specifying what you are looking to swap it for.'
    },
    {
      'ans': 'How do I find products available for swapping?',
      'que':
          'Browse the available items by category, location, or search keywords to find what you are looking for.'
    },
    {
      'ans': 'What happens if I don’t find a suitable swap?',
      'que':
          'You can keep your listing active until a suitable swap offer comes through. You may also explore other categories for options.'
    },
    {
      'ans': 'Is there a rating or review system?',
      'que':
          'Yes, users can leave ratings and reviews for each other to ensure trust and transparency in the swapping process.'
    },
    {
      'ans': 'Can I swap products with users in other locations?',
      'que':
          'Yes, but you’ll need to discuss and agree on shipping arrangements with the other user.'
    },
    {
      'ans': 'What items are prohibited on this platform?',
      'que':
          'Prohibited items include illegal substances, weapons, stolen goods, and items that violate intellectual property rights. Please refer to our full list of prohibited items in the terms and conditions.'
    },
  ];

  TextEditingController reportController = TextEditingController();

  ///============================Multi Image picker method ================
  RxList<File> selectedImagesMulti = <File>[].obs;
  final ImagePicker picker = ImagePicker();
  // ApiClient apiClient = serviceLocator();
  void pickMultiImage() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 15,
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

  RxBool reportLoading = false.obs;
  reportAdd(
      {required BuildContext context,
      required String swapId,
      required String againstUser}) async {
    reportLoading.value = true;

    update();
    Map<String, dynamic> body = {
      "againstUser": againstUser,
      "description": reportController.text,
      "swapId": swapId
    };
    List<MultipartBody> multipartBodyList = selectedImagesMulti.map((file) {
      return MultipartBody("reportImage", file);
    }).toList();
    var response = selectedImagesMulti.isEmpty
        ? await apiClient.post(
            url: ApiUrl.createReport.addBaseUrl,
            context: context,
            body: body,
            showResult: true)
        : await apiClient.multipartRequest(
            url: ApiUrl.createReport.addBaseUrl,
            reqType: 'Post',
            body: body,
            multipartBody: multipartBodyList,
            showResult: true);

    if (response.statusCode == 200) {
      reportController.clear();
      multipartBodyList.clear();
      toastMessage(message: response.body["message"]);
      AppRouter.route.pushNamed(RoutePath.swapHistoryScreen);
    } else {
      checkApi(response: response, context: context);
    }
    reportLoading.value = false;
  }

  RxInt selectedFqw = 100000.obs;

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
  RxBool reviewLoading = false.obs;
  final TextEditingController commentController = TextEditingController();
  reviewRating(
      {required BuildContext context,
      required double rating,
      required String swapId}) async {
    reviewLoading.value = true;

    Map<String, dynamic> body = {
      "swapId": swapId,
      "ratting": rating,
      "comment": commentController.value.text,
      // "swapOwner": ownerId
    };

    var response = await apiClient.post(
      context: context,
      body: body,
      url: ApiUrl.reviewSend.addBaseUrl,
    );

    if (response.statusCode == 200) {
      commentController.clear();
      toastMessage(message: response.body["message"]);
      AppRouter.route.pushNamed(RoutePath.swapHistoryScreen);
    } else if (response.statusCode == 402) {
      toastMessage(message: response.body["message"]);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    reviewLoading.value = false;
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

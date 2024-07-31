import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
}

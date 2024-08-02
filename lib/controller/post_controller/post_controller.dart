import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController{
  TextEditingController productCategoryController = TextEditingController(text: 'Mobile Accessories');
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

  final List<String> subCategoriesList=[
    "Smart Phone",
    "Apple Watch",
    "HeadPhone"
  ];

  final List<String> religion=[
    'Islam',
    "Buddhism",
    'Hinduism',
    'christianity'
  ];

  final List<String> profession=[
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

  void pickMultiImage() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 80,
      );

      if (pickedFiles == null || pickedFiles.isEmpty) {
        Get.snackbar('No Images Selected', 'No images were selected.');
        selectedImagesMulti.clear();
        return;
      }

      if (pickedFiles.length > 6) {
        Get.snackbar('Image Limit Exceeded', 'You can only select up to 6 images.');
        return;
      }

      selectedImagesMulti.clear();
      for (var xFile in pickedFiles) {
        if (selectedImagesMulti.length < 6) {
          selectedImagesMulti.add(File(xFile.path));
        } else {
          Get.snackbar('', 'You can only pick up to 6 images for each product.');
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



}
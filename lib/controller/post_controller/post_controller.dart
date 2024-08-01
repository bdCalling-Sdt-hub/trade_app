import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

  final List<String> subCategoriesList=[
    "Smart Phone",
    "Apple Watch",
    "HeadPhone"
  ];
}
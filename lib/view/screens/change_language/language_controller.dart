import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxBool isLanguage = false.obs;
  RxInt selectedCategory = 0.obs;
  TextEditingController language = TextEditingController();

  final List<String> languageList=[
    "English",
    "spanish"
  ];
}

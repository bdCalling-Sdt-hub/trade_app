import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt bannerIndex = 0.obs;
  bool isEdit=false;
  Rx<PageController> pageController = PageController().obs;
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{
  RxInt bannerIndex = 0.obs;
  bool isEdit=false;
  RxBool isSwap=false.obs;
  Rx<PageController> pageController = PageController().obs;
  TextEditingController swapController=TextEditingController();
}
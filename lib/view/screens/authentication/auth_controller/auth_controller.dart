import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  ///<=========================== Sign in controller========================>
  TextEditingController signInEmail =
  TextEditingController( );
  TextEditingController passWordSignIn =
  TextEditingController( );

  bool isRemember = false;
  /*bool signInLoading = false;
  signInUser() async {
    signInLoading = true;
    update();
    Map<String, String> body = {
      'email': signInEmail.text,
      'password': passWordSignIn.text,
    };

    var response = await ApiClient.postData(
      ApiConstant.login,
      body,
    );

    if (response.statusCode == 200) {
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]);
      Get.offAllNamed(AppRoute.homeScreen);
      // profileController.getProfile();
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();
  }*/
}
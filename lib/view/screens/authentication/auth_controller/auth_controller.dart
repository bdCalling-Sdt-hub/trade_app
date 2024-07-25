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
  bool isTerms = false;
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

  ///<================== sign up controller =======================>
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController addressSignUp = TextEditingController();
  TextEditingController passSignUp = TextEditingController();
  TextEditingController confirmPassSignup = TextEditingController();

/*  bool signUpLoading = false;
  signUpUser() async {
    signUpLoading = true;
    update();
    Map<String, String> body = {
      'name': fullNameSignUp.text,
      'email': emailSignUp.text,
      'phone': phoneSignUp.text,
      'password': passSignUp.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.register,
      body,
    );
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.signUpOtp);

      fullNameSignUp.clear();
      //emailSignUp.clear();
      phoneSignUp.clear();
      passSignUp.clear();
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();
  }*/
}
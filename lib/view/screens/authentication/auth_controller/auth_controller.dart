import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/helper/local_db/local_db.dart';
import 'package:trade_app/helper/tost_message/show_snackbar.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';

class AuthController extends GetxController{

  ApiClient apiClient = serviceLocator();
  DBHelper dbHelper = serviceLocator();


  ///<=========================== Sign in controller========================>
  TextEditingController signInEmail =
  TextEditingController( );
  TextEditingController passWordSignIn =
  TextEditingController( );

  saveInformation({required Response<dynamic> response}) {
    dbHelper.storeTokenUserdata(
        token: response.body["data"]["accessToken"],
    );
  }

  bool isRemember = false;
  bool isTerms = false;
  ///============================ Sign In =========================
  RxBool signInLoading = false.obs;

  signIn({required BuildContext context}) async {
    signInLoading.value = true;

    var body = {
      "email": signInEmail.value.text,
      "password": passWordSignIn.value.text
    };
    var response = await apiClient.post(
        showResult: false,
        context: context,
        body: body,
        isBasic: true,
        url: ApiUrl.login.addBaseUrl);

    // // Ensure the widget is still mounted before using BuildContext
    // if (!context.mounted) return;

    if (response.statusCode == 200) {
      saveInformation(response: response);
      AppRouter.route.replaceNamed(RoutePath.homeScreen);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signInLoading.value = false;
    signInLoading.refresh();
  }

  ///<================== sign up controller =======================>
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController addressSignUp = TextEditingController();
  TextEditingController passSignUp = TextEditingController();
  TextEditingController confirmPassSignup = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  RxBool signUpLoading = false.obs;
  signup({required BuildContext context}) async {
    signUpLoading.value = true;
    var body = {
      "firstName": firstNameController.value.text,
      "lastName": lastNameController.value.text,
      "email": emailSignUp.value.text,
      "phone_number": phoneSignUp.value.text,
      "address": addressSignUp.value.text,
      "password": passSignUp.value.text,
      "confirmPassword": confirmPassSignup.value.text
    };

    var response = await apiClient.post(
        context: context,
        body: body,
        isBasic: true,
        url:ApiUrl.register.addBaseUrl);

    if (response.statusCode == 200) {
      secondsRemaining.value = 60;
      secondsRemaining.refresh();
      startTimer();
      AppRouter.route.pushNamed(RoutePath.signUpOtp);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signUpLoading.value = false;
    signUpLoading.refresh();
  }

  /// ===================== Resent OTP ======================

  Future<bool> resendOTP(context) async {
    var body = {"email": emailSignUp.value.text};

    var response = await apiClient.post(
        isBasic: true,
        body: body,
        url: ApiUrl.resend.addBaseUrl, context: context
            );

    if (response.statusCode == 200) {
      secondsRemaining.value = 60;
      secondsRemaining.refresh();
      startTimer();

      return true;
    } else {
      return false;
    }
  }

  /// ======================== Timer ====================
  RxInt secondsRemaining = 60.obs;
  late Timer timer;
  void startTimer() {
    debugPrint("resend OTP Timer -------->>>>>>>>> $secondsRemaining");
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
        secondsRemaining.refresh();
        debugPrint("resend OTP Timer -------->>>>>>>>> $secondsRemaining");
      } else {
        timer.cancel();
      }
    });
  }

  /// ====================== signUpOtpVarify ========================
  RxBool verifyLoading = false.obs;
  RxString signUpOtp=''.obs;
  signUpOtpVerify({required BuildContext context}) async {
    verifyLoading.value = true;
    var body = {
      "userEmail": emailSignUp.value.text,
      "activation_code": signUpOtp.value
    };

    var response = await apiClient.post(
        body: body,
        isBasic: true,
        url: ApiUrl.activeUser.addBaseUrl, context: context);

    if (response.statusCode == 201) {
      timer.cancel();
      showSnackBar(
        // ignore: use_build_context_synchronously
          context: context,
          content: response.body["message"],
          backgroundColor: Colors.green);

      AppRouter.route.pushReplacementNamed(
        RoutePath.signInScreen,
      );
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    verifyLoading.value = false;
  }

  ///<========================= forgot controller =========================>
  TextEditingController forgotPassEmailController = TextEditingController();

  /*  handleForgetPassword() async {
    signUpLoading = true;
    update();
    var body = {"email": forgotPassEmailController.text.trim()};
    var response = await ApiClient.postData(
      ApiConstant.forgetPass,
      body,
    );
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.otpScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();
  }*/

  ///<============================ reset password ==============================>
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  //var token='';

/*  handleResetPassword() async {
    signUpLoading = true;
    //var bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);
    update();

    Map<String, String> header = {'authorization': token};
    var body = {
      "newPassword": newPassController.text,
      "confirmPassword": confirmPassController.text,
    };

    var response =
    await ApiClient.postData(ApiConstant.resetPass, body, headers: header);

    if (response.statusCode == 200) {
      Get.snackbar("Done", "Successfully updated");
      Get.offAllNamed(AppRoute.logIn);
    } else {
      ApiChecker.checkApi(response);
    }

    signUpLoading = false;
    update();
  }*/
}
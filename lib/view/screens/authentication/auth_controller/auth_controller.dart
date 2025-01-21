import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/helper/local_db/local_db.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/helper/tost_message/show_snackbar.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';

class AuthController extends GetxController {
  ApiClient apiClient = serviceLocator();
  DBHelper dbHelper = serviceLocator();

  ///<=========================== Sign in controller========================>
  TextEditingController signInEmail =
      TextEditingController(text: 'nadimhasannh48@gmail.com');
  TextEditingController passWordSignIn =
      TextEditingController(text: 'Nadim12345');

  saveInformation({required Response<dynamic> response}) {
    // dbHelper.storeTokenUserdata(
    //   token: response.body["data"]["accessToken"],
    // );
    SharePrefsHelper.setString(AppConstants.token, response.body["data"]["accessToken"]);
    SharePrefsHelper.setString(AppConstants.userId, response.body["data"]["user"]["_id"]);
  }

  RxBool isRemember = false.obs;
  bool isTerms = false;

  ///============================ Sign In =========================
  RxBool signInLoading = false.obs;

  signIn({required BuildContext context}) async {
    signInLoading.value = true;

    String? fcmToken;

    if (Platform.isIOS) {
      fcmToken = await FirebaseMessaging.instance.getAPNSToken();
    } else {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }

    var body = {
      "email": signInEmail.value.text,
      "password": passWordSignIn.value.text,
      "deviceToken" : fcmToken.toString()
    };
    var response = await apiClient.post(
        showResult: true,
        context: context,
        body: body,
        isBasic: true,
        url: ApiUrl.login.addBaseUrl);

    if (response.statusCode == 200) {
      saveInformation(response: response);
      AppRouter.route.replaceNamed(RoutePath.homeScreen);
    } else if (response.statusCode == 404) {
      toastMessage(message: response.body["message"]);
    } else {
      // ignore: use_build_context_synchronously
     // checkApi(response: response, context: context);
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
        url: ApiUrl.register.addBaseUrl);

    if (response.statusCode == 200) {
      firstNameController.clear();
      lastNameController.clear();
      // emailSignUp.clear();
      phoneSignUp.clear();
      addressSignUp.clear();
      passSignUp.clear();
      confirmPassController.clear();
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
        url: ApiUrl.resend.addBaseUrl,
        context: context);

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

  /// ====================== signUpOtpVarify ========================>
  RxBool verifyLoading = false.obs;
  RxString signUpOtp = ''.obs;
  signUpOtpVerify({required BuildContext context}) async {
    verifyLoading.value = true;

    String? fcmToken;

    if (Platform.isIOS) {
      fcmToken = await FirebaseMessaging.instance.getAPNSToken();
    } else {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }
    var body = {
      "userEmail": emailSignUp.value.text,
      "activation_code": signUpOtp.value,
      "deviceToken": fcmToken.toString(),
    };

    var response = await apiClient.post(
        body: body,
        isBasic: true,
        url: ApiUrl.activeUser.addBaseUrl,
        context: context);

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

  ///============================ forgot pass =========================
  TextEditingController forgotPassEmailController = TextEditingController();

  forgotPass({required BuildContext context}) async {
    signInLoading.value = true;

    var body = {
      "email": forgotPassEmailController.value.text,
    };

    var response = await apiClient.post(
        showResult: false,
        context: context,
        body: body,
        isBasic: true,
        url: ApiUrl.forgotPassword.addBaseUrl);

    if (response.statusCode == 200) {
      // saveInformation(response: response);
      AppRouter.route.replaceNamed(RoutePath.otpScreen);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signInLoading.value = false;
    signInLoading.refresh();
  }

  /// ===================== forgot Resent OTP ======================
  Future<bool> forgotResendOTP(context) async {
    var body = {"email": forgotPassEmailController.value.text};

    var response = await apiClient.post(
        isBasic: true,
        body: body,
        url: ApiUrl.resendVerify.addBaseUrl,
        context: context);

    if (response.statusCode == 200) {
      secondsRemaining.value = 60;
      secondsRemaining.refresh();
      startTimer();

      return true;
    } else {
      return false;
    }
  }

  /// ====================== signUpOtpVarify ========================
  //RxBool verifyLoading = false.obs;
  RxString OtpScreen = ''.obs;
  forgotOtpVerify({required BuildContext context}) async {
    verifyLoading.value = true;
    var body = {
      "email": forgotPassEmailController.value.text,
      "code": OtpScreen.value
    };

    var response = await apiClient.post(
        body: body,
        isBasic: true,
        url: ApiUrl.verifyOtp.addBaseUrl,
        context: context);

    if (response.statusCode == 200) {
      //timer.cancel();
      showSnackBar(
          context: context,
          content: response.body["message"],
          backgroundColor: Colors.green);

      AppRouter.route.replaceNamed(RoutePath.resetPasswordScreen);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    verifyLoading.value = false;
  }

  ///============================ Sign In =========================

  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  resetPassword({required BuildContext context}) async {
    signInLoading.value = true;
    var body = {
      "email": forgotPassEmailController.value.text,
      "newPassword": newPassController.value.text,
      "confirmPassword": confirmPassController.value.text,
    };
    var response = await apiClient.post(
        showResult: false,
        context: context,
        body: body,
        isBasic: true,
        url: ApiUrl.resetPassword.addBaseUrl);

    if (response.statusCode == 200) {
      showSnackBar(
          context: context,
          content: response.body["message"],
          backgroundColor: Colors.green);
      AppRouter.route.replaceNamed(RoutePath.signInScreen);
    } else {
      checkApi(response: response, context: context);
    }
    signInLoading.value = false;
    signInLoading.refresh();
  }
}

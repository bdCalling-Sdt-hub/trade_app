import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/my_membership_screen/membership_profile_model/membership_profile_model.dart';

class PaymentController extends GetxController {

  ApiClient apiClient = ApiClient();

  ///========================= Create Payment Intent =========================
  Map<String, dynamic> value = {};
  Future<Map<String, dynamic>> createPaymentIntent(
      {required int price, required BuildContext context}) async {
  //  var bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);
    // var mainHeaders = {
    //   'Content-Type': 'application/json',
    //   //'Accept': 'application/json',
    //   'Authorization': 'Bearer $bearerToken'
    // };
    Map<String,dynamic> body = {
      "amount": price,
    };
    try {
      var response = await apiClient.post(
          url: ApiUrl.paymentIntent.addBaseUrl, context: context, body: body,showResult: true,);
      debugPrint("Payment Intent body ${response.statusCode}");

      if (response.statusCode == 200) {
        print('================== ${response.body["data"]}');
        return response.body["data"];
      } else {
       // checkApi(response: response, context: context);
        toastMessage(message: 'response error');
        return {};
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
      print(error);
      return {};
    }
  }

  ///========================= Make Payment =========================

  Future<void> makePayment({
    required int amount,
    required String userId,
    required String planId,
    required String subscriptionId,
    required BuildContext context,
  }) async {
    try {
      Map<String, dynamic> paymentIntentData =
          await createPaymentIntent(price: amount, context: context);

      print('Payment Intent Data: ${paymentIntentData.toString()}');

      if (paymentIntentData.isNotEmpty) {
        print('================== ${paymentIntentData.isNotEmpty}');
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Nadim',
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          allowsDelayedPaymentMethods: true,
          style: ThemeMode.light,
        )).onError((e,s){
          print('===================== error response ${e}');
        });
        await Stripe.instance.presentPaymentSheet();

        /// >><><><><><><<><><><><><><> Send response in server <><><><><><><><><><<><><><><><><<

        makeOrder(
          price: amount,
          transactionId: paymentIntentData['transactionId'] ?? "",
          context: context, userId: userId, planId: planId, subscriptionId: subscriptionId,
        );

        toastMessage(message: "Payment Successful");
      }
    } catch (e) {
      debugPrint("Error ================>>>>>>>>>>>>>${e.toString()}");
      toastMessage(message: "Error $e");
    }
  }

  ///============================ Send Response to server ==============================

  makeOrder({

    required int price,

    required String transactionId,
    required String userId,
    required String planId,
    required String subscriptionId,
    required BuildContext context,
  }) async {
    var bearerToken =
        await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    Map<String, dynamic> body = {
      "amount": price,
      "user": userId,
      "transaction_id": transactionId,
      "plan_id": planId,
      "package_id": subscriptionId,
    };
    var response = await apiClient.post(url: ApiUrl.successIntent.addBaseUrl, context: context!, body: body);
    if (response.statusCode == 200) {
      AppRouter.route.pushNamed(RoutePath.homeScreen);

      toastMessage(message: response.body["message"]);
    } else {
      checkApi(response: response, context: context);
    }
  }
}

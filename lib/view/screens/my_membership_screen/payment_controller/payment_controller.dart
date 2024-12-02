import 'package:get/get.dart';

class PaymentController extends GetxController{
  ///========================= Create Payment Intent =========================
/*  Map<String, dynamic>value = {};

  Future<Map<String,dynamic>> createPaymentIntent (
      {required double price}) async {
    var bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {
      "price": price,

    };
    try {
      var response = await ApiClient.postData(
          ApiConstant.paymentIntent,
          jsonEncode(body),
          headers: mainHeaders
      );
      debugPrint("Payment Intent body ${response.body}");

      if(response.statusCode==200){

        value =  response.body["data"];
        return value;

      }else{
        ApiChecker.checkApi(response);
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
    required double amount,
    required int totalItem,
    required int points,
    required int deliveryFee,

    required String cartId,
    required String deliveryDate,
    required List productId,
    required bool isPickedUp,
  }) async {

    try {
      Map<String,dynamic>  paymentIntentData = await createPaymentIntent(price: amount);

      print('===========-------------------------${paymentIntentData}');


      if (paymentIntentData.isNotEmpty) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters:  SetupPaymentSheetParameters(
              merchantDisplayName: 'Nadim',
              paymentIntentClientSecret: paymentIntentData['client_secret'],
              allowsDelayedPaymentMethods: true,
              style: ThemeMode.light,
            ));
        await Stripe.instance.presentPaymentSheet();

        /// >><><><><><><<><><><><><><> Send response in server <><><><><><><><><><<><><><><><><<

        makeOrder(

          totalItem: totalItem,
          price: amount,
          deliveryDate:  deliveryDate,
          deliveryFee: deliveryFee,
          cart:  cartId,
          points: points,
          paymentMethod: 'online',
          transactionId: paymentIntentData['transactionId'] ?? "", isPicked: isPickedUp, productId: productId,
        );

        toastMessage(message:"Payment Successful");
      }
    } catch (e) {
      debugPrint("Error ================>>>>>>>>>>>>>${e.toString()}");
      toastMessage(message: "Error $e");
    }
  }

  ///============================ Send Response to server ==============================

  makeOrder({

    required int totalItem,
    required double price,
    required String deliveryDate,
    required int deliveryFee,
    required String cart,
    required int points,
    required String paymentMethod,
    required String transactionId,
    required bool isPicked,
    required List productId,

  }) async {

    var bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    Map<String, dynamic> body = {

      "totalItem":totalItem ,
      "price":price ,
      "deliveryDate":deliveryDate,
      "deliveryFee":deliveryFee ,
      "cart":cart,
      "points":points ,
      "transactionId":transactionId ,
      "callForPickup": isPicked,
      "paymentMethod":paymentMethod,
      "products" :  productId
    };
    var response =
    await ApiClient.postData(ApiConstant.order,jsonEncode(body),headers: mainHeaders);
    if (response.statusCode == 200){
      Get.toNamed(AppRoute.orderHistoryScreen);
      notificationController.getNotification();
      toastMessage(message: response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }*/
}
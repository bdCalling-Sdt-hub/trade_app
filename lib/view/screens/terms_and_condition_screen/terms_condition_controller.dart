import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/privacy_policy_screen/privacy_policy_model.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/term_condition_model.dart';

class TermsConditionController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<========================= terms & condition ==============================>
  Rx<TermsConditionModel> termsModel = TermsConditionModel().obs;

  ApiClient apiClient=ApiClient();
    getTerms({BuildContext? context}) async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await apiClient.get(url: ApiUrl.termsCondition.addBaseUrl,showResult: true);

    if (response.statusCode == 200) {
      termsModel.value = TermsConditionModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
      update();
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        rxRequestStatus(Status.internetError);
      } else if (response.statusCode == 404) {
        rxRequestStatus(Status.noDataFound);
      } else {
        rxRequestStatus(Status.error);
      }
    }
  }

  ///<========================= privacy policy ==============================>
  Rx<PrivacyPolicyModel> privacyModel = PrivacyPolicyModel().obs;

  getPrivacy({BuildContext? context}) async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await apiClient.get(url: ApiUrl.privacyPolicy.addBaseUrl,showResult: true);

    if (response.statusCode == 200) {
      privacyModel.value = PrivacyPolicyModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
      update();
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        rxRequestStatus(Status.internetError);
      } else if (response.statusCode == 404) {
        rxRequestStatus(Status.noDataFound);
      } else {
        rxRequestStatus(Status.error);
      }
    }
  }

  @override
  void onInit() {
    getTerms();
    getPrivacy();
    super.onInit();
  }
}
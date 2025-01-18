import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/screens/membership_package/package_details_model.dart';
import 'package:trade_app/view/screens/membership_package/package_model.dart';

class PackageController extends GetxController {
  RxInt size=0.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeBirthController = TextEditingController();
  final TextEditingController licenseNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phnNumberController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController destinationStartController =
      TextEditingController();
  final TextEditingController stateStartController = TextEditingController();
  final TextEditingController countryStartController = TextEditingController();
  final TextEditingController countyStartController = TextEditingController();
  final TextEditingController destinationEndController =
      TextEditingController();
  final TextEditingController stateEndController = TextEditingController();
  final TextEditingController countryEndController = TextEditingController();
  final TextEditingController countyEndController = TextEditingController();
  final TextEditingController dateTravelController = TextEditingController();
  final TextEditingController swapAboutController = TextEditingController();

  final RxString selectedPets = "Yes".obs;
  final RxString selectedChildren = "Yes".obs;
  final RxString ownerOfProperty = "Yes".obs;
  final RxString propertyInsured = "Yes".obs;
  final RxString haveVehicle = "Yes".obs;
  final RxString willingVehicle = "Yes".obs;
  final RxString ableApproveForm = "Yes".obs;
  final RxString utilitiesUptoDate = "Yes".obs;
  final RxString departureArrival = "Yes".obs;
  final RxString purposeTravel = "Business".obs;

  RxString planType = ''.obs;
  RxString planId = ''.obs;
  RxInt amount = 0.obs;

  ///<========================== question ===========================>
  RxBool signUpLoading = false.obs;
  question({
    required BuildContext context,

    required String planId,
    required String amount,
  }) async {
    signUpLoading.value = true;
    Map<String, dynamic> body = {
      "plan_id": planId,
      "amount": amount,
      // "planStartDate": planStartDate,
      // "planEndDate": planEndDate,
      //"payment_status": payment_status,
      "plan_type": planType.value,
      "name": nameController.value.text,
      "date_of_birth": destinationStartController.value.text,
      "place_of_birth": placeBirthController.value.text,
      "license_number": licenseNoController.value.text,
      "passport_number": passwordController.value.text,
      "email": emailController.value.text,
      "phone_number": phnNumberController.value.text,
      "profession": professionController.value.text,
      // "region": regionController.value.text,
      "haveChildren": selectedChildren.value,
      "havePets": selectedPets.value,
      "haveVehicle": haveVehicle.value,
      "willingVehicle": willingVehicle.value,
      "ownerOfProperty": ownerOfProperty.value,
      "ableApproveForm": ableApproveForm.value,
      "propertyInsured": propertyInsured.value,
      "utilitiesUptoDate": utilitiesUptoDate.value,
      "aboutSwap": swapAboutController.text,
      "departureArrival": departureArrival.value,
      "datesOfTravel": dateTravelController.value.text,
      "startDestination": destinationStartController.value.text,
      "startState": stateStartController.value.text,
      "travelStartCounty": countyStartController.value.text,
      "travelStartCountry": countryStartController.value.text,
      "endDestination": destinationEndController.value.text,
      "endState": stateEndController.value.text,
      "endCounty": countyEndController.value.text,
      "endCountry": countryEndController.value.text,
      "purposeOfTravel": purposeTravel.value,
      "religion": religionController.value.text,
    };

    var response = await apiClient.post(
      context: context,
      body: body,
      url: ApiUrl.createPlan.addBaseUrl,
    );

    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      AppRouter.route.pushNamed(RoutePath.navBar, extra: 0);
    } else if (response.statusCode == 402) {
      toastMessage(message: response.body["message"]);
    } else {
     // toastMessage(message: response.body["message"]);

      checkApi(response: response, context: context);
    }

    signUpLoading.value = false;
    signUpLoading.refresh();
  }

  /// ======================= TopProduct List =========================>


  var packageLoading = Status.loading.obs;
  TopProductLoadingMethod(Status status) => packageLoading.value = status;

  var userId;
  ApiClient apiClient = ApiClient();
  Rx<PackageModel> packageModel = PackageModel().obs;
  getPackage({BuildContext? context}) async {
    packageLoading(Status.loading);
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(AppConstants.userId)??"";
    var response = await apiClient.get(
        url: '${ApiUrl.subscriptionAll.addBaseUrl}?userId=$userId', showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
     // packageList.value = List<Subscription>.from(response.body["subscriptions"].map((x) => Subscription.fromJson(x)));
      packageModel.value = PackageModel.fromJson(response.body);
      packageLoading(Status.completed);
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        packageLoading(Status.internetError);
      } else if (response.statusCode == 404) {
        packageLoading(Status.noDataFound);
      } else {
        packageLoading(Status.error);
      }
    }
  }

  ///<=============================== get profile ================================>
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<PackageDetailsModel> packageDetailsModel = PackageDetailsModel().obs;

  Future<void> getPackageDetails(
      {BuildContext? context, required String id}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response = await apiClient.get(
        url: '${ApiUrl.subscriptionDetails.addBaseUrl}/$id', showResult: true);

    if (response.statusCode == 200) {
      packageDetailsModel.value = PackageDetailsModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
      update();
    } else {
      checkApi(response: response, context: context);
      if (response.statusCode == 503) {
        setRxRequestStatus(Status.internetError);
      } else if (response.statusCode == 404) {
        setRxRequestStatus(Status.noDataFound);
      } else {
        setRxRequestStatus(Status.error);
      }
    }
  }

  @override
  void onInit() {
    getPackage();
    super.onInit();
  }
}

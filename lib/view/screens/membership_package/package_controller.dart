import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  ///<========================== question ===========================>
  RxBool signUpLoading = false.obs;
  question(
      {required BuildContext context,
      required String plan_id,
      required int amount,
      required String planStartDate,
      required String planEndDate,
      required String payment_status,
      required String plan_type,
      required String haveChildren,
      required String havePets,
      required String haveVehicle,
      required String willingVehicle,
      required String ownerOfProperty,
      required String ableApproveForm,
      required String propertyInsured,
      required String utilitiesUptoDate,
      required String aboutSwap,
      required String departureArrival,
      required String purposeOfTravel,

      }) async {
    signUpLoading.value = true;
    Map<String, dynamic> body = {
      "plan_id": plan_id,
      "amount": amount,
      "planStartDate": planStartDate,
      "planEndDate": planEndDate,
      "payment_status": payment_status,
      "plan_type": plan_type,
      "name": nameController.value.text,
      "date_of_birth": destinationStartController.value.text,
      "place_of_birth": placeBirthController.value.text,
      "license_number": licenseNoController.value.text,
      "passport_number": passwordController.value.text,
      "email": emailController.value.text,
      "phone_number": phnNumberController.value.text,
      "profession": professionController.value.text,
      // "region": regionController.value.text,
      "haveChildren": haveChildren,
      "havePets": havePets,
      "haveVehicle": haveVehicle,
      "willingVehicle": willingVehicle,
      "ownerOfProperty": ownerOfProperty,
      "ableApproveForm": ableApproveForm,
      "propertyInsured": propertyInsured,
      "utilitiesUptoDate": utilitiesUptoDate,
      "aboutSwap": aboutSwap,
      "departureArrival": departureArrival,
      "datesOfTravel": dateTravelController.value.text,
      "startDestination": destinationStartController.value.text,
      "startState": stateStartController.value.text,
      "travelStartCounty": countyStartController.value.text,
      "travelStartCountry": countryStartController.value.text,
      "endDestination": destinationEndController.value.text,
      "endState": stateEndController.value.text,
      "endCounty": countyEndController.value.text,
      "endCountry": countryEndController.value.text,
      "purposeOfTravel": purposeOfTravel,
      "religion": religionController.value.text,
    };

    var response = await apiClient.patch(
      context: context,
      body: body,
      url: ApiUrl.createPlan.addBaseUrl,
    );

    if (response.statusCode == 200) {
      AppRouter.route.pushNamed(RoutePath.homeScreen);
    } else if (response.statusCode == 402) {
      toastMessage(message: response.body["message"]);
    } else {
      // ignore: use_build_context_synchronously
      checkApi(response: response, context: context);
    }

    signUpLoading.value = false;
    signUpLoading.refresh();
  }

  /// ======================= TopProduct List =========================>

  RxInt size = 0.obs;
  var packageLoading = Status.loading.obs;
  TopProductLoadingMethod(Status status) => packageLoading.value = status;

  ApiClient apiClient = ApiClient();
  RxList<Datum> packageList = <Datum>[].obs;
  getPackage({BuildContext? context}) async {
    packageLoading(Status.loading);

    var response = await apiClient.get(
        url: ApiUrl.subscriptionAll.addBaseUrl, showResult: true);

    if (response.statusCode == 200) {
      // topProductList.value = TopProductDatum.fromJson(response.body["data"]);
      packageList.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));
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

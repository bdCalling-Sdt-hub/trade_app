import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
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
  final TextEditingController destinationStartController =
      TextEditingController();
  final TextEditingController stateStartController = TextEditingController();
  final TextEditingController countryStartController = TextEditingController();
  final TextEditingController destinationEndController =
      TextEditingController();
  final TextEditingController stateEndController = TextEditingController();
  final TextEditingController countryEndController = TextEditingController();
  final TextEditingController dateTravelController = TextEditingController();

  /// ======================= TopProduct List =========================>

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

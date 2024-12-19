import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/service/check_api.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/screens/my_membership_screen/membership_details_model/membership_details_model.dart';
import 'package:trade_app/view/screens/my_membership_screen/membership_profile_model/membership_profile_model.dart';
import 'package:trade_app/view/screens/my_membership_screen/points_earn_screen/points_earn_model.dart';

class MembershipController extends GetxController {

  var currentPoints = 0.obs;

  // Membership thresholds
  final goldThreshold = 25000;
  final platinumThreshold = 10000;
  final diamondThreshold = 2000;

  // Function to update points dynamically
  void updatePoints(int points) {
    currentPoints.value = points;
  }

  // // Function to determine membership type based on points
  // String get membershipStatus {
  //   if (currentPoints.value < goldThreshold) {
  //     return 'Gold';
  //   } else if (currentPoints.value < platinumThreshold) {
  //     return 'Platinum';
  //   } else if (currentPoints.value <= diamondThreshold) {
  //     return 'Diamond';
  //   } else {
  //     return 'Diamond';
  //   }
  // }

  RxBool isLoader = false.obs;
  var sliderValue = 100.0.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  var singleSliderValue = 20000.0.obs;

  void updateSingleSliderValue(double value) {
    singleSliderValue.value = value;
  }

  final List<String> userList = [
    AppStrings.gold,
    AppStrings.platinum,
    AppStrings.diamond,
  ];
  RxInt selectedIndex=0.obs;

  final List<String> membershipItem = [
    'Can exchange products',
    'Earn 25 points for each swap',
    '10 points for positive comments'
  ];


  final List<Map<String, String>> pointsData = [
    {'action': 'By swapping', 'date': '12/03/24', 'points': '+500 Points'},
    {
      'action': 'By positive comments',
      'date': '11/03/24',
      'points': '+100 Points'
    },
    {'action': 'By swapping', 'date': '10/03/24', 'points': '+800 Points'},
    {'action': 'By swapping', 'date': '09/03/24', 'points': '+500 Points'},
    {
      'action': 'By positive comments',
      'date': '08/03/24',
      'points': '+600 Points'
    },
    {'action': 'By swapping', 'date': '07/03/24', 'points': '+700 Points'},
    {'action': 'Daily Checkin', 'date': '06/03/24', 'points': '+1200 Points'},
    {
      'action': 'By positive comments',
      'date': '05/03/24',
      'points': '+600 Points'
    },
  ];

  ///<=============================== get profile ================================>
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<MemberShipProfileModel> memberShipProfileModel = MemberShipProfileModel().obs;

  ApiClient apiClient = ApiClient();
  Future<void> getMemberShipProfile({BuildContext? context, required String userId}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response =
    await apiClient.get(url: '${ApiUrl.planProfile.addBaseUrl}/$userId', showResult: true);

    if (response.statusCode == 200) {
      memberShipProfileModel.value = MemberShipProfileModel.fromJson(response.body);
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

  ///<=============================== get points earn ================================>

  Rx<PointsEarnModel> pointsEarnModel = PointsEarnModel().obs;

  Future<void> getPointsEarn({BuildContext? context, required String userId}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response =
    await apiClient.get(url: '${ApiUrl.allPoints.addBaseUrl}/$userId', showResult: true);

    if (response.statusCode == 200) {
      pointsEarnModel.value = PointsEarnModel.fromJson(response.body);
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

  ///<=============================== get profile ================================>


  Rx<MemberShipDetailsModel> memberShipDetailsModel = MemberShipDetailsModel().obs;

  Future<void> getMemberShipDetails({BuildContext? context, required String planType}) async {
    setRxRequestStatus(Status.loading);
    refresh();

    var response =
    await apiClient.get(url: '${ApiUrl.swapHist.addBaseUrl}?planType=$planType', showResult: true);

    if (response.statusCode == 200) {
      memberShipDetailsModel.value = MemberShipDetailsModel.fromJson(response.body);
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

}

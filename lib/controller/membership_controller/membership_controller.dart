import 'package:get/get.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';

class MembershipController extends GetxController {

  RxBool isLoader = false.obs;
  var sliderValue = 50.0.obs;

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
}

import 'package:get/get.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';

class MembershipController extends GetxController {

  RxBool isLoader = false.obs;
  var sliderValue = 25000.0.obs;

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
}

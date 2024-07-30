import 'package:get/get.dart';

class MembershipController extends GetxController {
  var sliderValue = 25000.0.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }


  final List<String> membershipItem = [
    'Can exchange products',
    'Earn 25 points for each swap',
    '10 points for positive comments'
  ];
}

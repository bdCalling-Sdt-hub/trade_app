
import 'package:get/get.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/controller/post_controller/post_controller.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/controller/search_controller/search_controller.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';
import 'package:trade_app/view/screens/my_membership_screen/payment_controller/payment_controller.dart';
import 'package:trade_app/view/screens/notification_screen/notification_controller.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_condition_controller.dart';



class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///<========================== User section ==============================>
   Get.lazyPut(() => MessageController(), fenix: true);
   Get.lazyPut(() => AuthController(), fenix: true);
   Get.lazyPut(() => ProfileController(), fenix: true);
   Get.lazyPut(() => HomeController(), fenix: true);
   Get.lazyPut(() => PackageController(), fenix: true);
   Get.lazyPut(() => MembershipController(), fenix: true);
   Get.lazyPut(() => CategoryController(), fenix: true);
   Get.lazyPut(() => SearchListController(), fenix: true);
   Get.lazyPut(() => PostController(), fenix: true);
   Get.lazyPut(() => SwapRequestController(), fenix: true);
   Get.lazyPut(() => TermsConditionController(), fenix: true);
   Get.lazyPut(() => PaymentController(), fenix: true);
   Get.lazyPut(() => NotificationController(), fenix: true);
  }
}


import 'package:get/get.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/controller/search_controller/search_controller.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';



class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => MessageController(), fenix: true);
   Get.lazyPut(() => AuthController(), fenix: true);
   Get.lazyPut(() => ProfileController(), fenix: true);
   Get.lazyPut(() => HomeController(), fenix: true);
   Get.lazyPut(() => PackageController(), fenix: true);
   Get.lazyPut(() => MembershipController(), fenix: true);
   Get.lazyPut(() => CategoryController(), fenix: true);
   Get.lazyPut(() => SearchListController(), fenix: true);
  }
}

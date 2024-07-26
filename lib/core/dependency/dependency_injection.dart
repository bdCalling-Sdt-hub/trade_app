
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';
import 'package:trade_app/view/screens/message_screen/MessgaeController/message_controller.dart';



class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => MessageController(), fenix: true);
   Get.lazyPut(() => AuthController(), fenix: true);
   Get.lazyPut(() => ProfileController(), fenix: true);




  }
}

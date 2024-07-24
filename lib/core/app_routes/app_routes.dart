import 'package:get/get.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';

class AppRoutes {
  static const String signInScreen = "/SignInScreen";
  static const String messageScreen = "/MessageScreen";

  static List<GetPage> routes = [
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: messageScreen, page: () =>  MessageScreen()),
  ];
}

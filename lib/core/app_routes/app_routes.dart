import 'package:get/get.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/setting_screen/setting_screen.dart';

class AppRoutes {
  static const String signInScreen = "/SignInScreen";
  static const String messageScreen = "/MessageScreen";
  static const String homeScreen = "/HomeScreen";
  ///===================Profile section===============
  static const String settingScreen = "/SettingScreen";

  static List<GetPage> routes = [
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: messageScreen, page: () =>  MessageScreen()),
    GetPage(name: homeScreen, page: () =>  const HomeScreen()),

    ///========================Setting section==============
    GetPage(name: settingScreen, page: () =>  const SettingScreen()),
  ];
}

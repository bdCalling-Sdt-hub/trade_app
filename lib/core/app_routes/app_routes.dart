import 'package:get/get.dart';
import 'package:trade_app/view/screens/account_info_screen/account_info_screen.dart';
import 'package:trade_app/view/screens/address_screen/address_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/change_language_screen/change_language_screen.dart';
import 'package:trade_app/view/screens/change_password_screen/change_password_screen.dart';
import 'package:trade_app/view/screens/help_center_screen/help_center_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:trade_app/view/screens/setting_screen/setting_screen.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_screen.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_and_condition_screen.dart';

class AppRoutes {
  static const String signInScreen = "/SignInScreen";
  static const String messageScreen = "/MessageScreen";
  static const String homeScreen = "/HomeScreen";
  ///===================Profile section===============
  static const String settingScreen = "/SettingScreen";
  static const String termsAndConditionScreen = "/TermsAndConditionScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String accountInfoScreen = "/AccountInfoScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String changeLanguageScreen = "/ChangeLanguageScreen";
  static const String addressScreen = "/AddressScreen";
  static const String helpCenterScreen = "/HelpCenterScreen";
  static const String swapRequestScreen = "/SwapRequestScreen";

  static List<GetPage> routes = [
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: messageScreen, page: () =>  MessageScreen()),
    GetPage(name: homeScreen, page: () =>  const HomeScreen()),

    ///========================Setting section==============
    GetPage(name: settingScreen, page: () =>  const SettingScreen()),
    GetPage(name: termsAndConditionScreen, page: () =>  const TermsAndConditionScreen()),
    GetPage(name: privacyPolicyScreen, page: () =>  const PrivacyPolicyScreen()),
    GetPage(name: accountInfoScreen, page: () =>   AccountInfoScreen()),
    GetPage(name: changePasswordScreen, page: () =>   ChangePasswordScreen()),
    GetPage(name: changeLanguageScreen, page: () =>   const ChangeLanguageScreen()),
    GetPage(name: addressScreen, page: () =>    AddressScreen()),
    GetPage(name: helpCenterScreen, page: () =>    const HelpCenterScreen()),
    GetPage(name: swapRequestScreen, page: () =>    const SwapRequestScreen()),
  ];
}

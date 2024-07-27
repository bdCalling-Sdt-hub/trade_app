import 'package:get/get.dart';
import 'package:trade_app/view/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:trade_app/view/screens/authentication/otp/otp_screen.dart';
import 'package:trade_app/view/screens/authentication/reset_password/reset_password_screen.dart';
import 'package:trade_app/view/screens/account_info_screen/account_info_screen.dart';
import 'package:trade_app/view/screens/address_screen/address_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up_otp/sign_up_otp.dart';
import 'package:trade_app/view/screens/post_screen/post_add_screen/post_add_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_edit_screen/post_edit_screen.dart';
import 'package:trade_app/view/screens/splash/splash_screen.dart';
import 'package:trade_app/view/screens/change_language_screen/change_language_screen.dart';
import 'package:trade_app/view/screens/change_password_screen/change_password_screen.dart';
import 'package:trade_app/view/screens/help_center_screen/help_center_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/my_membership_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_product_details_screen/my_product_details_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_products_screen.dart';
import 'package:trade_app/view/screens/my_rating_screen/my_rating_screen.dart';
import 'package:trade_app/view/screens/points_earn_screen/points_earn_screen.dart';
import 'package:trade_app/view/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:trade_app/view/screens/setting_screen/setting_screen.dart';
import 'package:trade_app/view/screens/swap_history_screen/swap_history_screen.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_screen.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_and_condition_screen.dart';

class AppRoutes {
  static const String signInScreen = "/SignInScreen";
  static const String messageScreen = "/MessageScreen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpOtp = "/sign_up_otp";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String otpScreen = "/otp_screen";
  static const String resetPasswordScreen = "/reset_password_screen";
  static const String splashScreen = "/splash_screen";
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
  static const String swapHistoryScreen = "/SwapHistoryScreen";
  static const String myProductsScreen = "/MyProductsScreen";
  static const String myProductDetailsScreen = "/MyProductDetailsScreen";
  static const String myMembershipScreen = "/MyMembershipScreen";
  static const String pointsEarnedScreen = "/PointsEarnedScreen";
  static const String myRatingScreen = "/MyRatingScreen";

  ///=============================Post Edit Screen============
  static const String postAddScreen = "/PostAddScreen";
  static const String postEditScreen = "/PostEditScreen";

  static List<GetPage> routes = [
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: signUpOtp, page: () =>  SignUpOtp()),
    GetPage(name: forgotPasswordScreen, page: () =>  ForgotPasswordScreen()),
    GetPage(name: otpScreen, page: () =>  OtpScreen()),
    GetPage(name: resetPasswordScreen, page: () =>  ResetPasswordScreen()),
    GetPage(name: splashScreen, page: () =>  SplashScreen()),
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
    GetPage(name: swapHistoryScreen, page: () =>    const SwapHistoryScreen()),
    GetPage(name: myProductsScreen, page: () =>    const MyProductsScreen()),
    GetPage(name: myProductDetailsScreen, page: () =>    const MyProductDetailsScreen()),
    GetPage(name: myMembershipScreen, page: () =>     MyMembershipScreen()),
    GetPage(name: pointsEarnedScreen, page: () =>    const PointsEarnedScreen()),
    GetPage(name: myRatingScreen, page: () =>     MyRatingScreen()),

    ///============================Post Edit Screen=================
    GetPage(name: postAddScreen, page: () =>     const PostAddScreen()),
    GetPage(name: postEditScreen, page: () =>     const PostEditScreen()),
  ];
}

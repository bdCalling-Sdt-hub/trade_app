import 'package:get/get.dart';
import 'package:trade_app/view/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up_otp/sign_up_otp.dart';

class AppRoutes {
  static const String signInScreen = "/SignInScreen";
  static const String messageScreen = "/MessageScreen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpOtp = "/sign_up_otp";
  static const String forgotPasswordScreen = "/forgot_password_screen";

  static List<GetPage> routes = [
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: signUpOtp, page: () =>  SignUpOtp()),
    GetPage(name: forgotPasswordScreen, page: () =>  ForgotPasswordScreen()),
  ];
}

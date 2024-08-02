import 'package:get/get.dart';
import 'package:trade_app/view/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:trade_app/view/screens/authentication/otp/otp_screen.dart';
import 'package:trade_app/view/screens/authentication/reset_password/reset_password_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up_otp/sign_up_otp.dart';
import 'package:trade_app/view/screens/category_screen/category_screen.dart';
import 'package:trade_app/view/screens/category_screen/sub_category_products/sub_category_products.dart';
import 'package:trade_app/view/screens/category_screen/sub_category_screen/sub_category_screen.dart';
import 'package:trade_app/view/screens/just_for_you/just_for_you.dart';
import 'package:trade_app/view/screens/membership_package/membership_package_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/membership_details_screen/membership_details_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/points_earn_screen/points_earn_screen.dart';
import 'package:trade_app/view/screens/notification_screen/notification_screen.dart';
import 'package:trade_app/view/screens/other_profile/other_profile.dart';
import 'package:trade_app/view/screens/package_details/package_details_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_add_screen/post_add_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_edit_screen/post_edit_screen.dart';
import 'package:trade_app/view/screens/product_details/product_details_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question/pre_approval_question_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question2/pre_approval_question2_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question3/pre_approval_question3_screen.dart';
import 'package:trade_app/view/screens/search_screen/search_screen.dart';
import 'package:trade_app/view/screens/setting_screen/account_info_screen/account_info_screen.dart';
import 'package:trade_app/view/screens/setting_screen/address_screen/address_screen.dart';
import 'package:trade_app/view/screens/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:trade_app/view/screens/setting_screen/help_center_screen/help_center_screen.dart';
import 'package:trade_app/view/screens/setting_screen/language_screen/language_screen.dart';
import 'package:trade_app/view/screens/splash/splash_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/my_membership_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_product_details_screen/my_product_details_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_products_screen.dart';
import 'package:trade_app/view/screens/my_rating_screen/my_rating_screen.dart';
import 'package:trade_app/view/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:trade_app/view/screens/setting_screen/setting_screen.dart';
import 'package:trade_app/view/screens/swap_history_screen/swap_history_screen.dart';
import 'package:trade_app/view/screens/swap_product/swap_product_screen.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_screen.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:trade_app/view/screens/top_products/top_products_screen.dart';

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
  static const String addressScreen = "/AddressScreen";
  static const String helpCenterScreen = "/HelpCenterScreen";
  static const String swapRequestScreen = "/SwapRequestScreen";
  static const String swapHistoryScreen = "/SwapHistoryScreen";
  static const String myProductsScreen = "/MyProductsScreen";
  static const String myProductDetailsScreen = "/MyProductDetailsScreen";
  static const String myMembershipScreen = "/MyMembershipScreen";
  static const String pointsEarnedScreen = "/PointsEarnedScreen";
  static const String myRatingScreen = "/MyRatingScreen";
  static const String categoryScreen = "/CategoryScreen";
  static const String notificationScreen = "/NotificationScreen";
  static const String otherProfile = "/OtherProfile";
  static const String membershipDetailsScreen = "/MembershipDetailsScreen";
  static const String searchScreen = "/SearchScreen";
  static const String subCategoryScreen = "/SubCategoryScreen";

  ///=============================Post Edit Screen============
  static const String postAddScreen = "/PostAddScreen";
  static const String postEditScreen = "/PostEditScreen";
  static const String membershipPackageScreen = "/membership_package_screen";
  static const String packageDetailsScreen = "/package_details_screen";
  static const String preApprovalQuestionScreen = "/pre_approval_question_screen";
  static const String preApprovalQuestion2Screen = "/pre_approval_question2_screen";
  static const String preApprovalQuestion3Screen = "/pre_approval_question3_screen";
  static const String languageScreen = "/LanguageScreen";
  static const String productDetailsScreen = "/product_details_screen";
  static const String swapProductScreen = "/swap_product_screen";
  static const String topProductsScreen = "/top_products_screen";
  static const String justForYou = "/just_for_you";
  static const String subCategoryProducts = "/SubCategoryProducts";

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
    GetPage(name: settingScreen, page: () =>   const SettingScreen()),
    GetPage(name: termsAndConditionScreen, page: () =>  const TermsAndConditionScreen()),
    GetPage(name: privacyPolicyScreen, page: () =>  const PrivacyPolicyScreen()),
    GetPage(name: accountInfoScreen, page: () =>   AccountInfoScreen()),
    GetPage(name: changePasswordScreen, page: () =>   ChangePasswordScreen()),
    GetPage(name: addressScreen, page: () =>    AddressScreen()),
    GetPage(name: helpCenterScreen, page: () =>     HelpCenterScreen()),
    GetPage(name: swapRequestScreen, page: () =>    const SwapRequestScreen()),
    GetPage(name: swapHistoryScreen, page: () =>    const SwapHistoryScreen()),
    GetPage(name: myProductsScreen, page: () =>  MyProductsScreen()),
    GetPage(name: myProductDetailsScreen, page: () =>    const MyProductDetailsScreen()),
    GetPage(name: myMembershipScreen, page: () =>     MyMembershipScreen()),
    GetPage(name: pointsEarnedScreen, page: () =>     PointsEarnedScreen()),
    GetPage(name: myRatingScreen, page: () =>     MyRatingScreen()),
    GetPage(name: membershipDetailsScreen, page: () =>      MembershipDetailsScreen()),

    ///============================Post Edit Screen=================
    GetPage(name: postAddScreen, page: () =>      PostAddScreen()),
    GetPage(name: postEditScreen, page: () =>      PostEditScreen()),
    GetPage(name: packageDetailsScreen, page: () =>  PackageDetailsScreen()),
    GetPage(name: membershipPackageScreen, page: () =>   MembershipPackageScreen()),
    GetPage(name: preApprovalQuestionScreen, page: () =>   PreApprovalQuestionScreen()),
    GetPage(name: preApprovalQuestion2Screen, page: () =>   const PreApprovalQuestion2Screen()),
    GetPage(name: preApprovalQuestion3Screen, page: () =>   PreApprovalQuestion3Screen()),
    GetPage(name: languageScreen, page: () =>   LanguageScreen()),
    GetPage(name: categoryScreen, page: () =>    CategoryScreen()),
    GetPage(name: notificationScreen, page: () =>   const NotificationScreen()),
    GetPage(name: otherProfile, page: () =>   const OtherProfile()),
    GetPage(name: productDetailsScreen, page: () =>  ProductDetailsScreen()),
    GetPage(name: swapProductScreen, page: () =>   SwapProductScreen()),
    GetPage(name: topProductsScreen, page: () =>  const TopProductsScreen()),
    GetPage(name: justForYou, page: () =>  const JustForYou()),
    GetPage(name: searchScreen, page: () =>   SearchScreen()),
    GetPage(name: subCategoryScreen, page: () =>   SubCategoryScreen()),
    GetPage(name: subCategoryProducts, page: () =>   const SubCategoryProducts()),
  ];
}

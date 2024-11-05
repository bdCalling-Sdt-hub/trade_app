import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/view/components/error_screen/error_screen.dart';
import 'package:trade_app/view/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:trade_app/view/screens/authentication/otp/otp_screen.dart';
import 'package:trade_app/view/screens/authentication/reset_password/reset_password_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_up_otp/sign_up_otp.dart';
import 'package:trade_app/view/screens/category_screen/category_screen.dart';
import 'package:trade_app/view/screens/category_screen/sub_category_products/sub_category_products.dart';
import 'package:trade_app/view/screens/category_screen/sub_category_screen/sub_category_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/just_for_you/just_for_you.dart';
import 'package:trade_app/view/screens/membership_package/membership_package_screen.dart';
import 'package:trade_app/view/screens/message_screen/chat_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/membership_details_screen/membership_details_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/my_membership_screen.dart';
import 'package:trade_app/view/screens/my_membership_screen/points_earn_screen/points_earn_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_product_details_screen/my_product_details_screen.dart';
import 'package:trade_app/view/screens/my_products_screen/my_products_screen.dart';
import 'package:trade_app/view/screens/my_rating_screen/my_rating_screen.dart';
import 'package:trade_app/view/screens/notification_screen/notification_screen.dart';
import 'package:trade_app/view/screens/other_profile/other_profile.dart';
import 'package:trade_app/view/screens/package_details/package_details_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_add_screen/post_add_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_edit_screen/post_edit_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_screen.dart';
import 'package:trade_app/view/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:trade_app/view/screens/product_details/product_details_screen.dart';
import 'package:trade_app/view/screens/profile_screen/profile_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question/pre_approval_question_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question2/pre_approval_question2_screen.dart';
import 'package:trade_app/view/screens/questions/pre_approval_question3/pre_approval_question3_screen.dart';
import 'package:trade_app/view/screens/search_screen/search_screen.dart';
import 'package:trade_app/view/screens/setting_screen/account_info_screen/account_info_screen.dart';
import 'package:trade_app/view/screens/setting_screen/address_screen/address_screen.dart';
import 'package:trade_app/view/screens/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:trade_app/view/screens/setting_screen/help_center_screen/help_center_screen.dart';
import 'package:trade_app/view/screens/setting_screen/setting_screen.dart';
import 'package:trade_app/view/screens/splash/splash_screen.dart';
import 'package:trade_app/view/screens/swap_history_screen/swap_history_screen.dart';
import 'package:trade_app/view/screens/swap_product/swap_product_screen.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_screen.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:trade_app/view/screens/top_products/top_products_screen.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      initialLocation: RoutePath.splashScreen.addBasePath,
      // navigatorKey: Get.key,
      debugLogDiagnostics: true,
      routes: [
        ///======================= splash Route =======================
        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          builder: (context, state) => const SplashScreen(),
          redirect: (context, state) {
            Future.delayed(const Duration(seconds: 1), () {
              AppRouter.route.replaceNamed(RoutePath.signInScreen);
            });
            return null;
          },
        ),

        ///======================= erroe Route =======================
        GoRoute(
          name: RoutePath.errorScreen,
          path: RoutePath.errorScreen.addBasePath,
          builder: (context, state) => const ErrorPage(),
        ),

        ///======================= erroe Route =======================
        GoRoute(
          name: RoutePath.productDetailsScreen,
          path: RoutePath.productDetailsScreen.addBasePath,
          builder: (context, state) {
            final productId = state.uri.queryParameters["productId"] ?? "";
            return ProductDetailsScreen(
              productId: productId,

            );
          },
        ),

        ///======================= signInScreen Route =======================
        GoRoute(
          name: RoutePath.signInScreen,
          path: RoutePath.signInScreen.addBasePath,
          builder: (context, state) => SignInScreen(),
        ),

        ///======================= messageScreen Route =======================
        GoRoute(
          name: RoutePath.messageScreen,
          path: RoutePath.messageScreen.addBasePath,
          builder: (context, state) => MessageScreen(),
        ),

        ///======================= signUpScreen Route =======================
        GoRoute(
          name: RoutePath.signUpScreen,
          path: RoutePath.signUpScreen.addBasePath,
          builder: (context, state) => SignUpScreen(),
        ),

        ///======================= signUpOtp Route =======================
        GoRoute(
          name: RoutePath.signUpOtp,
          path: RoutePath.signUpOtp.addBasePath,
          builder: (context, state) => SignUpOtp(),
        ),

        ///======================= forgotPasswordScreen Route =======================
        GoRoute(
          name: RoutePath.forgotPasswordScreen,
          path: RoutePath.forgotPasswordScreen.addBasePath,
          builder: (context, state) => ForgotPasswordScreen(),
        ),

        ///======================= otpScreen Route =======================
        GoRoute(
          name: RoutePath.otpScreen,
          path: RoutePath.otpScreen.addBasePath,
          builder: (context, state) => OtpScreen(),
        ),

        ///======================= resetPasswordScreen Route =======================
        GoRoute(
          name: RoutePath.resetPasswordScreen,
          path: RoutePath.resetPasswordScreen.addBasePath,
          builder: (context, state) => ResetPasswordScreen(),
        ),

        ///======================= homeScreen Route =======================
        GoRoute(
          name: RoutePath.homeScreen,
          path: RoutePath.homeScreen.addBasePath,
          builder: (context, state) => HomeScreen(),
        ),

        ///======================= settingScreen Route =======================
        GoRoute(
          name: RoutePath.settingScreen,
          path: RoutePath.settingScreen.addBasePath,
          builder: (context, state) => SettingScreen(),
        ),

        ///======================= termsAndConditionScreen Route =======================
        GoRoute(
          name: RoutePath.termsAndConditionScreen,
          path: RoutePath.termsAndConditionScreen.addBasePath,
          builder: (context, state) => TermsAndConditionScreen(),
        ),

        ///======================= privacyPolicyScreen Route =======================
        GoRoute(
          name: RoutePath.privacyPolicyScreen,
          path: RoutePath.privacyPolicyScreen.addBasePath,
          builder: (context, state) => PrivacyPolicyScreen(),
        ),

        ///======================= accountInfoScreen Route =======================
        GoRoute(
          name: RoutePath.accountInfoScreen,
          path: RoutePath.accountInfoScreen.addBasePath,
          builder: (context, state) => AccountInfoScreen(),
        ),

        ///======================= changePasswordScreen Route =======================
        GoRoute(
          name: RoutePath.changePasswordScreen,
          path: RoutePath.changePasswordScreen.addBasePath,
          builder: (context, state) => ChangePasswordScreen(),
        ),

        ///======================= addressScreen Route =======================
        GoRoute(
          name: RoutePath.addressScreen,
          path: RoutePath.addressScreen.addBasePath,
          builder: (context, state) => AddressScreen(),
        ),

        ///======================= helpCenterScreen Route =======================
        GoRoute(
          name: RoutePath.helpCenterScreen,
          path: RoutePath.helpCenterScreen.addBasePath,
          builder: (context, state) => HelpCenterScreen(),
        ),

        ///======================= swapRequestScreen Route =======================
        GoRoute(
          name: RoutePath.swapRequestScreen,
          path: RoutePath.swapRequestScreen.addBasePath,
          builder: (context, state) => SwapRequestScreen(),
        ),

        ///======================= swapHistoryScreen Route =======================
        GoRoute(
          name: RoutePath.swapHistoryScreen,
          path: RoutePath.swapHistoryScreen.addBasePath,
          builder: (context, state) => SwapHistoryScreen(),
        ),

        ///======================= myProductsScreen Route =======================
        GoRoute(
          name: RoutePath.myProductsScreen,
          path: RoutePath.myProductsScreen.addBasePath,
          builder: (context, state) => MyProductsScreen(),
        ),

        ///======================= myProductDetailsScreen Route =======================
        GoRoute(
            name: RoutePath.myProductDetailsScreen,
            path: RoutePath.myProductDetailsScreen.addBasePath,
            builder: (context, state) {
              final image = state.uri.queryParameters["image"] ?? "";
              final title = state.uri.queryParameters["title"] ?? "";
              final productValue = state.uri.queryParameters["productValue"] ?? "";
              final condition = state.uri.queryParameters["condition"] ?? "";
              final description = state.uri.queryParameters["description"] ?? "";
              final catName = state.uri.queryParameters["cateName"] ?? "";
              final cateId = state.uri.queryParameters["cateId"] ?? "";
              final productId = state.uri.queryParameters["productId"] ?? "";
              final userId = state.uri.queryParameters["userId"] ?? "";

              return MyProductDetailsScreen(
                image: image,
                title: title,
                productValue: int.parse(productValue), // Convert to int
                condition: condition,
                description: description, catName: catName,catId: cateId,productId: productId, userId: userId,
              );
            }),

        ///======================= myMembershipScreen Route =======================
        GoRoute(
          name: RoutePath.myMembershipScreen,
          path: RoutePath.myMembershipScreen.addBasePath,
          builder: (context, state) => MyMembershipScreen(),
        ),

        ///======================= pointsEarnedScreen Route =======================
        GoRoute(
          name: RoutePath.pointsEarnedScreen,
          path: RoutePath.pointsEarnedScreen.addBasePath,
          builder: (context, state) => PointsEarnedScreen(),
        ),

        ///======================= myRatingScreen Route =======================
        GoRoute(
          name: RoutePath.myRatingScreen,
          path: RoutePath.myRatingScreen.addBasePath,
          builder: (context, state) => MyRatingScreen(),
        ),

        ///======================= categoryScreen Route =======================
        GoRoute(
          name: RoutePath.categoryScreen,
          path: RoutePath.categoryScreen.addBasePath,
          builder: (context, state) => CategoryScreen(),
        ),

        ///======================= notificationScreen Route =======================
        GoRoute(
          name: RoutePath.notificationScreen,
          path: RoutePath.notificationScreen.addBasePath,
          builder: (context, state) => NotificationScreen(),
        ),

        ///======================= otherProfile Route =======================
        GoRoute(
          name: RoutePath.otherProfile,
          path: RoutePath.otherProfile.addBasePath,
          builder: (context, state) => OtherProfile(),
        ),

        ///======================= membershipDetailsScreen Route =======================
        GoRoute(
          name: RoutePath.membershipDetailsScreen,
          path: RoutePath.membershipDetailsScreen.addBasePath,
          builder: (context, state) => MembershipDetailsScreen(),
        ),

        ///======================= searchScreen Route =======================
        GoRoute(
          name: RoutePath.searchScreen,
          path: RoutePath.searchScreen.addBasePath,
          builder: (context, state) => SearchScreen(),
        ),

        ///======================= subCategoryScreen Route =======================
        GoRoute(
          name: RoutePath.subCategoryScreen,
          path: RoutePath.subCategoryScreen.addBasePath,
          builder: (context, state) => SubCategoryScreen(
            cateName: state.extra as String,
          ),
        ),

        ///======================= postAddScreen Route =======================
        GoRoute(
          name: RoutePath.postAddScreen,
          path: RoutePath.postAddScreen.addBasePath,
          builder: (context, state) {
            final cateId = state.uri.queryParameters["cateId"] ?? "";
            final cateName = state.uri.queryParameters["cateName"] ?? "";

            return PostAddScreen(
              catId: cateId,
              catName: cateName,
            );
          },
        ),

        ///======================= postEditScreen Route =======================
        GoRoute(
          name: RoutePath.postEditScreen,
          path: RoutePath.postEditScreen.addBasePath,
          builder: (context, state) {
            final cateId = state.uri.queryParameters["cateId"] ?? "";
            final cateName = state.uri.queryParameters["cateName"] ?? "";
            final productId = state.uri.queryParameters["productId"] ?? "";
            final userId = state.uri.queryParameters["userId"] ?? "";

            return PostEditScreen(
              catId: cateId,
              catName: cateName,
              productId: productId,
              userId: userId,
            );
          },
        ),

        ///======================= membershipPackageScreen Route =======================
        GoRoute(
          name: RoutePath.membershipPackageScreen,
          path: RoutePath.membershipPackageScreen.addBasePath,
          builder: (context, state) => MembershipPackageScreen(),
        ),

        ///======================= packageDetailsScreen Route =======================
        GoRoute(
          name: RoutePath.packageDetailsScreen,
          path: RoutePath.packageDetailsScreen.addBasePath,
          builder: (context, state) => PackageDetailsScreen(),
        ),

        ///======================= swapProductScreen Route =======================
        GoRoute(
          name: RoutePath.swapProductScreen,
          path: RoutePath.swapProductScreen.addBasePath,
          builder: (context, state) => SwapProductScreen(swapId:  state.extra as String,),
        ),

        ///======================= topProductsScreen Route =======================
        GoRoute(
          name: RoutePath.topProductsScreen,
          path: RoutePath.topProductsScreen.addBasePath,
          builder: (context, state) => TopProductsScreen(),
        ),

        ///======================= justForYou Route =======================
        GoRoute(
          name: RoutePath.justForYou,
          path: RoutePath.justForYou.addBasePath,
          builder: (context, state) => JustForYou(),
        ),

        ///======================= subCategoryProducts Route =======================
        GoRoute(
          name: RoutePath.subCategoryProducts,
          path: RoutePath.subCategoryProducts.addBasePath,
          builder: (context, state) {
            final catId = state.uri.queryParameters["catId"] ?? "";
            final subName = state.uri.queryParameters["subName"] ?? "";
            final subCatId = state.uri.queryParameters["subCatId"] ?? "";

            print("catId: $catId, subCatId: $subCatId"); // Debugging

            return SubCategoryProducts(
              catId: catId,
              subCatId: subCatId, subCatName: subName,
            );
          },
        ),

        ///======================= chatScreen Route =======================
        GoRoute(
          name: RoutePath.chatScreen,
          path: RoutePath.chatScreen.addBasePath,
          builder: (context, state) => ChatScreen(),
        ),

        ///======================= postScreen Route =======================
        GoRoute(
          name: RoutePath.postScreen,
          path: RoutePath.postScreen.addBasePath,
          builder: (context, state) => PostScreen(),
        ),

        ///======================= subCategoryProducts Route =======================
        GoRoute(
          name: RoutePath.profileScreen,
          path: RoutePath.profileScreen.addBasePath,
          builder: (context, state) => ProfileScreen(),
        ),

        GoRoute(
          name: RoutePath.preApprovalQuestionScreen,
          path: RoutePath.preApprovalQuestionScreen.addBasePath,
          builder: (context, state) => PreApprovalQuestionScreen(),
        ),
        GoRoute(
          name: RoutePath.preApprovalQuestion2Screen,
          path: RoutePath.preApprovalQuestion2Screen.addBasePath,
          builder: (context, state) => PreApprovalQuestion2Screen(),
        ),
        GoRoute(
          name: RoutePath.preApprovalQuestion3Screen,
          path: RoutePath.preApprovalQuestion3Screen.addBasePath,
          builder: (context, state) => PreApprovalQuestion3Screen(),
        ),
      ]);

  static GoRouter get route => initRoute;
}

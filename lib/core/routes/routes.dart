import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/helper/extension/base_extension.dart';
import 'package:trade_app/view/components/error_screen/error_screen.dart';
import 'package:trade_app/view/screens/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:trade_app/view/screens/message_screen/message_screen.dart';
import 'package:trade_app/view/screens/splash/splash_screen.dart';

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
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          builder: (context, state) => const ErrorPage(),
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

      ]);

  static GoRouter get route => initRoute;
}

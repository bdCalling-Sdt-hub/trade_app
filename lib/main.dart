import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/core/dependency/dependency_injection.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/service/socket_service.dart';
import 'package:trade_app/view/components/device_utils/device_utils.dart';

import 'firebase_options.dart';

@pragma("vm:entry-point")
Future<void> _firebaseMessageBackgroundHandler(RemoteMessage message) async {
  print("Background handler triggered");
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  DeviceUtils.lockDevicePortrait();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DependencyInjection di = DependencyInjection();

  di.dependencies();
  initDependencies();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessageBackgroundHandler);

  SocketApi.init();
  //SystemUtil.setStatusBarColor(color: Colors.transparent);
  Stripe.publishableKey =
      "pk_test_51Q69G2L8xn5o73J1fDJ9iprBk2h3Kjbj1zXs1Rll89x1qFFXPAtHqyZ667hyVpAIlUvIJRzzhDXmRxQ6r9tOeOlZ00mZDAdEoI";
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (context, child) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,
      ),
    );
  }
}

// <key>FirebaseMessagingAutoInitEnabled</key>
// <true/>
// <key>GIDClientID</key>
// <string>29380520069-7mbf1qdbsme8fk4kvd9v2d5311a3kmj3.apps.googleusercontent.com</string>
// <key>GIDServerClientID</key>
// <string>29380520069-oavk8pbsl0v6ogdqa8sihj0j4gp5pmlb.apps.googleusercontent.com</string>
// <key>GoogleService-Info</key>

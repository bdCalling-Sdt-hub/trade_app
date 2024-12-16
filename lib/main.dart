import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:trade_app/core/dependency/dependency_injection.dart';
import 'package:trade_app/core/routes/routes.dart';
import 'package:trade_app/dependency_injection/path.dart';
import 'package:trade_app/service/socket_service.dart';
import 'package:trade_app/view/components/device_utils/device_utils.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  DependencyInjection di = DependencyInjection();
  di.dependencies();

  SocketApi.init();
  //SystemUtil.setStatusBarColor(color: Colors.transparent);
  Stripe.publishableKey =
      "pk_test_51Q69G2L8xn5o73J1fDJ9iprBk2h3Kjbj1zXs1Rll89x1qFFXPAtHqyZ667hyVpAIlUvIJRzzhDXmRxQ6r9tOeOlZ00mZDAdEoI";

  /// ================= DB Path ===============
  var databasePath = await getApplicationDocumentsDirectory();
  Hive.init(databasePath.path);
  // ================ Open the 'users' box before using it ===============

  await Hive.openBox('users');

  initDependencies();
  runApp(
    const MyApp(), // Wrap your app
  );
  // const MyApp());
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

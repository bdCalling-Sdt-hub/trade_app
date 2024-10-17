part of "path.dart";

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // _initSplash();
  // _initLogin();

  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  /// ===================== DB =====================
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );


  ///Api client
  serviceLocator.registerFactory<ApiClient>(
    () => ApiClient(),
  );
}

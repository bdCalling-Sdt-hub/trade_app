part of "path.dart";

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // _initSplash();
  // _initLogin();

  serviceLocator.registerFactory(() => InternetConnection());
  serviceLocator.registerFactory<YoutubePlayerController>(() =>   YoutubePlayerController(initialVideoId: ''));

  // serviceLocator.registerFactory(() => GeneralController());

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

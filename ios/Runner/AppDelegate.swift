import Flutter
import UIKit
import Stripe


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
           StripeAPI.defaultPublishableKey = "pk_test_51Q69G2L8xn5o73J1fDJ9iprBk2h3Kjbj1zXs1Rll89x1qFFXPAtHqyZ667hyVpAIlUvIJRzzhDXmRxQ6r9tOeOlZ00mZDAdEoI"
           return super.application(application, didFinishLaunchingWithOptions: launchOptions)
       }
}

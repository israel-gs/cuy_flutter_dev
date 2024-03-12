import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "com.example.cuy_flutter_dev/info",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "getAppName" {
        getAppName(result: result)
      } else if call.method == "getPackageId" {
        getPackageId(result: result)
      } else if call.method == "getAppVersion" {
        getAppVersion(result: result)
      } else if call.method == "getDeviceBrand" {
        getDeviceBrand(result: result)
      } else if call.method == "getOsName" {
        getOsName(result: result)
      } else if call.method == "getOsVersion" {
        getOsVersion(result: result)
      } else if call.method == "getLanguage" {
        getLanguage(result: result)
      } else {
        result(FlutterMethodNotImplemented)
        return
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// getAppName
private func getAppName(result: FlutterResult) {
  let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
  result(appName)
}
// getPackageId
private func getPackageId(result: FlutterResult) {
  let packageId = Bundle.main.bundleIdentifier
  result(packageId)
}
// getAppVersion
private func getAppVersion(result: FlutterResult) {
  let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
  result(appVersion)
}
// getDeviceBrand
private func getDeviceBrand(result: FlutterResult) {
  let deviceBrand = "Apple"
  result(deviceBrand)
}
// getOsName
private func getOsName(result: FlutterResult) {
  let osName = "iOS"
  result(osName)
}
// getOsVersion
private func getOsVersion(result: FlutterResult) {
  let osVersion = UIDevice.current.systemVersion
  result(osVersion)
}
// getLanguage
private func getLanguage(result: FlutterResult) {
  let language = Locale.preferredLanguages[0]
  result(language)
}
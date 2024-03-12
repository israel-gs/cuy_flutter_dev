import 'dart:developer';

import 'package:flutter/services.dart';

class DeviceInfoUtil {
  static const platform = MethodChannel('com.example.cuy_flutter_dev/info');

  static Future<DeviceInfo?> getDeviceInfo() async {
    try {
      final appName = await platform.invokeMethod<String>('getAppName');
      final packageId = await platform.invokeMethod<String>('getPackageId');
      final appVersion = await platform.invokeMethod<String>('getAppVersion');
      final deviceBrand = await platform.invokeMethod<String>('getDeviceBrand');
      final osName = await platform.invokeMethod<String>('getOsName');
      final osVersion = await platform.invokeMethod<String>('getOsVersion');
      final language = await platform.invokeMethod<String>('getLanguage');

      return DeviceInfo(
        appName: appName!,
        packageId: packageId!,
        appVersion: appVersion!,
        deviceBrand: deviceBrand!,
        osName: osName!,
        osVersion: osVersion!,
        language: language!,
      );
    } on PlatformException catch (e) {
      log('Failed to get battery level: ${e.message}');
      return null;
    } catch (e) {
      log('Failed to get device info: $e');
      return null;
    }
  }
}

class DeviceInfo {
  final String appName;
  final String packageId;
  final String appVersion;
  final String deviceBrand;
  final String osName;
  final String osVersion;
  final String language;

  DeviceInfo({
    required this.appName,
    required this.packageId,
    required this.appVersion,
    required this.deviceBrand,
    required this.osName,
    required this.osVersion,
    required this.language,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      appName: json['appName'],
      packageId: json['packageId'],
      appVersion: json['appVersion'],
      deviceBrand: json['deviceBrand'],
      osName: json['osName'],
      osVersion: json['osVersion'],
      language: json['language'],
    );
  }
}

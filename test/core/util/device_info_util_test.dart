import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('com.example.cuy_flutter_dev/info');

  handler(MethodCall methodCall) async {
    if (methodCall.method == 'getAppName') {
      return "Cuy Flutter Dev";
    } else if (methodCall.method == 'getPackageId') {
      return "com.example.cuy_flutter_dev";
    } else if (methodCall.method == 'getAppVersion') {
      return "1.0.0";
    } else if (methodCall.method == 'getDeviceBrand') {
      return "Xiaomi";
    } else if (methodCall.method == 'getOsName') {
      return "Android";
    } else if (methodCall.method == 'getOsVersion') {
      return "11";
    } else if (methodCall.method == 'getLanguage') {
      return "en";
    }
    return null;
  }

  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, handler);

  test('should return app name', () async {
    final result = await channel.invokeMethod<String>('getAppName');
    expect(result, "Cuy Flutter Dev");
  });

  test('should return package id', () async {
    final result = await channel.invokeMethod<String>('getPackageId');
    expect(result, "com.example.cuy_flutter_dev");
  });

  test('should return app version', () async {
    final result = await channel.invokeMethod<String>('getAppVersion');
    expect(result, "1.0.0");
  });

  test('should return device brand', () async {
    final result = await channel.invokeMethod<String>('getDeviceBrand');
    expect(result, "Xiaomi");
  });

  test('should return os name', () async {
    final result = await channel.invokeMethod<String>('getOsName');
    expect(result, "Android");
  });

  test('should return os version', () async {
    final result = await channel.invokeMethod<String>('getOsVersion');
    expect(result, "11");
  });

  test('should return language', () async {
    final result = await channel.invokeMethod<String>('getLanguage');
    expect(result, "en");
  });
}

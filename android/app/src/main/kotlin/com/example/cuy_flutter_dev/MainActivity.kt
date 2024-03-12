package com.example.cuy_flutter_dev

import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Locale

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.cuy_flutter_dev/info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getAppName") {
                val appName = getAppName()

                if (appName.isNotEmpty()) {
                    result.success(appName)
                } else {
                    result.error("UNAVAILABLE", "App name not available.", null)
                }
            } else if (call.method == "getPackageId") {
                val packageId = getPackageId()

                if (packageId.isNotEmpty()) {
                    result.success(packageId)
                } else {
                    result.error("UNAVAILABLE", "Package id not available.", null)
                }
            } else if (call.method == "getAppVersion") {
                val appVersion = getAppVersion()

                if (appVersion.isNotEmpty()) {
                    result.success(appVersion)
                } else {
                    result.error("UNAVAILABLE", "App version not available.", null)
                }
            } else if (call.method == "getDeviceBrand") {
                val deviceBrand = getDeviceBrand()

                if (deviceBrand.isNotEmpty()) {
                    result.success(deviceBrand)
                } else {
                    result.error("UNAVAILABLE", "Device brand not available.", null)
                }
            } else if (call.method == "getOsName") {
                val osName = getOsName()

                if (osName.isNotEmpty()) {
                    result.success(osName)
                } else {
                    result.error("UNAVAILABLE", "OS name not available.", null)
                }
            } else if (call.method == "getOsVersion") {
                val osVersion = getOsVersion()

                if (osVersion.isNotEmpty()) {
                    result.success(osVersion)
                } else {
                    result.error("UNAVAILABLE", "OS version not available.", null)
                }
            } else if (call.method == "getLanguage") {
                val language = getLanguage()

                if (language.isNotEmpty()) {
                    result.success(language)
                } else {
                    result.error("UNAVAILABLE", "Language not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAppName(): String {
        val applicationInfo = applicationContext.applicationInfo
        val stringId = applicationInfo.labelRes
        return if (stringId == 0) applicationInfo.nonLocalizedLabel.toString() else applicationContext.getString(
            stringId
        )
    }

    private fun getPackageId(): String {
        return applicationContext.packageName
    }

    private fun getAppVersion(): String {
        return try {
            val pInfo = applicationContext.packageManager.getPackageInfo(packageName, 0)
            pInfo.versionName
        } catch (e: PackageManager.NameNotFoundException) {
            e.printStackTrace()
            "0.0.0"
        }
    }

    private fun getDeviceBrand(): String {
        return Build.BRAND
    }

    private fun getOsName(): String {
        return "Android"
    }

    private fun getOsVersion(): String {
        return Build.VERSION.RELEASE
    }

    private fun getLanguage(): String {
        return Locale.getDefault().language
    }
}
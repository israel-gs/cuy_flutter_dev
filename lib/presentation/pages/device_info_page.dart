import 'package:cuy_flutter_dev/core/util/device_info_util.dart';
import 'package:cuy_flutter_dev/presentation/widgets/device_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({super.key});

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Future<DeviceInfo?>? deviceInfoFuture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 20),
          if (deviceInfoFuture == null)
            ElevatedButton(
              onPressed: _getDeviceInfo,
              child: Text(
                AppLocalizations.of(context)?.getDeviceInformation ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: deviceInfoFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoader();
              } else if (snapshot.hasError) {
                return _buildError(snapshot.error.toString());
              } else if (snapshot.hasData) {
                final deviceInfo = snapshot.data as DeviceInfo;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [DeviceInfoWidget(deviceInfo: deviceInfo)],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  _getDeviceInfo() {
    if (deviceInfoFuture == null) {
      setState(() {
        deviceInfoFuture = DeviceInfoUtil.getDeviceInfo();
      });
    }
  }

  _buildLoader() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  _buildError(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  _buildTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.deviceInformation ?? '',
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

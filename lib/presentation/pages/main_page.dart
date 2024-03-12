import 'package:cuy_flutter_dev/presentation/pages/device_info_page.dart';
import 'package:cuy_flutter_dev/presentation/pages/plans_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({
    super.key,
    required this.initialIndex,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _currentIndex == 0 ? const PlansPage() : const DeviceInfoPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.house, size: 20),
            label: AppLocalizations.of(context)?.plans ?? '',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.info, size: 20),
            label: AppLocalizations.of(context)?.info ?? '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

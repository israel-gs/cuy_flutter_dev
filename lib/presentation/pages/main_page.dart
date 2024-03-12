import 'package:cuy_flutter_dev/presentation/pages/device_info_page.dart';
import 'package:cuy_flutter_dev/presentation/pages/plans_page.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Planes' : 'Información'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Text(
              '🇺🇸',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      body: _currentIndex == 0 ? const PlansPage() : const DeviceInfoPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, size: 20),
            label: 'Planes',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.info, size: 20),
            label: 'Info',
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

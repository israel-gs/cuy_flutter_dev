import 'package:cuy_flutter_dev/presentation/pages/login_page.dart';
import 'package:cuy_flutter_dev/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const LoginPage());
      case '/main':
        return _materialRoute(
          const MainPage(
            initialIndex: 0,
          ),
        );
      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

import 'package:flutter/material.dart';

class AppRouter {
  static const home = '/home';
  static const food = '/food';
  static const taxi = '/taxi';
  static const delivery = '/delivery';
  static const payment = '/payment';
  static const profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}

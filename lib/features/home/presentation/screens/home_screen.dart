import 'package:flutter/material.dart';

import 'package:kandyagash_app/features/auth/presentation/screens/login_screen.dart';
import 'package:kandyagash_app/features/delivery/presentation/screens/delivery_screen.dart';
import 'package:kandyagash_app/features/food/presentation/screens/food_screen.dart';
import 'package:kandyagash_app/features/home/presentation/screens/home_screen.dart';
import 'package:kandyagash_app/features/map/presentation/screens/map_screen.dart';
import 'package:kandyagash_app/features/news/presentation/screens/news_screen.dart';
import 'package:kandyagash_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:kandyagash_app/features/orders/presentation/screens/orders_screen.dart';
import 'package:kandyagash_app/features/payment/presentation/screens/payment_screen.dart';
import 'package:kandyagash_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:kandyagash_app/features/taxi/presentation/screens/taxi_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const news = '/news';
  static const map = '/map';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const taxi = '/taxi';
  static const food = '/food';
  static const delivery = '/delivery';
  static const payment = '/payment';
  static const orders = '/orders';
}

class KandyagashApp extends StatelessWidget {
  const KandyagashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qandyagash Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D7EEA),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFEAF1F5),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.news: (_) => const NewsScreen(),
        AppRoutes.map: (_) => const MapScreen(),
        AppRoutes.notifications: (_) => const NotificationsScreen(),
        AppRoutes.profile: (_) => const ProfileScreen(),
        AppRoutes.taxi: (_) => const TaxiScreen(),
        AppRoutes.food: (_) => const FoodScreen(),
        AppRoutes.delivery: (_) => const DeliveryScreen(),
        AppRoutes.payment: (_) => const PaymentScreen(),
        AppRoutes.orders: (_) => const OrdersScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kandyagash_app/features/home/presentation/screens/home_screen.dart';

class KandyagashApp extends StatelessWidget {
  const KandyagashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qandyagash Life',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
    );
  }
}

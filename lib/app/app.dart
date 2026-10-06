import 'package:flutter/material.dart';
import 'package:kandyagash_app/core/theme/app_theme.dart';
import 'package:kandyagash_app/features/home/presentation/screens/home_screen.dart';

class KandyagashApp extends StatelessWidget {
  const KandyagashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kandyagash Life',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

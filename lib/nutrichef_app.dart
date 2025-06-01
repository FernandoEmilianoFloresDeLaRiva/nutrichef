import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes/ui/pages/nutriChef_screen.dart';

class NutriChefApp extends StatelessWidget {
  const NutriChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriChef',
      theme: AppTheme.lightTheme,
      home: const NutriChefScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/core/router/ui/view/router_app.dart';

class NutriChefApp extends StatelessWidget {
  const NutriChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NutriChef',
      theme: AppTheme.lightTheme,
      routerConfig: RouterApp.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrichef/core/router/domain/constants/router_constants.dart';
import 'package:nutrichef/recipes/ui/pages/nutriChef_screen.dart';

class RouterApp {
  static final router = GoRouter(
    initialLocation: RouterConstants.home,
    routes: [
      GoRoute(
          path: RouterConstants.home,
          builder: (ctx, state) => const NutriChefScreen()),
      GoRoute(
        path: "${RouterConstants.recipe}/:id",
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return Text(id);
        },
      ),
    ],
  );
}

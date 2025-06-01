import 'package:go_router/go_router.dart';
import 'package:nutrichef/core/router/domain/constants/router_constants.dart';
import 'package:nutrichef/recipes/ui/pages/nutriChef_screen.dart';
import 'package:nutrichef/recipes_detail/ui/pages/recipes_detail_page.dart';

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
          return RecipeDetailPage(recipeId: int.parse(id));
        },
      ),
    ],
  );
}

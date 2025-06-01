import 'package:go_router/go_router.dart';
import 'package:nutrichef/core/router/domain/constants/router_constants.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
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
          final recipe = RecipeAdapter(
            id: int.parse(id),
            name: 'Veggie Omelette',
            imageUrl: 'https://img.spoonacular.com/recipes/644387-556x370.jpg',
            cookingTime: 10,
            tags: ['Vegano'],
            category: 'Desayuno',
            ingredients: [
              '2 huevos grandes',
              '1/4 taza de espinaca',
              '1/4 taza de champiñones, en rodajas',
              '1/4 taza de tomate, en rodajas',
              '1/4 taza de calabacín, en rodajas',
              'Sal al gusto',
              'Pimienta al gusto',
              '1 cdta. de aceite de oliva',
            ],
            instructions: [
              'Calienta el aceite de oliva en una sartén antiadherente a fuego medio.',
              'Bate los huevos en un bowl y sazónalos con sal y pimienta.',
              'Vierte los huevos en la sartén caliente.',
              'Cuando los bordes comiencen a cuajarse, añade las verduras en una mitad.',
              'Dobla la omelette por la mitad y sirve inmediatamente.',
            ],
          );

          return RecipeDetailPage(recipe: recipe);
        },
      ),
    ],
  );
}

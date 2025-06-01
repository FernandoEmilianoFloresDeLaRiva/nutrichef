import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';

class StubData {
  static const List<RecipeAdapter> recipes = [
    RecipeAdapter(
      id: 1,
      name: 'Veggie Omelette',
      imageUrl: 'assets/images/omelette.jpg',
      cookingTime: 10,
      tags: ['Vegano', 'Proteína'],
      category: 'Vegano',
      description: 'Delicioso omelette vegano con vegetales frescos.',
      ingredients: [
        '3 huevos veganos',
        '1 pimiento rojo',
        '1 cebolla morada',
        'Espinacas frescas',
        'Aceite de oliva',
      ],
      instructions: [
        'Picar todos los vegetales',
        'Calentar aceite en la sartén',
        'Agregar vegetales y cocinar',
        'Verter la mezcla de huevo',
        'Doblar por la mitad y servir',
      ],
    ),
    RecipeAdapter(
      id: 2,
      name: 'Ensalada de garbanzos',
      imageUrl: 'assets/images/chickpea_salad.jpg',
      cookingTime: 15,
      tags: ['Alto en proteína', 'Vegano'],
      category: 'Vegano',
      description: 'Ensalada nutritiva rica en proteínas vegetales.',
      ingredients: [
        '400g garbanzos cocidos',
        'Tomates cherry',
        'Pepino',
        'Cebolla morada',
        'Cilantro fresco',
        'Limón',
        'Aceite de oliva',
      ],
    ),
    RecipeAdapter(
      id: 3,
      name: 'Pollo al Curry',
      imageUrl: 'assets/images/curry_chicken.jpg',
      cookingTime: 30,
      tags: ['Sin gluten', 'Proteína'],
      category: 'Sin gluten',
      description: 'Aromático curry de pollo sin gluten.',
    ),
    RecipeAdapter(
      id: 4,
      name: 'Tacos de Coliflor',
      imageUrl: 'assets/images/cauliflower_tacos.jpg',
      cookingTime: 25,
      tags: ['Vegano', 'Bajo en carbohidratos'],
      category: 'Vegano',
      description: 'Tacos saludables con coliflor asada.',
    ),
    RecipeAdapter(
      id: 5,
      name: 'Avena con Frutos Rojos',
      imageUrl: 'assets/images/oatmeal.jpg',
      cookingTime: 5,
      tags: ['Desayuno', 'Fibra'],
      category: 'Desayuno',
      description: 'Desayuno nutritivo y energético.',
    ),
    RecipeAdapter(
      id: 6,
      name: 'Salmón Keto',
      imageUrl: 'assets/images/keto_salmon.jpg',
      cookingTime: 20,
      tags: ['Keto', 'Alto en grasa'],
      category: 'Keto',
      description: 'Salmón perfecto para dieta cetogénica.',
    ),
  ];

  static List<RecipeAdapter> getRecipeByCategory(String category) {
    return recipes.where((recipe) => recipe.category == category).toList();
  }

  static List<RecipeAdapter> getFeaturedRecipes(String category) {
    return recipes.take(5).toList();
  }
}

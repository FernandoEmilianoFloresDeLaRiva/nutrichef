import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes/data/api/get_recipes_imp.dart';
import 'package:nutrichef/recipes/domain/use_cases/get_recipes_use_case.dart';

class GetRecipesDependencies {
  static GetRecipesUseCase getRecipesUseCase() {
    return GetRecipesUseCase(
      getRecipesRepository: GetRecipesImp(getWithoutAuth: GetWithoutAuth()),
    );
  }
}

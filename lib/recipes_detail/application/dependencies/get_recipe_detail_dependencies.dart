import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes_detail/data/api/get_recipe_detail_imp.dart';
import 'package:nutrichef/recipes_detail/domain/use_cases/get_recipe_detail_use_case.dart';

class GetRecipeDetailDependencies {
  static GetRecipeDetailUseCase getRecipeDetailUseCase() {
    return GetRecipeDetailUseCase(
        getRecipeDetailRepository:
            GetRecipeDetailRepositoryImpl(getWithoutAuth: GetWithoutAuth()));
  }
}

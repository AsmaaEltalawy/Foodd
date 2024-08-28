import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/data/services/recipe_service.dart';

class RecipeCubit extends Cubit<List<Recipe>> {
  RecipeCubit() : super([]) {
    getRecipes();
  }

  final RecipeService _service = RecipeService();

  void getRecipes() async {
    final result = await _service.getRecipes();
    emit(result);
  }

}

import 'package:dio/dio.dart';
import 'package:recipe_app/data/models/recipe.dart';

class RecipeService {
  final _dio = Dio();

  Future<List<Recipe>> getRecipes() async {
    final response = await _dio.get('https://dummyjson.com/recipes');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> jsonRecipes = jsonData['recipes'];
    List<Recipe> recipes = jsonRecipes
        .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
        .toList();
    return recipes;
  }
}

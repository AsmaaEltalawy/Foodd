import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';
@JsonSerializable()
class Recipe {
  String name;
  int caloriesPerServing;

  List<String> ingredients;
  String image;
  double rating;
  Recipe(
      {required this.name,
      required this.caloriesPerServing,
      required this.ingredients,
      required this.image,
      required this.rating});
  factory Recipe.fromJson(Map<String,dynamic> json)=> _$RecipeFromJson(json);

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cupits/recipecubit.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/wedgets/recipe_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade700,
                  Colors.purple.shade600,
                  Colors.purple.shade500,
                  Colors.purple.shade400,
                  Colors.purple.shade300,
                  Colors.purple.shade200,
                  Colors.purple.shade100,
                ]),
          ),
        ),
        title: const Text(
          'Recipe',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<RecipeCubit, List<Recipe>>(
          builder: (context, recipeList) {
        return ListView.builder(itemCount: recipeList.length,itemBuilder: (context, index) {
          return RecipeCard(recipe: recipeList[index],onTap: (){},);
        });
      }),
    );
  }
}

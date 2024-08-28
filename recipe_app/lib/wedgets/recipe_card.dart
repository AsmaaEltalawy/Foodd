import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap ;
  RecipeCard({required this.recipe,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 10,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              recipe.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.7)
                    ])),
          ),
           Positioned(
              top: 15,
              right: 15,
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
           Positioned(
              bottom: 15,
              right: 15,
              child: Text(
                recipe.caloriesPerServing.toString()+" Kcal",
                style: TextStyle(color: Colors.white),
              )),
          Positioned(
              top: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(.7)),
                child:  Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
           Positioned(
              bottom: 15,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name.toString(),
                    style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20 ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    recipe.ingredients.length.toString()+" ingredients",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

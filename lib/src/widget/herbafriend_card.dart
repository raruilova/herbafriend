import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/pages/recipes_list.dart';

class HerbaFriendCard extends StatelessWidget {
  final Recipes recipes;

  HerbaFriendCard(this.recipes);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeList(recipes),
            ))
      },
      child: Card(
        child: ListTile(
          title: Text(recipes.name.toString()),
          leading: Icon(Icons.food_bank),
        ),
      ),
    );
  }
}

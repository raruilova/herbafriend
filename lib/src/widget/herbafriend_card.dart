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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(recipes.name.toString()),
                leading: recipes.imagen == null
                    ? Image.asset("assets/images/planta.png")
                    : Image.network(recipes.imagen.toString()),
              )
            ],
          ),
        ));
  }
}

//Card(
//        child: ListTile(
//          title: Text(recipes.name.toString()),
//          leading: Icon(Icons.food_bank),
//        ),
//      ),

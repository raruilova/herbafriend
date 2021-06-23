import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';

class RecipeList extends StatefulWidget {
  final Recipes recipes;
  RecipeList(this.recipes);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.recipes.name.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70.0),
          ),
          Text(
            "Ingredientes: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
            widget.recipes.ingredients.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Text(
            "Preparación: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Text(
            widget.recipes.preparation.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}

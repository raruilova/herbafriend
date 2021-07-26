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
        child: Column(
          children: [
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
            ),
            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height - 550.0,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    bottomLeft: Radius.circular(75.0),
                    topRight: Radius.circular(75.0),
                    bottomRight: Radius.circular(75.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 7.0),
                      child: Container(
                        //height: MediaQuery.of(context).size.height - 300.0,
                        child: Card(
                          child: ListTile(
                            title: Text(recipes.name.toString()),
                            leading: Icon(Icons.grass),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}

//Card(
//        child: ListTile(
//          title: Text(recipes.name.toString()),
//          leading: Icon(Icons.food_bank),
//        ),
//      ),

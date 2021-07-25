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
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Detalles',
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: Column(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.recipes.name.toString(),
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.recipes.category.toString(),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(widget.recipes.ingredients.toString(),
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                     SizedBox(height: 20.0),
                    
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(widget.recipes.preparation.toString(),
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ]));
  }
}

//Column(
//        children: [
//          Container(
//            margin: EdgeInsets.only(top: 70.0),
//          ),
//          Text(
//            widget.recipes.category.toString(),
//            style: TextStyle(fontSize: 10.0),
//          ),
//          Text(
//            "Ingredientes: ",
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 20.0,
//            ),
//          ),
//          Text(
//            widget.recipes.ingredients.toString(),
//            style: TextStyle(fontWeight: FontWeight.bold),
//          ),
//          Container(
//            margin: EdgeInsets.only(top: 20.0),
//          ),
//          Text(
//            "Preparación: ",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//          ),
//          Text(
//            widget.recipes.preparation.toString(),
//            style: TextStyle(fontSize: 20.0),
//          ),
//        ],
//      ),

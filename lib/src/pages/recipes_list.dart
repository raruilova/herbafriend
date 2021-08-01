import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/utils/standart.dart';

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
          title: Text('Detalles'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Theme.of(context).canvasColor),
                          child: ClipOval(
                              child: widget.recipes.imagen == null
                                  ? Image.asset("assets/images/user.png")
                                  : Image.network(
                                      widget.recipes.imagen.toString())),
                        ),
                      ],
                    ),
                    Standard.titleToForm(context, "Detalle de Recetas"),
                    _detalles()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _detalles() {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Theme.of(context).dividerColor)),
          child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.recipes.name.toString(),
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Categoria: ' + widget.recipes.category.toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      Container(height: 25.0, color: Colors.grey),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 125.0,
                      child: ListView(children: [
                        Text(
                            'Ingredientes: ' +
                                '\n\n' +
                                widget.recipes.ingredients.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ]),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 140.0,
                      child: ListView(
                        children: [
                          Text(
                              'Preparacion: ' +
                                  '\n\n' +
                                  widget.recipes.preparation.toString(),
                              style: TextStyle(
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
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

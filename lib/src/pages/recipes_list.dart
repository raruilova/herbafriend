import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/utils/standart.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:herbafriend/src/widget/view_map.dart';

class RecipeList extends StatefulWidget {
  final Recipes recipes;
  RecipeList(this.recipes);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  bool? darkModePrefs;
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadDarkModePrefs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles'),
          backgroundColor: Theme.of(context).primaryColor,
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
                                  ? Image.asset("assets/images/planta.png")
                                  : Image.network(
                                      widget.recipes.imagen.toString())),
                        ),
                      ],
                    ),
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
                      Text(widget.recipes.category.toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      Container(height: 25.0, color: Colors.grey),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 145.0,
                      child: ListView(children: [
                        Text(
                          'Ingredientes: ' +
                              '\n\n' +
                              widget.recipes.ingredients.toString(),
                        ),
                      ]),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 200.0,
                      child: ListView(
                        children: [
                          Text(
                            'Preparacion: ' +
                                '\n\n' +
                                widget.recipes.preparation.toString(),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: darkModePrefs == false
                              ? Colors.green
                              : Colors.tealAccent),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewMap(),
                                ));
                      },
                      child: Text(
                        'Mapa',
                        style: TextStyle(
                            fontSize: 20,
                            color: darkModePrefs == false
                                ? Colors.white
                                : Colors.black),
                      )),
                ],
              ),
            ),
          )),
    );
  }
    _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}

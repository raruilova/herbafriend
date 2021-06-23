import 'package:flutter/material.dart';
import 'package:herbafriend/main.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/pages/favorites_page.dart';
import 'package:herbafriend/src/pages/recipe_add_page.dart';

class MainPage extends StatefulWidget {
  final Recipes recipes;
  MainPage(this.recipes);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetsChildren = <Widget>[
    FavoritesPage(), //1
    RecipeAddPage() //2
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.recipes.name.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Favoritos'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Añadir'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              child: _widgetsChildren.elementAt(_selectedIndex),
            ),
            Column(
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
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:herbafriend/main.dart';
import 'package:herbafriend/src/pages/favorites_page.dart';
import 'package:herbafriend/src/pages/recipe_add_page.dart';

class BottonNavigation extends StatefulWidget {
  BottonNavigation({Key? key}) : super(key: key);

  @override
  _BottonNavigationState createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    MyHomePage(), //0 posiciones, con esto al hacer click me lleva hacia alguno
    FavoritesPage(), //1
    RecipeAddPage() //2
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: onTapTapped,
        currentIndex: indexTap,
        items: [
          BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: Icon(Icons.home),
          ),
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
    );
  }
}

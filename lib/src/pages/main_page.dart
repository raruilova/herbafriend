import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/category.dart';
import 'package:herbafriend/src/pages/register.dart';
import 'package:herbafriend/src/providers/app_provider.dart';
import 'package:herbafriend/src/service/category_service.dart';
import 'package:herbafriend/src/utils/enums.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:herbafriend/src/widget/login_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool? darkModePrefs;

  final CategoryService _service = CategoryService();

  List<CategoryRecipe> _result = [];

  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadResult();
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_selectedIndex == 0
            ? widget.titulo
            : menuOptions[_selectedIndex].label),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorDark),
            child: SingleChildScrollView(
              child: Text(
                "Bienvenid@",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: _result
                .map((e) => ListTile(
                      onTap: () {},
                      title: Text(e.name.toString()),
                    ))
                .toList(),
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: [
              darkModePrefs == null
                  ? Container()
                  : Card(
                      elevation: 5.0,
                      child: ListTile(
                        title: Text("Modo oscuro",
                            style: Theme.of(context).textTheme.bodyText1),
                        leading: Checkbox(
                            value: darkModePrefs,
                            onChanged: (value) {
                              setState(() {
                                appProvider.darkMode = value ?? false;
                                setDarkMode(value ?? false);
                                if (value == true) {
                                  print("Modo nocturno activado");
                                } else {
                                  print("Modo nocturno desactivado");
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(titulo: "Recetas")));
                              });
                            }),
                      ),
                    )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Text(
                'Salir',
                style: Theme.of(context).textTheme.headline6,
              ))
        ],
      )),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 14.0),
          child: contentWidget[_selectedIndex]),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {
              print("cambio de estado");
            });
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }

  _loadResult() {
    _service.getCategory().then((value) {
      print(value);
      _result = value;
      setState(() {});
    });
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}

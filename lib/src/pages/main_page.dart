import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:herbafriend/main.dart';
import 'package:herbafriend/src/model/categories.dart';
import 'package:herbafriend/src/pages/register.dart';
import 'package:herbafriend/src/service/category_service.dart';
import 'package:herbafriend/src/utils/enums.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final CategoryService _service = CategoryService();

  List<CategoryRecipe> _result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inicio del Estado");
    _loadResult();
  }

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(color: Colors.green),
            child: SingleChildScrollView(
              child: Text(
                "Bienvenid@",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                  .toList())
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
}

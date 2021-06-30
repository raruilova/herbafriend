import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.yard), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Ingrediente'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.emoji_food_beverage),
                      labelText: 'Preparacion'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.category), labelText: 'Categoria'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Agregar',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

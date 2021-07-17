import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/categories.dart';
import 'package:herbafriend/src/service/category_service.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final CategoryService _service = CategoryService();

  List<CategoryRecipe> _result = [];

  var _dropdownValue;

  @override
   void initState() {
    super.initState();
    print("inicio del Estado");
    _loadResult();
  }
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
                //TextField(
                //  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                //  decoration: InputDecoration(
                //      icon: Icon(Icons.category), labelText: 'Categoria'),
                //),
                Container(
                  
                    child: DropdownButton(
                      value: _dropdownValue,
                      items: _result
                      .map((e) => DropdownMenuItem(
                        value: e.name.toString(),
                        child: Text(e.name.toString()),
                      )).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dropdownValue = value.toString();
                        },
                        
                        );
                      },
                      hint: Text('Seleccione una categoria'),
                    ),
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
  _loadResult() {
    _service.getCategory().then((value) {
      print(value.toString());
      _result = value;
      setState(() {});
    });
  }
}

import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/categories.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/service/category_service.dart';
import 'package:herbafriend/src/service/herfriend_service.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final CategoryService _service = CategoryService();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrep = TextEditingController();
  final TextEditingController _controllerIng = TextEditingController();
  final HerbaFriendService _recipeService = HerbaFriendService();
  //Future<Recipes>? _futureRecipe;
  late Recipes _recipes;
  List<CategoryRecipe> _result = [];

  var _dropdownValue;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadResult();
    _recipes = Recipes.create("","","");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        //height: 570.0,
        //padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _recipes.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  controller: _controllerName,
                  decoration: InputDecoration(
                      icon: Icon(Icons.yard), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  initialValue: _recipes.ingredients,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  controller: _controllerIng,
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Ingrediente'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  initialValue: _recipes.preparation,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  controller: _controllerPrep,
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
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(
                        () {
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
                ElevatedButton(
                    onPressed: () async {
                      
                      //Recipes data = await submit
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                      setState(() {
                        _recipeService.sendRecipe(_recipes).then((value) => {
                          _formKey.currentState!.reset(),
                          Navigator.pop(context)
                        });
                      });
                    },
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
import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/category.dart';
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
  final HerbaFriendService _recipeService = HerbaFriendService();
  //Future<Recipes>? _futureRecipe;
  late Recipes _recipes;
  List<CategoryRecipe> _result = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadResult();
    _recipes = Recipes.create("", "", "", "Estomago");
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
                  onSaved: (value) {
                    _recipes.name = value.toString();
                  },
                  validator: (value) {
                    if (value!.length < 1) {
                      return "Debe ingresar un mensaje con al menos 25 caracteres";
                    } else {
                      return null; //Validación se cumple al retorna null
                    }
                  },
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.yard), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  maxLines: 3,
                  initialValue: _recipes.ingredients,
                  onSaved: (value) {
                    _recipes.ingredients = value.toString();
                  },
                  validator: (value) {
                    if (value!.length < 1) {
                      return "Debe ingresar un mensaje con al menos 25 caracteres";
                    } else {
                      return null; //Validación se cumple al retorna null
                    }
                  },
                  style: TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Ingrediente'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextFormField(
                  maxLines: 3,
                  initialValue: _recipes.preparation,
                  onSaved: (value) {
                    _recipes.preparation = value.toString();
                  },
                  validator: (value) {
                    if (value!.length < 1) {
                      return "Debe ingresar un mensaje con al menos 25 caracteres";
                    } else {
                      return null; //Validación se cumple al retorna null
                    }
                  },
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
                    child: Column(
                  children: [
                    DropdownButton<String>(
                      value: _recipes.category,
                      onChanged: (String? newvalue) {
                        setState(
                          () {
                            _recipes.category = newvalue!;
                          },
                        );
                      },
                      items: _result.map<DropdownMenuItem<String>>(
                          (CategoryRecipe value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                    )
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () {
                      //Recipes data = await submit
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                      _formKey.currentState!.save();
                      setState(() {
                        _recipeService.sendRecipe(_recipes).then((value) {
                          _formKey.currentState!.reset();
                          Navigator.pop(context);
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

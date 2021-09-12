import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/category.dart';
import 'package:herbafriend/src/model/cities_model.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/service/category_service.dart';
import 'package:herbafriend/src/service/cities_service.dart';
import 'package:herbafriend/src/service/herfriend_service.dart';
import 'package:herbafriend/src/utils/standart.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:herbafriend/src/widget/view_map.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final CategoryService _service = CategoryService();
  final HerbaFriendService _recipeService = HerbaFriendService();
  final CitiesService _citiesService = CitiesService();
  //Future<Recipes>? _futureRecipe;
  late Recipes _recipes;
  List<CategoryRecipe> _result = [];

  List<Cities> _cities = [];

  final _formKey = GlobalKey<FormState>();
  late File _image;
  bool _imageSelected = false;
  final _picker = ImagePicker();
  bool? darkModePrefs;

  String city = 'Riobamba';
  @override
  void initState() {
    super.initState();
    print("inicio del Estado");
    _loadResult();
    _loadCities();
    _loadDarkModePrefs();
    _recipes = Recipes.create("", "", "", "Estomago");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recetas'),
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
                        _imageDefault(),
                        Container(
                          width: 325.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: "Tomar Foto",
                                child: ElevatedButton(
                                  onPressed: _takeImage,
                                  child: Icon(Icons.camera_alt),
                                  style: Standard.buttonStandardStyle(
                                      context,
                                      darkModePrefs == false
                                          ? Colors.green
                                          : Colors.tealAccent),
                                ),
                              ),
                              Tooltip(
                                message: "Buscar Foto",
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: Icon(Icons.image),
                                  style: Standard.buttonStandardStyle(
                                      context,
                                      darkModePrefs == false
                                          ? Colors.green
                                          : Colors.tealAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Standard.titleToForm(context, "Registro de Recetas"),
                    _form()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _form() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Theme.of(context).dividerColor)),
        child: Form(
          key: _formKey,
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
                      if (value!.length < 5) {
                        return "Debe ingresar un mensaje con al menos 5 caracteres";
                      } else {
                        return null; //Validación se cumple al retorna null
                      }
                    },
                    style:
                        TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.yard), labelText: 'Nombre'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                  TextFormField(
                    maxLines: 4,
                    initialValue: _recipes.ingredients,
                    onSaved: (value) {
                      _recipes.ingredients = value.toString();
                    },
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Debe ingresar un mensaje con al menos 5 caracteres";
                      } else {
                        return null; //Validación se cumple al retorna null
                      }
                    },
                    style:
                        TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.list), labelText: 'Ingrediente'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                  TextFormField(
                    maxLines: 4,
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
                    style:
                        TextStyle(fontSize: 17.0, color: Colors.orangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.emoji_food_beverage),
                        labelText: 'Preparacion'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                  
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
                  
                  Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                  
                  
                       Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: darkModePrefs == false
                              ? Colors.green
                              : Colors.tealAccent),
                      onPressed: () async {
                        //Recipes data = await submit
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                        _formKey.currentState!.save();

                        if (_imageSelected) {
                          _recipes.imagen =
                              await _recipeService.upImage(_image);
                        }
                        
                        setState(() {
                          _recipeService.sendRecipe(_recipes).then((value) {
                            _formKey.currentState!.reset();
                            Navigator.pop(context);
                          });
                        });
                      },
                      child: Text(
                        'Agregar',
                        style: TextStyle(
                            fontSize: 20,
                            color: darkModePrefs == false
                                ? Colors.white
                                : Colors.black),
                      )),
                  Divider(
                    color: darkModePrefs == false
                        ? Colors.white
                        : Colors.grey[800],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*
  
   */
  _loadResult() {
    _service.getCategory().then((value) {
      print(value.toString());
      _result = value;
      setState(() {});
    });
  }
  _loadCities(){
    _citiesService.getCities().then((value) {
      print(value.toString());
      _cities = value;
      setState(() {});
    });
  }
  _imageDefault() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/planta.png")
              : Image.file(_image)),
    );
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No image selected.');
      _imageSelected = false;
    }
    setState(() {});
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}

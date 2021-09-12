import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:herbafriend/src/pages/main_page.dart';
import 'package:herbafriend/src/pages/usuario_register.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;

  Future _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    _sigin();
  }

  void _sigin() async {
     final authData = {
      'identifier': _email,
      'password': _password,
    };
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("backhebrafriend.herokuapp.com", "/auth/local");
      final resp =
          await http.post(uri, headers: _headers, body: json.encode(authData));
      if (resp.body.isEmpty) return null;
      if(resp.statusCode == 200) {
        print(resp.body);
        _redirectUser();
      }else{
        print(resp.body);
        _showerrorDialog('Revise si ha ingresado bien su correo o contraseña');
        
      }
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  void _redirectUser() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainPage(titulo: 'Recetas')));
    });
  }

  bool? darkModePrefs;
  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              height: _heigth * 0.4,
              width: _width,
              color: darkModePrefs == false ? Colors.green : Colors.black,
              child: darkModePrefs == false
                  ? Image.asset('assets/images/logo.png')
                  : Image.asset('assets/images/logodark.png')),
          Container(
              color: darkModePrefs == false ? Colors.green : Colors.black,
              child: Container(
                  decoration: BoxDecoration(
                      color: darkModePrefs == false
                          ? Colors.white
                          : Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Title(
                            color: Colors.black,
                            child: Text(
                              'Ingresar',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: darkModePrefs == false
                                      ? Colors.black
                                      : Colors.grey[400]),
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.orangeAccent),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.alternate_email),
                                    labelText: 'Correo Electronico'),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Correo invalido';
                                  }
                                },
                                onSaved: (value) {
                                  _email = value.toString();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0),
                              ),
                              Divider(
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.grey[850],
                              ),
                              Divider(
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.grey[850],
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.orangeAccent),
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _obscureText = !_obscureText;
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    icon: Icon(Icons.vpn_key),
                                    labelText: 'Contraseña'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 5) {
                                    return 'Contraseña muy corta';
                                  }
                                },
                                onSaved: (value) {
                                  _password = value.toString();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0),
                              ),
                              Divider(
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.grey[850],
                              ),
                              Divider(
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.grey[850],
                              ),
                              MaterialButton(
                                minWidth: 200.0,
                                height: 50.0,
                                color: darkModePrefs == false
                                    ? Colors.green
                                    : Colors.tealAccent,
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                      color: darkModePrefs == false
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20.0),
                                ),
                                onPressed: () async {
                                  _submit();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: darkModePrefs == false
                              ? Colors.white
                              : Colors.grey[850],
                        ),
                        Divider(
                          color: darkModePrefs == false
                              ? Colors.white
                              : Colors.grey[850],
                        ),
                        MaterialButton(
                          minWidth: 200.0,
                          height: 50.0,
                          color: darkModePrefs == false
                              ? Colors.green
                              : Colors.tealAccent,
                          child: Text(
                            'Registrarse',
                            style: TextStyle(
                                color: darkModePrefs == false
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UsuarioRegister(),
                                ));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        Divider(
                          color: darkModePrefs == false
                              ? Colors.white
                              : Colors.grey[850],
                        ),
                        Divider(
                          color: darkModePrefs == false
                              ? Colors.white
                              : Colors.grey[850],
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    ));
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Ha ocurrido un Error',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

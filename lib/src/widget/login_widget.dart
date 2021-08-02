import 'package:flutter/material.dart';
import 'package:herbafriend/src/pages/main_page.dart';
import 'package:herbafriend/src/pages/usuario_register.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        TextFormField(
                          style: TextStyle(
                              fontSize: 17.0, color: Colors.orangeAccent),
                          decoration: InputDecoration(
                              icon: Icon(Icons.alternate_email),
                              labelText: 'Correo Electronico'),
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
                        TextField(
                          style: TextStyle(
                              fontSize: 17.0, color: Colors.orangeAccent),
                          decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Contraseña'),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainPage(titulo: 'Recetas'),
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
}

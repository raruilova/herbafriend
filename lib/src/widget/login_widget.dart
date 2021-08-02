import 'package:flutter/material.dart';
import 'package:herbafriend/src/pages/main_page.dart';
import 'package:herbafriend/src/pages/usuario_register.dart';
import 'package:herbafriend/src/providers/app_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: _heigth * 0.4,
            width: _width,
            color: Colors.green,
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
              color: Colors.green,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        TextField(
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
                          color: Colors.white,
                        ),
                        Divider(
                          color: Colors.white,
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
                          color: Colors.white,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        MaterialButton(
                          minWidth: 200.0,
                          height: 50.0,
                          color: Colors.green,
                          child: Text(
                            'Iniciar Sesión',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
                          color: Colors.white,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        MaterialButton(
                          minWidth: 200.0,
                          height: 50.0,
                          color: Colors.green,
                          child: Text(
                            'Registrarse',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
                          color: Colors.white,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    ));
  }
}

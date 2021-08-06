import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/personal_list.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';

class RegisterList extends StatefulWidget {
  RegisterList({Key? key}) : super(key: key);

  @override
  _RegisterListState createState() => _RegisterListState();
}

class _RegisterListState extends State<RegisterList> {
  final formKey = GlobalKey<FormState>();
  bool? darkModePrefs;
  late PersonalList _listelement;
  List<String> _typesElement = ['Revision', 'Recordatorio'];
  String _typeValue = "";
  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
    _typeValue = _typesElement.elementAt(0);
    _listelement = PersonalList.create("", "", _typeValue == 'Revision');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: darkModePrefs == false ? Colors.green : Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          children: [
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                //Image.asset(
                //  'assets/images/logo.png',
                //),
                Container(
                  //width: 250.0,
                  height: 300.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: darkModePrefs == false
                              ? AssetImage('assets/images/logo.png')
                              : AssetImage('assets/images/logodark.png'),
                          fit: BoxFit.fill)),
                )
              ],
            ),
            SizedBox(height: 40.0),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _listelement.name,
                      onSaved: (value) {
                        _listelement.name = value.toString();
                      },
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Debe ingresar un mensaje con al menos 5 caracteres";
                        } else {
                          return null; //Validación se cumple al retorna null
                        }
                      },
                      decoration:
                          InputDecoration(filled: true, labelText: 'Nombre'),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      maxLines: 2,
                      initialValue: _listelement.description,
                      onSaved: (value) {
                        _listelement.description = value.toString();
                      },
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Debe ingresar un mensaje con al menos 5 caracteres";
                        } else {
                          return null; //Validación se cumple al retorna null
                        }
                      },
                      decoration: InputDecoration(
                          filled: true, labelText: 'Descripcion'),
                      //obscureText: true,
                    ),
                    Column(
                        children: _typesElement
                            .map((e) => ListTile(
                                  title: Text(e),
                                  leading: Radio(
                                    value: e,
                                    groupValue: _typeValue,
                                    onChanged: (String? value) {
                                      _typeValue = value.toString();
                                      _listelement.active =
                                          _typeValue == "Revision";
                                      setState(() {});
                                    },
                                  ),
                                ))
                            .toList()),
                    ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;

                          setState(() {});

                          formKey.currentState!.save();
                          final personalListProvider =
                              Provider.of<PersonalListProvider>(context,
                                  listen: false);
                          personalListProvider
                              .addElement(_listelement.name,
                                  _listelement.description, _listelement.active)
                              .then((value) {
                            _listelement = value;
                            formKey.currentState!.reset();

                            setState(() {});
                            Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: darkModePrefs == false
                                ? Colors.green
                                : Colors.tealAccent),
                        child: Text(
                          'Guardar',
                          style: TextStyle(
                              color: darkModePrefs == false
                                  ? Colors.white
                                  : Colors.black),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/personal_list.dart';
import 'package:herbafriend/src/providers/db_provider.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:provider/provider.dart';

class EditList extends StatefulWidget {
  EditList({Key? key}) : super(key: key);
   


  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  final formKey = GlobalKey<FormState>();
  late PersonalList _listelement;
  List<String> _typesElement = ['Revision', 'Recordatorio'];
  String _typeValue = "";
  @override
  void initState() {
    super.initState();
    _typeValue = _typesElement.elementAt(0);
    _listelement = PersonalList.update("", "", _typeValue == 'Revision');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.green,
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
                          image: AssetImage('assets/images/logo.png'),
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
                  decoration:
                      InputDecoration(filled: true, labelText: 'Descripcion'),
                  //obscureText: true,
                ),
                Column(
                  children:
                   _typesElement.map((e) => ListTile(
                     title: Text(e),
                     leading: Radio(
                       value: e,
                       groupValue: _typeValue,
                       onChanged: (String? value) {
                         _typeValue = value.toString();
                         _listelement.active = _typeValue == "Revision";
                         setState(() {
                           
                         });
                       },
                     ),
                   )).toList()
                ),
                ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;
                          
                          setState(() {});
                         

                          formKey.currentState!.save();
                          DBProvider.db.updateList(PersonalList(name: _listelement.name, description: _listelement.description, active: _listelement.active)).then((value)  {
                                    
                                    formKey.currentState!.reset();
                                   
                                    setState(() {
                                    });
                                    Navigator.pop(context);
                          });
                        },
                        child: Text('Guardar')
                  
                )
              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
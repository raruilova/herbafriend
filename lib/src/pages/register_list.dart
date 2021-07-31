import 'package:flutter/material.dart';

class RegisterList extends StatefulWidget {
  RegisterList({Key? key}) : super(key: key);

  @override
  _RegisterListState createState() => _RegisterListState();
}

enum SingingCharacter { revision, recordatorio }

class _RegisterListState extends State<RegisterList> {
  final _nameController = TextEditingController();
  final _recordatorioController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.revision;
  @override
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
                child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Nombre'),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  maxLines: 2,
                  controller: _recordatorioController,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Descripcion'),
                  //obscureText: true,
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text('Revision'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.revision,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Recordatorio'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.recordatorio,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            )),
            ButtonBar(
              children: [
                OutlineButton(onPressed: () {}, child: Text('Guardar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

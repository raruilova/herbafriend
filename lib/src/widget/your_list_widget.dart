import 'package:flutter/material.dart';
import 'package:herbafriend/src/providers/db_provider.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:herbafriend/src/widget/edit_list.dart';
import 'package:provider/provider.dart';
import 'package:herbafriend/src/pages/register_list.dart';

class YourListWidget extends StatefulWidget {
  YourListWidget();

  @override
  _YourListWidgetState createState() => _YourListWidgetState();
}

class _YourListWidgetState extends State<YourListWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final personalListProvider =
        Provider.of<PersonalListProvider>(context, listen: true);
    personalListProvider.loadElements();
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              children: <Widget>[
                Text('Herba',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Friend',
                    style: TextStyle(color: Colors.white, fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView.builder(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              itemCount: personalListProvider.elements.length,
              itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.only(top: 35.0),
                  child: Container(
                      child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(5),
                    elevation: 10,
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(15),
                          elevation: 10,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                    personalListProvider.elements[index].name),
                                subtitle:
                                    personalListProvider.elements[index].active
                                        ? Text('Revision')
                                        : Text('Recordatorio'),
                                leading: Icon(Icons.grass),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(personalListProvider
                                    .elements[index].description),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () => {
                                        Navigator.push(context, 
                                        MaterialPageRoute(builder: (context) => EditList())
                                        )
                                      },
                                      child: Text('Editar')),
                                  FlatButton(
                                      onPressed: () => {
                                        DBProvider.db.deleteList(personalListProvider.elements[index].id)
                                      },
                                      child: Text('Eliminar'))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
            ),
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterList(),
                    ));
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

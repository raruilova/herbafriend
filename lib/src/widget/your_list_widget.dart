import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:herbafriend/src/pages/register_list.dart';

class YourListWidget extends StatefulWidget {
  YourListWidget();

  @override
  _YourListWidgetState createState() => _YourListWidgetState();
}

class _YourListWidgetState extends State<YourListWidget> {
  int _selectedIndex = 0;
  bool? darkModePrefs;

  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
  }

  Widget build(BuildContext context) {
    final personalListProvider =
        Provider.of<PersonalListProvider>(context, listen: true);
    personalListProvider.loadElements();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
            height: MediaQuery.of(context).size.height - 280.0,
            decoration: BoxDecoration(
              color: darkModePrefs == false ? Colors.white : Colors.grey[800],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView.builder(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              itemCount: personalListProvider.elements.length,
              itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.only(top: 35.0),
                  child: Container(
                    child: Column(
                      children: [
                        FadeInUp(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 10,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(personalListProvider
                                      .elements[index].name),
                                  subtitle: personalListProvider
                                          .elements[index].active
                                      ? Text('Revision')
                                      : Text('Recordatorio'),
                                  leading: Icon(Icons.grass),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(personalListProvider
                                      .elements[index].description),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
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

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}

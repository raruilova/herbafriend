import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/service/herfriend_service.dart'
    show HerbaFriendService;
import 'package:herbafriend/src/widget/herbafriend_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HerbaFriendService _service = HerbaFriendService();

  List<Recipes> _result = [];

  @override
  void initState() {
    super.initState();
    _loadResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Herbafriend'),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              "Bienvenid@",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text("Remedios"),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      )),
      body: _result.length == 0
          ? Container(
              height: 150.0,
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          _result.map((e) => HerbaFriendCard(e)).toList())),
            ),
    );
  }

  _loadResult() {
    _service.getRecipes().then((value) {
      print(value);
      _result = value;
      setState(() {});
    });
  }
}

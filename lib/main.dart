import 'package:flutter/material.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:herbafriend/src/widget/login_widget.dart';
import 'package:provider/provider.dart';

void main() {
  //colocar en laa raiz de la app, para tener acceso a los datos en toda la app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PersonalListProvider>(create: (_) => PersonalListProvider())
  ],
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Login(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:herbafriend/src/pages/splash.dart';
import 'package:herbafriend/src/providers/personalList_provider.dart';
import 'package:herbafriend/src/providers/app_provider.dart';
import 'package:herbafriend/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  //colocar en laa raiz de la app, para tener acceso a los datos en toda la app
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PersonalListProvider>(
          create: (_) => PersonalListProvider()),
      ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: provider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.green),
            home: SplashScreen(),
          );
        }));
  }
}

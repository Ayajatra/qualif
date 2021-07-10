import 'package:flutter/material.dart';
import 'package:qualif/global.dart';

import 'home.dart';
import 'listdetail.dart';
import 'login.dart';
import 'list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Global.globalState;
}

class MyAppState extends State<MyApp> {
  var theme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/list': (context) => ListPage(),
        '/listdetail': (context) => ListDetailPage(
          ModalRoute.of(context)!.settings.arguments as Map<String, String>
        ),
      },
      initialRoute: '/login',
    );
  }
}
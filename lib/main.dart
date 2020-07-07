import 'package:flutter/material.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'pages/fourPlayer.dart';
import 'pages/home.dart';
import 'background/ctlApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => HomePage(),
        '/fourPlayer': (BuildContext context) => FourPlayerPage(),
        '/PointTable': (BuildContext context) => PointTablePage(),
      },
    );
  }
}

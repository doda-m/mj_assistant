import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'pages/fourPlayer.dart';
import 'pages/threePlayer.dart';
import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
//  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      color: Colors.white,
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => HomePage(),
        '/fourPlayer': (BuildContext context) => FourPlayerPage(),
        '/threePlayer': (BuildContext context) => ThreePlayerPage(),
        '/PointTable': (BuildContext context) => PointTablePage(),
      },
    );
  }
}

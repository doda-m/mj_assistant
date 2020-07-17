import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'pages/playDisplay.dart';
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
        '/playDisplay': (BuildContext context) => PlayDisplayPage(),
        '/PointTable': (BuildContext context) => PointTablePage(),
      },
    );
  }
}

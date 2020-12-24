/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mj_assistant/pages/fixedPoint.dart';
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
        '/pointTable': (BuildContext context) => PointTablePage(),
        '/fixedPoint': (BuildContext context) => FixedPointPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mj_assistant/background/point.dart';
import 'package:mj_assistant/background/ctlApp.dart';

const bool TSUMO = true;
const bool RON = false;

class PointHanTablePage extends StatelessWidget {
  static bool parentFlag = false;

  final ControlApplication ctlApp;
  final int playerIndex;
  final bool grain;

  PointHanTablePage({Key key,this.ctlApp, this.playerIndex, this.grain}) {
    if (ctlApp.getParent() == playerIndex) {
      parentFlag = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: han.length,
        itemBuilder: (context, index) {
          return _viewPoint(han[index]);
        },
      )
    );
  }
  Widget _viewPoint(String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
        }, // 長押し
      ),
    );
  }
}
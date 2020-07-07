import 'package:flutter/material.dart';
import 'package:mj_assistant/background/point.dart';
import 'package:mj_assistant/background/ctlApp.dart';
import 'package:mj_assistant/pages/pointHanTable.dart';

const bool TSUMO = true;
const bool RON = false;

class PointTablePage extends StatelessWidget {
  static bool parentFlag = false;
  final ControlApplication ctlApp;
  final int playerIndex;
  final bool grain;

  PointTablePage({Key key,this.ctlApp, this.playerIndex, this.grain}) {
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
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              itemCount: fuList.length,
              itemBuilder: (context, index) {
                return _viewFu(context, fuList[index]);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              itemCount: pointList.length,
              itemBuilder: (context, index) {
                return _viewFu(context, pointList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _viewFu(BuildContext context, String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey),
            right: BorderSide(width: 1.0, color: Colors.grey),
          )
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0
          ),
        ),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PointHanTablePage(
                ctlApp: ctlApp,
                playerIndex: playerIndex,
                grain: grain,
              )
            )
          );
        }, // タップ
      ),
    );
  }
}
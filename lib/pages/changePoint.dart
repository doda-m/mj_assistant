import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';

class ChangePointPage extends StatefulWidget {
  final ControlApp controlApp;
  final playerID;
  ChangePointPage(this.controlApp, this.playerID);
  @override
  _ChangePointPage createState() => _ChangePointPage(controlApp, playerID);
}

class _ChangePointPage extends State<ChangePointPage> {
  final ControlApp controlApp;
  final playerID;
  int score;
  _ChangePointPage(this.controlApp, this.playerID):
        score = controlApp.players[playerID].score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
            keyboardType: TextInputType.number,
            initialValue: score.toString(),
            onChanged: (value) {
              score = int.tryParse(value) ?? controlApp.players[playerID].score;
            },
          ),
          Center(
            child: RaisedButton(
              child: Text('確定'),
              onPressed: () {
                  controlApp.players[playerID].setScore(score);
                  Navigator.of(context).pop();
              }
            ),
          )
//          const SizedBox(height: 10),
//          Container(
//            color: Colors.white10,
//            alignment: Alignment.center,
//            child: Text('yes'),
//          ),
//          Flexible(
//            child: GridView.count(
//                crossAxisCount: 4,
//                children: [
//                  Container(width: 1,height: 1,color: Colors.redAccent,),
//                  Container(width: 1,height: 1,color: Colors.blueAccent,),
//                  Container(width: 1,height: 1,color: Colors.greenAccent,),
//                  Container(width: 1,height: 1,color: Colors.greenAccent,),
//                ]
//            ),
//          ),
        ],
      ),
    );
  }
}
//
//class Button extends StatelessWidget {
//  final _key;
//  Button(this._key);
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: FlatButton(
//          child: Center(
//            child: Text(
//              _key,
//              style: TextStyle(fontSize: 46.0),
//            ),
//          ),
//        )
//    );
//  }
//}

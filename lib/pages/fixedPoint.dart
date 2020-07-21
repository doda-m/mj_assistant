import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/point.dart';


class FixedPointPage extends StatelessWidget {
  final ControlApp controlApp;
  final int winner;
  final int looser;
  final bool isTsumo;
  List<String> _table;

  FixedPointPage({Key key,this.controlApp, this.winner, this.isTsumo, this.looser});

  bool get parentFlag => controlApp.players[winner].isParent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox( height: 50, width:  100,
            child: RaisedButton(
              child: Text('1翻'),
              onPressed: () {
                return _confirmAlert(context, 0);
              },
            ),
          ),
          RaisedButton(
            child: Text('2翻'),
            onPressed: () => _confirmAlert(context, 0),
          ),
          RaisedButton(
            child: Text('3翻'),
            onPressed: () => _confirmAlert(context, 0),
          ),
          RaisedButton(
            child: Text('満貫 (4,5翻)'),
            onPressed: () => _confirmAlert(context, 0),
          ),
          RaisedButton(
            child: Text('跳満 (6,7翻)'),
            onPressed: () => _confirmAlert(context, 0),
          ),
          RaisedButton(
            child: Text('倍満 (8, 9, 10翻)'),
            onPressed: () => _confirmAlert(context, 0),
          ),

        ],
      ),
    );
  }

  Widget _confirmAlert(BuildContext context, int han) {
    return AlertDialog(
      title: Text('${_table[han]} でよろしいですか?'),
      actions: [
        FlatButton(
          child: Text('OK', style: TextStyle(color: Colors.redAccent,),),
          onPressed: () {
            if(isTsumo)
              controlApp.tsumo(winner: winner, fu: 0, han: han);
            else
              controlApp.ron(winner: winner, looser: looser, fu: 0, han: han);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
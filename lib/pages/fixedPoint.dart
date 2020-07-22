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
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('1翻'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0,'1翻'),),
              ),
              RaisedButton(
                child: Text('2翻'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '2翻'),),
              ),
              RaisedButton(
                child: Text('3翻'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '3翻'),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('満貫 (4, 5翻)'),
                onPressed: () => showDialog( context: context,
                    builder: (BuildContext context) => _confirmAlert(context, 0, '満貫 (4, 5翻)'),),
              ),
              RaisedButton(
                child: Text('跳満 (6, 7翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '跳満 (6, 7翻)'),),
              ),
              RaisedButton(
                child: Text('倍満 (8 ~ 10翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '倍満 (8 ~ 10翻)'),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('三倍満 (11, 12翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '三倍満 (11, 12翻)'),)
              ),
              RaisedButton(
                child: Text('役満 (13翻以上)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, '役満 (13翻以上)'),),
              ),
            ],
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget _confirmAlert(BuildContext context, int han, String title) {
    return AlertDialog(
      title: Text('$title でよろしいですか?'),
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
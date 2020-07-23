import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';


class FixedPointPage extends StatelessWidget {
  final ControlApp controlApp;
  final int winner;
  final int looser;
  final bool isTsumo;

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
                  builder: (BuildContext context) => _confirmAlert(context, 1, '2翻'),),
              ),
              RaisedButton(
                child: Text('3翻'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 2, '3翻'),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('満貫 (4, 5翻)'),
                onPressed: () => showDialog( context: context,
                    builder: (BuildContext context) => _confirmAlert(context, 3, '満貫 (4, 5翻)'),),
              ),
              RaisedButton(
                child: Text('跳満 (6, 7翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 4, '跳満 (6, 7翻)'),),
              ),
              RaisedButton(
                child: Text('倍満 (8 ~ 10翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 5, '倍満 (8 ~ 10翻)'),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('三倍満 (11, 12翻)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 6, '三倍満 (11, 12翻)'),)
              ),
              RaisedButton(
                child: Text('役満 (13翻以上)'),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 7, '役満 (13翻以上)'),),
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
              controlApp.fixedTsumo(winner: winner, han: han,);
            else
              controlApp.fixedRon(winner: winner, looser: looser, han: han);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
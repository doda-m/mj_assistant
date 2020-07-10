import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/point.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

const bool TSUMO = true;
const bool RON = false;

class PointTablePage extends StatelessWidget {
  final ControlApp controlApp;
  final int winner;
  final int looser;
  final bool isTsumo;

  PointTablePage({Key key,this.controlApp, this.winner, this.isTsumo, this.looser});

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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.lightBlueAccent[100],
                    child: Text('満貫', textAlign: TextAlign.center,),
                    onPressed: () {
                      if (isTsumo)
                        controlApp.tsumo(winner: winner, fu: 11, han: 0,);
                      else {
                        controlApp.ron(winner: winner, looser: looser, fu: 11, han: 0);
                      }
                      Navigator.of(context).pop();
                    }
                ),
                RaisedButton(
                    color: Colors.lightGreenAccent[100],
                    child: Text('跳満', textAlign: TextAlign.center,),
                    onPressed: () {
                      if (isTsumo)
                        controlApp.tsumo(winner: winner, fu: 11, han: 1,);
                      else {
                        controlApp.ron(winner: winner, looser: looser, fu: 11, han: 1);
                      }
                      Navigator.of(context).pop();
                    }
                ),
                RaisedButton(
                    color: Colors.yellow[100],
                    child: Text('倍満', textAlign: TextAlign.center,),
                    onPressed: () {
                      if (isTsumo)
                        controlApp.tsumo(winner: winner, fu: 11, han: 2,);
                      else {
                        controlApp.ron(winner: winner, looser: looser, fu: 11, han: 2);
                      }
                      Navigator.of(context).pop();
                    }
                ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  color: Colors.orangeAccent[100],
                  child: Text('三倍満', textAlign: TextAlign.center,),
                  onPressed: () {
                    if (isTsumo)
                      controlApp.tsumo(winner: winner, fu: 11, han: 3,);
                    else {
                      controlApp.ron(winner: winner, looser: looser, fu: 11, han: 3);
                    }
                    Navigator.of(context).pop();
                  }
              ),
              RaisedButton(
                  color: Colors.redAccent[100],
                  child: Text('役満', textAlign: TextAlign.center,),
                  onPressed: () {
                    if (isTsumo)
                      controlApp.tsumo(winner: winner, fu: 11, han: 4,);
                    else {
                      controlApp.ron(winner: winner, looser: looser, fu: 11, han: 4);
                    }
                    Navigator.of(context).pop();
                  }
              ),
            ],
          ),
          _generatePointTable(context),
        ],
      ),
    );
  }

  Widget _generatePointTable(BuildContext context) {
    return Container(
      height: 505,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 60,
        rightHandSideColumnWidth: 420,
        isFixedHeader: true,
        headerWidgets: _generateHeader(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateTable,
        itemCount: fuList.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
      ),
    );
  }

  List<Widget> _generateHeader() {
    return [
      Container(width: 60, height: 50,
        alignment: Alignment.center,
        color: Colors.greenAccent[100],
        child: Text('--', textAlign: TextAlign.center,),
      ),
      Container(width: 105, height: 50,
        alignment: Alignment.center,
        color: Colors.greenAccent[100],
        child: Text('1翻', textAlign: TextAlign.center,),
      ),
      Container(width: 105, height: 50,
        alignment: Alignment.center,
        color: Colors.greenAccent[100],
        child: Text('2翻', textAlign: TextAlign.center,),
      ),
      Container(width: 105, height: 50,
        alignment: Alignment.center,
        color: Colors.greenAccent[100],
        child: Text('3翻', textAlign: TextAlign.center,),
      ),
      Container(width: 105, height: 50,
        alignment: Alignment.center,
        color: Colors.greenAccent[100],
        child: Text('4翻', textAlign: TextAlign.center,),
      ),
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(fuList[index], textAlign: TextAlign.center,),
      width: 60,
      height: 40,
      color: Colors.greenAccent[100],
      alignment: Alignment.center,
    );
  }

  Widget _generateTable(BuildContext context, int fu) {
    List _table = childTable;
    if (true == parentFlag) {
      _table = parentTable;
    }

    return Row(
      children: [
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            child: Text(_table[fu][0], textAlign: TextAlign.center,),
            onPressed: () {
              if (2 <= fu) {
                if (isTsumo)
                  controlApp.tsumo(winner: winner, fu: fu, han: 0,);
                else
                  controlApp.ron(winner: winner, looser: looser, fu: fu, han: 0);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            color: Colors.grey[200],
            child: Text(_table[fu][1], textAlign: TextAlign.center,),
            onPressed: () {
              if (isTsumo)
                controlApp.tsumo(winner: winner, fu: fu, han: 1,);
              else
                controlApp.ron(winner: winner, looser: looser, fu: fu, han: 1);
              Navigator.of(context).pop();
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            child: Text(_table[fu][2], textAlign: TextAlign.center,),
            onPressed: () {
              if (5 >= fu) {
                if (isTsumo)
                  controlApp.tsumo(winner: winner, fu: fu, han: 2,);
                else
                  controlApp.ron(winner: winner, looser: looser, fu: fu, han: 2);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            color: Colors.grey[200],
            child: Text(_table[fu][3], textAlign: TextAlign.center,),
            onPressed: () {
              if (2 >= fu) {
                if (isTsumo)
                  controlApp.tsumo(winner: winner, fu: fu, han: 3,);
                else
                  controlApp.ron(winner: winner, looser: looser, fu: fu, han: 3);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

}
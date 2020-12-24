/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/point.dart';

const bool TSUMO = true;
const bool RON = false;

class PointTablePage extends StatelessWidget {
  final ControlApp controlApp;
  final int winner;
  final int looser;
  final bool isTsumo;
  List _table;

  PointTablePage({Key key,this.controlApp, this.winner, this.isTsumo, this.looser}) {
    if (!parentFlag) {
      if (isTsumo) {
        if(controlApp.rule.isLossTsumo)
          _table = childTsumoTable;
        else
          _table = childNoLossTsumoTable;
      }
      else
        _table = childRonTable;
    }
    else {
      if(isTsumo) {
        if(controlApp.rule.isLossTsumo)
          _table = parentTsumoTable;
        else
          _table = parentNoLossTsumoTable;
      }
      else
        _table = parentRonTable;
    }
  }

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
                  color: Colors.blue,
                  child: Text('満貫',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => _confirmAlert(context, 11, 0),
                  ),
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text('跳満',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => _confirmAlert(context, 11, 1),
                  ),
                ),
                RaisedButton(
                  color: Colors.yellow[700],
                  child: Text('倍満',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => _confirmAlert(context, 11, 2),
                  ),
                ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Colors.orange[700],
                child: Text('三倍満',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 11, 3),
                ),
              ),
              RaisedButton(
                color: Colors.red[400],
                child: Text('役満',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 11, 4),
                ),
              ),
            ],
          ),
          _generatePointTable(context),
        ],
      ),
    );
  }

  Widget _generatePointTable(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: han.map((item) => Text(item, textAlign: TextAlign.center,)).toList(),
        ),
        TableRow(
          children: [
            const Text('20符', textAlign: TextAlign.center),
            const Text('--', textAlign: TextAlign.center),
            (isTsumo)?
            FlatButton(
              child: Text(_table[0][1], textAlign: TextAlign.center),
              onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 0, 1),),
            ): const Text('--', textAlign: TextAlign.center),
            (isTsumo)?
            FlatButton(
              child: Text(_table[0][2], textAlign: TextAlign.center),
              onPressed: () => showDialog( context: context,
                builder: (BuildContext context) => _confirmAlert(context, 0, 2),),
            ): const Text('--', textAlign: TextAlign.center),
            (isTsumo)?
            FlatButton(
              child: Text(_table[0][3], textAlign: TextAlign.center),
              onPressed: () => showDialog( context: context,
                builder: (BuildContext context) => _confirmAlert(context, 0, 3),),
            ): const Text('--', textAlign: TextAlign.center),
          ]
        ),
        TableRow(
            children: [
              const Text('25符', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
              (isTsumo)?
              const Text('--', textAlign: TextAlign.center)
              :FlatButton(
                child: Text(_table[1][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 1, 1),),
              ),
              FlatButton(
                child: Text(_table[1][2], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 1, 2),),
              ),
              FlatButton(
                child: Text(_table[1][3], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 1, 3),),
              ),
            ]
        ),
        TableRow(
            children: [
              const Text('30符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[2][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 2, 0),),
              ),
              FlatButton(
                child: Text(_table[2][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 2, 1),),
              ),
              FlatButton(
                child: Text(_table[2][2], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 2, 2),),
              ),
              FlatButton(
                child: Text(_table[2][3], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 2, 3),),
              ),
            ]
        ),
        TableRow(
            children: [
              const Text('40符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[3][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 3, 0),),
              ),
              FlatButton(
                child: Text(_table[3][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 3, 1),),
              ),
              FlatButton(
                child: Text(_table[3][2], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 3, 2),),
              ),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('50符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[4][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 4, 0),),
              ),
              FlatButton(
                child: Text(_table[4][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 4, 1),),
              ),
              FlatButton(
                child: Text(_table[4][2], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 4, 2),),
              ),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('60符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[5][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 5, 0),),
              ),
              FlatButton(
                child: Text(_table[5][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 5, 1),),
              ),
              FlatButton(
                child: Text(_table[5][2], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 5, 2),),
              ),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('70符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[6][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 6, 0),),
              ),
              FlatButton(
                child: Text(_table[6][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 6, 1),),
              ),
              const Text('--', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('80符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[7][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 7, 0),),
              ),
              FlatButton(
                child: Text(_table[7][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 7, 1),),
              ),
              const Text('--', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('90符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[8][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 8, 0),),
              ),
              FlatButton(
                child: Text(_table[8][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 8, 1),),
              ),
              const Text('--', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('100符', textAlign: TextAlign.center),
              FlatButton(
                child: Text(_table[9][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 9, 0),),
              ),
              FlatButton(
                child: Text(_table[9][1], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 9, 1),),
              ),
              const Text('--', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
        TableRow(
            children: [
              const Text('110符', textAlign: TextAlign.center),
              (isTsumo)?
              const Text('--', textAlign: TextAlign.center):
              FlatButton(
                child: Text(_table[10][0], textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 10, 0),),
              ),
              FlatButton(
                child: Text(_table[10][1].toString(), textAlign: TextAlign.center),
                onPressed: () => showDialog( context: context,
                  builder: (BuildContext context) => _confirmAlert(context, 10, 1),),
              ),
              const Text('--', textAlign: TextAlign.center),
              const Text('--', textAlign: TextAlign.center),
            ]
        ),
      ],
    );
  }

  Widget _confirmAlert(BuildContext context, int fu, int han) {
    return AlertDialog(
      title: (fu > 10)?
      Text('${pointList[han]} でよろしいですか?')
      :Text('${_table[fu][han].replaceAll('\n', ' ')} でよろしいですか?'),
      actions: [
        FlatButton(
          child: const Text('はい', style: const TextStyle(color: Colors.redAccent,),),
          onPressed: () {
            if(isTsumo)
              controlApp.tsumo(winner: winner, fu: fu, han: han);
            else
              controlApp.ron(winner: winner, looser: looser, fu: fu, han: han);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: const Text('いいえ', style: const TextStyle(color: Colors.redAccent,),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
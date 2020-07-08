import 'package:flutter/material.dart';
import 'package:mj_assistant/background/point.dart';
import 'package:mj_assistant/background/ctlApp.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

const bool TSUMO = true;
const bool RON = false;

class PointTablePage extends StatelessWidget {
  static bool parentFlag = false;
  final ControlApplication ctlApp;
  final int playerIndex;
  final bool grain;

  PointTablePage({Key key,this.ctlApp, this.playerIndex, this.grain}) {
    if (ctlApp.getParent() == playerIndex)
      parentFlag = true;
    else
      parentFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
          ),
          Text('点数早見表'),
          _generatePointTable(context),
        ],
      ),
    );
  }

  Widget _generatePointTable(BuildContext context) {
    return Container(
      height: 500,
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
      Container(
        width: 60,
        height: 30,
        child: Text('--', textAlign: TextAlign.center,),
      ),
      Container(
        width: 105,
        height: 30,
        child: Text('1翻', textAlign: TextAlign.center,),
      ),
      Container(
        width: 105,
        height: 30,
        child: Text('2翻', textAlign: TextAlign.center,),
      ),
      Container(
        width: 105,
        height: 30,
        child: Text('3翻', textAlign: TextAlign.center,),
      ),
      Container(
        width: 105,
        height: 30,
        child: Text('4翻', textAlign: TextAlign.center,),
      ),
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(fuList[index], textAlign: TextAlign.center,),
      width: 60,
      height: 40,
      alignment: Alignment.center,
    );
  }

  Widget _generateTable(BuildContext context, int index) {
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
            child: Text(_table[index][0], textAlign: TextAlign.center,),
            onPressed: () {
              if (2 > index) { null; }
              else {
                ctlApp.tsumo(playerIndex, index, 0);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            child: Text(_table[index][1], textAlign: TextAlign.center,),
            onPressed: () {
              ctlApp.tsumo(playerIndex, index, 1);
              Navigator.of(context).pop();
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            child: Text(_table[index][2], textAlign: TextAlign.center,),
            onPressed: () {
              if (5 < index) { null; }
              else {
                ctlApp.tsumo(playerIndex, index, 2);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        Container(
          height: 40,
          width: 105,
          child: FlatButton(
            child: Text(_table[index][3], textAlign: TextAlign.center,),
            onPressed: () {
              if (2 < index) { null; }
              else {
                ctlApp.tsumo(playerIndex, index, 3);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

}
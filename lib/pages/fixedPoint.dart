import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/point.dart';


class FixedPointPage extends StatelessWidget {
  final ControlApp controlApp;
  final int winner;
  final int looser;
  final bool isTsumo;

  FixedPointPage({Key key,this.controlApp, this.winner, this.isTsumo, this.looser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: ,
    );
  }
}
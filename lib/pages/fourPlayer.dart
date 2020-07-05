import 'package:flutter/material.dart';
import 'package:mj_assistant/background/ctlPoint.dart';

class FourPlayerPage extends StatefulWidget {
  @override
  _FourPlayerState createState() => _FourPlayerState();
}

class _FourPlayerState extends State<FourPlayerPage> {
  final ControlPlayerPoint _controlPlayerPoint = ControlPlayerPoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('四人麻雀'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: RotatedBox(
              quarterTurns: 2,
              child: _playerDisplay(2),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.lightBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 4,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: _playerDisplay(3),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 4,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: _playerDisplay(1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: _playerDisplay(0),
          ),
        ],
      )
    );
  }

  Widget _playerDisplay(int _index) {
    return Center(
        child: Column(
          children: [
            Container(
              height: 30,
                child: Center(
                  child: Text(_controlPlayerPoint.readPoint(_index).toString(),
                  style: TextStyle(
                    fontSize: 30
                  ),),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("Ron"),
                  onPressed: () {
                    null;
                  },
                ),
                const SizedBox(width: 5, height: 0,),
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text("Tsumo"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/tsumoPointTable');
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }
}

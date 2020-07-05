import 'package:flutter/material.dart';
import 'package:mj_assistant/background/effectDisplay.dart';
import 'package:mj_assistant/background/ctlPlayer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourPlayerPage extends StatefulWidget {
  @override
  _FourPlayerState createState() => _FourPlayerState();
}

class _FourPlayerState extends State<FourPlayerPage> {
  ControlPlayer ctlPlayer;
  EffectDisplay effectDisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('四人麻雀'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
            if (snapshot.hasData) {
               ctlPlayer = ControlPlayer(snapshot.data);
               effectDisplay = EffectDisplay(snapshot.data);
               if (null == ctlPlayer.ctlPoint.readPoint(0).toString()) {
                 setState(() {
                   ctlPlayer.reset();
                   effectDisplay.reset();
                 });
               }
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 6,
                    color: Colors.greenAccent,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: _playerDisplay(2),
                    )
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.greenAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: _centerDisplay(),
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
                  height: MediaQuery.of(context).size.height / 6,
                  color: Colors.greenAccent,
                  child: _playerDisplay(0),
                ),
                _controlDisplay(),
              ],
            );
          }
      ),
    );
  }

  Widget _playerDisplay(int _index) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              child: Center(
                child: RaisedButton(
                  color: ctlPlayer.reachStatus(_index),
                  child: Text('リーチ',),
                  onPressed: () {
                    setState(() {
                      ctlPlayer.reach(_index);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 0, height: 2,),
            Container(
              height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('東',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                    const SizedBox(width: 5, height: 0,),
                    Center(
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(ctlPlayer.ctlPoint.readPoint(_index).toString(),
                            style: TextStyle(
                                fontSize: 28
                            ),),
                          onPressed: () {
                            null;
                          },
                        )
                    ),
                  ],
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("ロン"),
                  onPressed: () {
                    null;
                  },
                ),
                const SizedBox(width: 5, height: 0,),
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text("ツモ"),
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

  Widget _controlDisplay() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      color: Colors.grey,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("次局"),
            onPressed: () {
              null;
            },
          ),
          RaisedButton(
            child: Text("連荘"),
            onPressed: () {
              null;
            },
          ),
          RaisedButton(
            child: Text("親決め"),
            onPressed: () {
              null;
            },
          ),
          RaisedButton(
            child: Text("リセット"),
            onPressed: () {
              setState(() {
                ctlPlayer.reset();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _centerDisplay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("東",
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ],
    );
  }
}

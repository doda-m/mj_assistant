import 'package:flutter/material.dart';
import 'package:mj_assistant/background/ctlApp.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const bool TSUMO = true;
const bool RON = false;

class FourPlayerPage extends StatefulWidget {
  @override
  _FourPlayerState createState() => _FourPlayerState();
}

class _FourPlayerState extends State<FourPlayerPage> {
  ControlApplication ctlApp;
  bool decideParent = false;

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
               ctlApp = ControlApplication(snapshot.data);
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
                  color: ctlApp.ctlPlayer.reachStatus(_index),
                  child: Text('リーチ',),
                  onPressed: () {
                    setState(() {
                      ctlApp.ctlPlayer.reach(_index);
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
                    _myWind(_index),
                    const SizedBox(width: 5, height: 0,),
                    Center(
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(ctlApp.ctlPlayer.ctlPoint.readPoint(_index).toString(),
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
                    Navigator.push(
                        this.context,
                        MaterialPageRoute(
                            builder: (context) => PointTablePage(
                              ctlApp: ctlApp,
                              playerIndex: _index,
                              grain: TSUMO,
                            )
                        )
                    );
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
//      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("次局"),
                onPressed: () {
                  setState(() {
                    ctlApp.nextStation();
                  });
                },
              ),
              RaisedButton(
                child: Row(
                  children: [
                    Text("連荘"),
                    Icon(Icons.add),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    ctlApp.incrementPlace();
                  });
                },
              ),
              RaisedButton(
                child: Row(
                  children: [
                    Text("連荘"),
                    Icon(Icons.remove),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    ctlApp.decreasePlace();
                  });
                },
              ),
              ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("親決め"),
                onPressed: () {
                  setState(() {
                    decideParent = true;
                  });
                  null;
                },
              ),
              RaisedButton(
                child: Text("リセット"),
                onPressed: () {
                  setState(() {
                    ctlApp.reset();
                  });
                },
              ),
            ],
          ),
        ],
      ),

    );
  }

  Widget _centerDisplay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(ctlApp.getStation(),
        style: TextStyle(
          fontSize: 25,
        ),
        ),
        Text(ctlApp.getPlace().toString() + '本場',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _myWind(int index) {
    if (false == decideParent) {
      return Text(ctlApp.getWind(index),
        style: TextStyle(
          fontSize: 20,
        ),
      );
    }
    else {
      return SizedBox(
        width: 60,
        child: RaisedButton(
          color: Colors.redAccent,
            child: Center (
              child: Text('親',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
            ),
          onPressed: () {
            setState(() {
              ctlApp.setParent(index);
              decideParent = false;
            });
          },
        ),
      );
    }
  }
}

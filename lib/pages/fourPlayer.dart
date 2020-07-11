import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/player.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const bool TSUMO = true;
const bool RON = false;

class FourPlayerPage extends StatefulWidget {
  @override
  _FourPlayerState createState() => _FourPlayerState();
}

class _FourPlayerState extends State<FourPlayerPage> {
  ControlApp controlApp = ControlApp(4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('四人麻雀'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
            if (snapshot.hasData) {
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
                        width: MediaQuery.of(context).size.width / 3,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: _playerDisplay(3),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.greenAccent,
                        child: _centerDisplay(),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
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

  Widget _playerDisplay(int playerID) {
    final player = controlApp.players[playerID];
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              child: Center(
                child: RaisedButton(
                  color: player.isReach ? Colors.redAccent: Colors.grey,
                  child: Text('リーチ',),
                  onPressed: () {
                    setState(() {
                      controlApp.toggleReach(playerID);
                    });
                  },
                ),
              ),
            ),
            Container(
              height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('${ControlApp.WIND_NAME[player.wind]}',
                    style: TextStyle(fontSize: 20,),
                  ),
                    const SizedBox(width: 10, height: 0,),
                    _pointDisplay(playerID, player)

                  ],
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ronDisplay(playerID),
                const SizedBox(width: 5, height: 0,),
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text("ツモ"),
                  onPressed: () {
                    Navigator.push(
                        this.context,
                        MaterialPageRoute(
                            builder: (context) => PointTablePage(
                              controlApp: controlApp,
                              winner: playerID,
                              isTsumo: TSUMO,
                            )
                        )
                    ).then((value) {
                      setState(() {
                      });
                    });
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }

  Widget _pointDisplay(int _playerID, Player _player) {
    return Container(
      width: 140,
      child: RaisedButton(
        color: Colors.white,
        child: controlApp.inDiffPoint ?
        Text('${_player.point - controlApp.players[controlApp.diffBasePlayer].point}', style: TextStyle(fontSize: 28)):
        Text('${_player.point}', style: TextStyle(fontSize: 28),),
        onPressed: () {
          setState(() {
            if (!controlApp.inDiffPoint)
              controlApp.diffPointMode(_playerID);
            else
              controlApp.diffPointMode(_playerID);
          });
        },
      ),
    );
  }

  Widget _ronDisplay(int _playerID) {
    if (controlApp.ronPlayer == _playerID) {
      return RaisedButton(
        color: Colors.blueGrey,
        child: Text("戻る"),
        onPressed: () {
          setState(() {
            controlApp.toggleInRon(_playerID);
          });
        },
      );
    }
    else{
      return RaisedButton(
        color: controlApp.inRon ? Colors.redAccent:Colors.blueAccent,
        child: controlApp.inRon ? Text("放銃"):Text('ロン'),
        onPressed: () {
          if (controlApp.inRon) {
            Navigator.push(
                this.context,
                MaterialPageRoute(
                    builder: (context) => PointTablePage(
                      controlApp: controlApp,
                      winner: controlApp.ronPlayer,
                      looser: _playerID,
                      isTsumo: RON,
                    )
                )
            ).then((value) {
              setState(() {
                controlApp.toggleInRon(controlApp.ronPlayer);
              });
            });
          }
          else {
            setState(() {
              controlApp.toggleInRon(_playerID);
            });
          }
        },
      );
    }
  }

  Widget _controlDisplay() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
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
                    controlApp.nextRound();
                  });
                },
              ),
              RaisedButton(
                child: Text("流局"),
                onPressed: () {
                  setState(() {
                    controlApp.stackRound();
                  });
                },
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Row(
                  children: [
                    Text("連荘"),
                    Icon(Icons.add),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    controlApp.incrementStack();
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
                    controlApp.decresementStack();
                  });
                },
              ),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("リセット"),
                onPressed: () {
                  setState(() {
                    controlApp = ControlApp(controlApp.playerNum);
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
    String reachBetNum = (controlApp.reachBets / 1000).toStringAsFixed(0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${ControlApp.WIND_NAME[controlApp.wind]}${ControlApp.ROUND_NAME[controlApp.round]}',
              style: TextStyle(fontSize: 25,),
            ),
            Text('${controlApp.stack} 本場',
              style: TextStyle(fontSize: 20,),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/app/thousand.png',
                  width: MediaQuery.of(context).size.width / 6,
                ),
                Text(' x $reachBetNum'),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/app/hundred.png',
                  width: MediaQuery.of(context).size.width / 6,
                ),
                Text(' x ${controlApp.stack}'),
              ],
            ),
          ],
        ),
      ],
    );
  }

}

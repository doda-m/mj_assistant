import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/player.dart';
import 'package:mj_assistant/pages/alert.dart';
import 'package:mj_assistant/pages/pointTable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const bool TSUMO = true;
const bool RON = false;

class PlayDisplayPage extends StatefulWidget {
  final bool isFourVer;
  PlayDisplayPage({@required this.isFourVer});
  @override
  _PlayDisplayState createState() => _PlayDisplayState(isFourVer);
}

class _PlayDisplayState extends State<PlayDisplayPage> {
  ControlApp controlApp;
  _PlayDisplayState(bool isFourVer):
        controlApp = (isFourVer)? ControlApp(4):ControlApp(3);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showConfirmAlert,
      child: Scaffold(
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
                            child: (4 == controlApp.playerNum)? _playerDisplay(3):null,
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: (player.isParent)? Colors.red:Colors.black,
                    ),
                  ),
                    const SizedBox(width: 10, height: 0,),
                    _scoreDisplay(playerID, player),
                    const SizedBox(width: 10, height: 0,),
                  ],
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ronDisplay(playerID),
                const SizedBox(width: 5, height: 0,),
                _tsumoDisplay(playerID),
                const SizedBox(width: 5, height: 0,),
                Container(
                  height: 25,
                  width: 35,
                  child: RaisedButton(
                    color: (player.isStarter) ? Colors.redAccent[200]:Colors.white30,
                    child: Text('${ControlApp.WIND_NAME[controlApp.wind]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),),
                    onPressed: () {
                      if (controlApp.inSetStarter) {
                        setState(() {
                          controlApp.setStarter(playerID);
                        });
                      }
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
    );
  }

  Widget _scoreDisplay(int _playerID, Player _player) {
    return Container(
      width: 140,
      child: RaisedButton(
        color: Colors.white,
        child: controlApp.inDiffScore ?
        Text('${_player.score - controlApp.players[controlApp.diffBasePlayer].score}', style: TextStyle(fontSize: 28)):
        Text('${_player.score}', style: TextStyle(fontSize: 28),),
        onPressed: () {
          setState(() {
            if (!controlApp.inDiffScore)
              controlApp.diffScoreMode(_playerID);
            else
              controlApp.diffScoreMode(_playerID);
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
        color: controlApp.inRon ? Colors.redAccent[100]:Colors.blueAccent,
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
                _showConfirmAlert(func: 2);
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

  Widget _tsumoDisplay(int _playerID) {
    if (controlApp.inDrawn) {
      return RaisedButton(
        color: (controlApp.players[_playerID].isWaitingHand) ? Colors.redAccent[100]:Colors.grey,
        child: (controlApp.players[_playerID].isWaitingHand) ? Text('聴牌'):Text('ノーテン'),
        onPressed: () {
          setState(() {
            controlApp.players[_playerID].toggleWaitingHand();
          });
        },
      );
    }
    else {
      return RaisedButton(
        color: Colors.lightBlueAccent,
        child: Text("ツモ"),
        onPressed: () {
          Navigator.push(
              this.context,
              MaterialPageRoute(
                  builder: (context) => PointTablePage(
                    controlApp: controlApp,
                    winner: _playerID,
                    isTsumo: TSUMO,
                  )
              )
          ).then((value) {
            setState(() {
            });
          });
        },
      );
    }
  }

  Widget _controlDisplay() {
    return Container(
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
                color: (controlApp.inDrawn) ? Colors.redAccent[100]:null,
                child: (controlApp.inDrawn) ? Text('確定'):Text("流局"),
                onPressed: () {
                  if (controlApp.inDrawn) {
                    setState(() {
                      controlApp.drawn();
                    });
                  }
                  else {
                    setState(() {
                      controlApp.toggleDrawn();
                    });
                  }
                },
              ),
              RaisedButton(
                child: Text("前局"),
                onPressed: () {
                  setState(() {
                    controlApp.backRound();
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
                child: Text("親決め"),
                color: (controlApp.inSetStarter) ? Colors.redAccent[100]:null,
                onPressed: () {
                  _showConfirmAlert(func: 1);
                },
              ),
              RaisedButton(
                child: Text("リセット"),
                onPressed: () {
                  _showConfirmAlert();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> _showConfirmAlert({int func}) {
    print(func);
    func = (null == func)? 0:func;
    print(func);
    AlertParameter alertPara = AlertParameter(func);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(alertPara.title),
        content: Text(alertPara.content),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                controlApp = alertPara.resultInOK(controlApp);
                Navigator.of(context).pop(true);
              });
            },
            child: Text(alertPara.yesButton, style: TextStyle(color: Colors.red),),
          ),
          (2 == func)? FlatButton(
            onPressed: () {
              setState(() {
                controlApp.incrementStack();
                Navigator.of(context).pop(true);
              });
            },
            child: Text(alertPara.extraButton, style: TextStyle(color: Colors.redAccent),),
          ): null,
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(alertPara.noButton, style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    ) ??
        false;
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
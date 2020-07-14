import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mj_assistant/background/point.dart';
import 'player.dart';

class ControlApp {
  static const List<String> WIND_NAME = ['東', '南', '西', '北'];
  static const List<String> ROUND_NAME = ['一局', '二局', '三局', '四局'];
  final List<Player> players;
  int _prevalentWind;
  int _round;
  int _stack;
  int _reachBets;
  bool _inDrawn = false;
  bool _inRon = false;
  int _ronPlayer = -1;
  bool _inDiffScore = false;
  int _diffBasePlayer = -1;
  int get playerNum => players.length;
  int get currentParent => players.indexWhere((element) => element.isParent);


  ControlApp(int playerNum):
        _prevalentWind = 0,
        _round = 0,
        _stack = 0,
        _reachBets = 0,
        players = List.generate(playerNum, (index) => Player(index, playerNum, index, index == 0));

  int get wind => _prevalentWind;
  int get round => _round;
  int get stack => _stack;
  int get reachBets => _reachBets;
  bool get inRon => _inRon;
  int get ronPlayer => _ronPlayer;
  bool get inDiffScore => _inDiffScore;
  int get diffBasePlayer => _diffBasePlayer;
  bool get inDrawn => _inDrawn;
  void incrementStack() => _stack++;
  void decresementStack() => (0 == _stack) ? null:_stack--;

  void nextRound() {
    _round = (_round + 1) % playerNum;
    if (0 == _round)
      _prevalentWind = (_prevalentWind + 1) % playerNum;
    _stack = 0;
    for (Player player in players) {
      player.nextRound((player.wind + playerNum - 1) % playerNum);
    }
  }

  void backRound() {
    _round = (_round - 1) % playerNum;
    if (3 == _round)
      _prevalentWind = (_prevalentWind - 1) % playerNum;
    _stack = 0;
    for (Player player in players) {
      player.nextRound((player.wind + 1) % playerNum);
    }
  }

  void stackRound() {
    _stack++;
    for (Player player in players) {
      player.nextRound(player.wind);
    }
  }

  void toggleReach(int playerIndex) {
    final point = players[playerIndex].toggleReach();
    _reachBets += point;
  }

  void toggleInRon(int playerIndex) {
    _inRon ? _ronPlayer = -1: _ronPlayer = playerIndex;
    _inRon = !_inRon;
  }

  void diffScoreMode(int basePlayerIndex) {
    _inDiffScore ? _diffBasePlayer = -1: _diffBasePlayer = basePlayerIndex;
    _inDiffScore = !_inDiffScore;
  }

  void toggleDrawn() {
    _inDrawn = !_inDrawn;
  }

  void drawn() {
    List<int> waitingHandPlayer = [];
    List<int> unWaitingHandPlayer = [];
    for (int i = 0; i < playerNum; i++) {
      if (players[i].isWaitingHand)
        waitingHandPlayer.add(i);
      else
        unWaitingHandPlayer.add(i);
    }

    switch(waitingHandPlayer.length) {
      case 0:
        break;
      case 1: {
          waitingHandPlayer.forEach((element) {
            players[element].addPoint(3000);
          });
          unWaitingHandPlayer.forEach((element) {
            players[element].addPoint(-1000);
          });
          break;
        }
      case 2: {
        waitingHandPlayer.forEach((element) {
          players[element].addPoint(1500);
        });
        unWaitingHandPlayer.forEach((element) {
          players[element].addPoint(-1500);
        });
        break;
      }
      case 3: {
        waitingHandPlayer.forEach((element) {
          players[element].addPoint(1000);
        });
        unWaitingHandPlayer.forEach((element) {
          players[element].addPoint(-3000);
        });
        break;
      }
      case 4:
        break;
    }
    for (int i = 0; i < playerNum; i++) {
      players[i].cancelWaitingHand();
    }

    int temp = _stack;
    unWaitingHandPlayer.forEach((element) {
      if (players[element].isParent)
        nextRound();
    });
    _stack = temp + 1;
    _inDrawn = false;
  }

  void tsumo({@required int winner, @required int fu, @required int han}) {
    List<int> point = List.filled(playerNum, 0);
    for(int i = 0; i < playerNum; ++i) {
      point[i] = players[i].tsumo(winner: winner, fu: fu, han: han);
      if (i != winner)
        point[i] -= (100 * _stack);
    }
    point[winner] += _reachBets + (300 * _stack);
    _reachBets = 0;

    for (int i = 0; i < playerNum; i++) {
      players[i].addPoint(point[i]);
    }
    if (players[winner].isParent)
      _stack++;
    else
      nextRound();
  }

  void ron({
    @required int winner, @required int looser, @required int fu, @required int han}) {
    int point;
    int stack = 0;
    if (players[winner].isParent) {
      point = parentRonPointTable[fu][han];
      stack = 1;
    }
    else
      point = childRonPointTable[fu][han];

    point += (300 * _stack);
    players[looser].addPoint(-point);

    point += _reachBets;
    _reachBets = 0;
    players[winner].addPoint(point);

    for (int i = 0; i < playerNum; i++) {
      players[i].cancelReach();
    }
    _stack += stack;
  }
}

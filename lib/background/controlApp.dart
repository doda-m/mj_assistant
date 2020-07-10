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

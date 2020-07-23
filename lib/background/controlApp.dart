import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mj_assistant/background/point.dart';
import 'player.dart';
import 'rule.dart';

class ControlApp {
  static const List<String> WIND_NAME = ['東', '南', '西', '北'];
  static const List<String> ROUND_NAME = ['一局', '二局', '三局', '四局'];
  final List<Player> players;
  final SettingRule rule;
  int _defaultBets;
  int _prevalentWind;
  int _round;
  int _stack;
  int _reachBets;
  int _starter;
  bool _inSetStarter = false;
  bool _inDrawn = false;
  bool _inRon = false;
  int _ronPlayer = -1;
  bool _inDiffScore = false;
  int _diffBasePlayer = -1;
  int get playerNum => players.length;
  int get currentParent => players.indexWhere((element) => element.isParent);


  ControlApp(int playerNum):
        _defaultBets = (4 == playerNum) ? 3000:2000,
        _prevalentWind = 0,
        _round = 0,
        _stack = 0,
        _reachBets = 0,
        _starter = 0,
        rule = SettingRule(playerNum),
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
  bool get inSetStarter => _inSetStarter;
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
    if ((playerNum - 1) == _round)
      _prevalentWind = (_prevalentWind - 1) % playerNum;
    _stack = 0;
    for (Player player in players) {
      player.nextRound((player.wind + 1) % playerNum);
    }
  }

  void stackRound() {
    _stack++;
    players.forEach((player) => player.nextRound(player.wind));
  }

  void toggleSetStarter() => _inSetStarter = !_inSetStarter;

  void setStarter(int playerIndex) {
    for (int i = 0; i < playerIndex; i++) {
      players[i].setStarter((players[i].wind + _starter + playerNum - playerIndex) % playerNum);
    }
    for (int i = playerIndex; i < playerNum; i++) {
      players[i].setStarter((players[i].wind + _starter + playerNum - playerIndex) % playerNum);
    }
    _starter = playerIndex;
    _inSetStarter = false;
  }

  void preSetStarter() {
    toggleSetStarter();
    players[_starter].toggleStarter();
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

  void toggleDrawn() => _inDrawn = !_inDrawn;

  void drawn() {
    List<int> waitingHandPlayer = [];
    List<int> unWaitingHandPlayer = [];
    for (int i = 0; i < playerNum; i++) {
      if (players[i].isWaitingHand)
        waitingHandPlayer.add(i);
      else
        unWaitingHandPlayer.add(i);
    }
    int pay, get;
    if (0 == unWaitingHandPlayer.length || playerNum == unWaitingHandPlayer.length)
      pay = get = 0;
    else {
      pay = _defaultBets ~/ unWaitingHandPlayer.length;
      get = _defaultBets ~/ waitingHandPlayer.length;
    }

    unWaitingHandPlayer.forEach((element) {
      players[element].addPoint(-pay);
    });
    waitingHandPlayer.forEach((element) {
      players[element].addPoint(get);
    });

    for (int i = 0; i < playerNum; i++) {
      players[i].cancelWaitingHand();
      players[i].cancelReach();
    }

    int temp = _stack;
    for(int i in unWaitingHandPlayer) {
      if (players[i].isParent) {
        nextRound();
        break;
      }
    }
    _stack = temp + 1;
    _inDrawn = false;
  }

  void tsumo({@required int winner, @required int fu, @required int han}) {
    List<int> point = List.filled(playerNum, 0);
    for(int i = 0; i < playerNum; ++i) {
      point[i] = players[i].tsumo(winner: winner, fu: fu, han: han, isLoss:rule.isLossTsumo);
      if (i != winner)
        point[i] -= ((rule.stackBetPoint ~/ (playerNum - 1)) * _stack);
    }

    point[winner] += _reachBets + (rule.stackBetPoint * _stack);
    _reachBets = 0;

    for (int i = 0; i < playerNum; i++) {
      players[i].addPoint(point[i]);
    }
    if (players[winner].isParent)
      _stack++;
    else
      nextRound();
  }

  void fixedTsumo({@required int winner, @required int han}) {
    List<int> point = List.filled(playerNum, 0);
    for(int i = 0; i < playerNum; ++i) {
      point[i] = players[i].fixedTsumo(winner: winner, han: han, isLoss:rule.isLossTsumo);
      if (i != winner)
        point[i] -= ((rule.stackBetPoint ~/ (playerNum - 1)) * _stack);
    }

    point[winner] += _reachBets + (rule.stackBetPoint * _stack);
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
    int point = 0;

    point += (rule.stackBetPoint * _stack);
    if (players[winner].isParent)
      point += parentRonPointTable[fu][han];
    else
      point += childRonPointTable[fu][han];

    players[looser].addPoint(-point);

    point += _reachBets;
    _reachBets = 0;
    players[winner].addPoint(point);

    players.forEach((player) => player.cancelReach());
  }

  void fixedRon(
      {@required int winner, @required int looser, @required int han}) {
    int point = 0;

    point += (rule.stackBetPoint * _stack);
    if (players[winner].isParent)
      point += parentFixedRonPointTable[han];
    else
      point += childFixedRonPointTable[han];

    players[looser].addPoint(-point);
    point += _reachBets;
    _reachBets = 0;
    players[winner].addPoint(point);

    players.forEach((player) => player.cancelReach());
  }
}

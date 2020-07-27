import 'package:flutter/foundation.dart';
import 'package:mj_assistant/background/point.dart';

const EAST = 0;

class Player {
  final int _playerID;
  final int _playerNum;
  int _wind;
  int _score;
  bool _isStarter;
  bool _isReach;
  bool _isParent;
  bool _isWaitingHand;

  Player(int playerID, int playerNum, int wind, bool parent):
        _playerID = playerID,
        _playerNum = playerNum,
        _wind = wind,
        _score = (4 == playerNum) ? 25000:35000,
        _isReach = false,
        _isParent = parent,
        _isStarter = parent,
        _isWaitingHand = false;

  int get score => _score;
  int get wind => _wind;
  bool get isStarter => _isStarter;
  bool get isReach => _isReach;
  bool get isParent => _isParent;
  bool get isWaitingHand => _isWaitingHand;
//  set wind(int newWind) => _wind = newWind;

  void setScore(int point) => _score = point;
  void nextRound(int newWind) {
    _wind = newWind;
    _isReach = false;
    if (EAST == newWind)
      _isParent = true;
    else
      _isParent = false;
  }

  void backRound(int preWind) {
    _wind = preWind;
    _isReach = false;
    if (EAST == preWind)
      _isParent = true;
    else
      _isParent = false;
  }

  void setStarter(int wind) {
    if (EAST == wind)
      _isParent = _isStarter = true;
    else
      _isStarter = _isParent = false;
    _wind = wind;
  }

  void toggleStarter() => _isStarter = !_isStarter;

  int toggleReach() {
    _isReach = !_isReach;
    final cost = _isReach ? 1000:-1000;
    _score -= cost;
    return cost;
  }

  void cancelReach() => _isReach = false;

  void toggleWaitingHand() => _isWaitingHand = !_isWaitingHand;

  void cancelWaitingHand() => _isWaitingHand = false;

  int tsumo(
      {@required int winner, @required int fu, @required int han, @required bool isLoss}) {
    int childPay;
    int parentPay;
    _isReach = false;

    if (EAST ==  (winner - _playerID + _wind) % _playerNum) {
      if (isLoss)
        childPay = parentTsumoPointTable[fu][han];
      else
        childPay = parentNoLossTsumoPointTable[fu][han];
    }
    else {
      if (isLoss) {
        childPay = childTsumoPointTable[fu][han].child;
        parentPay = childTsumoPointTable[fu][han].parent;
      }
      else {
        childPay = childNoLossTsumoPointTable[fu][han].child;
        parentPay = childNoLossTsumoPointTable[fu][han].parent;
      }
    }

    if (_playerID == winner) {
      if (_isParent)
        return childPay * (_playerNum - 1);
      else
        return (childPay * (_playerNum - 2)) + parentPay;
    }
    else {
      if (_isParent)
        return - parentPay;
      else
        return - childPay;
    }
  }

  int fixedTsumo(
      {@required int winner, @required int han, @required bool isLoss}) {
    int childPay;
    int parentPay;
    _isReach = false;

    if (EAST ==  (winner - _playerID + _wind) % _playerNum) {
      if (isLoss)
        childPay = parentFixedTsumoPointTable[han];
      else
        childPay = parentFixedNoLossTsumoPointTable[han];
    }
    else {
      if (isLoss) {
        childPay = childFixedTsumoPointTable[han].child;
        parentPay = childFixedTsumoPointTable[han].parent;
      }
      else {
        childPay = childFixedNoLossTsumoPointTable[han].child;
        parentPay = childFixedNoLossTsumoPointTable[han].parent;
      }
    }

    if (_playerID == winner) {
      if (_isParent)
        return childPay * (_playerNum - 1);
      else
        return (childPay * (_playerNum - 2)) + parentPay;
    }
    else {
      if (_isParent)
        return - parentPay;
      else
        return - childPay;
    }
  }

  void addPoint(int addPoint) => _score += addPoint;

}

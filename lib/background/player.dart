import 'package:flutter/foundation.dart';
import 'package:mj_assistant/background/point.dart';

const EAST = 0;

class Player {
  final int _playerID;
  final int _playerNum;
  int _wind;
  int _point;
  bool _isReach;
  bool _isParent;

  Player(int playerID, int playerNum, int wind, bool parent):
        _playerID = playerID,
        _playerNum = playerNum,
        _wind = wind,
        _point = 25000,
        _isReach = false,
        _isParent = parent;

  int get point => _point;
  int get wind => _wind;
  bool get isReach => _isReach;
  bool get isParent => _isParent;
//  set wind(int newWind) => _wind = newWind;

  void nextRound(int newWind) {
    _wind = newWind;
    _isReach = false;
    if (EAST == newWind)
      _isParent = true;
    else
      _isParent = false;
  }

  int toggleReach() {
    _isReach = !_isReach;
    final cost = _isReach ? 1000:-1000;
    _point -= cost;
    return cost;
  }

  void cancelReach() {
    _isReach = false;
  }

  int tsumo({@required int winner, @required int fu, @required int han}) {
    int childPay;
    int parentPay;
    _isReach = false;

    if (0 ==  (winner - _playerID + _wind) % _playerNum) {
      childPay = parentTsumoPointTable[fu][han];
    }
    else {
      childPay = childTsumoPointTable[fu][han].child;
      parentPay = childTsumoPointTable[fu][han].parent;
    }

    if (_playerID == winner) {
      if (_isParent) {
        return childPay * 3;
      }
      else {
        return (childPay * 2) + parentPay;
      }
    }
    else {
      if (_isParent) {
        return - parentPay;
      }
      else {
        return - childPay;
      }
    }
  }

  void addPoint(int addPoint) {
    _point += addPoint;
  }

}

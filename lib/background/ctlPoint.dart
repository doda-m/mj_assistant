import 'package:shared_preferences/shared_preferences.dart';
import 'point.dart';

const FOUR_PARENT = '/four/parent';
const FOUR_PLACE = '/four/place';
const FOUR_POINT_PATH = '/four/point/';
const THREE_POINT_PATH = '/three/point/';

class ControlPoint {
  final SharedPreferences _prefs;
  ControlPoint(this._prefs);

  final List<String> players = ['under', 'right', 'top', 'left'];
  static List<int> points = [25000, 25000, 25000, 25000];

  void resetPoint() {
    players.forEach((element) {
      _prefs.setInt(FOUR_POINT_PATH + element, 25000);
    });
  }

  int readPoint(int index) {
    return _prefs.getInt(FOUR_POINT_PATH + players[index]);
  }

  void reach(int index) {
    int point = _prefs.getInt(FOUR_POINT_PATH + players[index]);
    _prefs.setInt(FOUR_POINT_PATH + players[index], point - 1000);
  }

  void reachCancel(int index) {
    int point = _prefs.getInt(FOUR_POINT_PATH + players[index]);
    _prefs.setInt(FOUR_POINT_PATH + players[index], point + 1000);
  }

  void ron(int getter, int payer, int point) {


  }

  void tsumo(int playerIndex, int fu, int han, int reachBets) {
    int childPay;
    int place = _prefs.getInt(FOUR_PLACE);
    if (_prefs.getInt(FOUR_PARENT) == playerIndex) {
      childPay = parentTsumoPointTable[fu][han] + (100 * place);
      for (int i = 0; i < 4; i++) {
        if (i == playerIndex)
          _prefs.setInt(FOUR_POINT_PATH + players[i],
              _prefs.getInt(FOUR_POINT_PATH + players[i]) + (childPay * 3) + (1000 * reachBets));
        else
          _prefs.setInt(FOUR_POINT_PATH + players[i],
              _prefs.getInt(FOUR_POINT_PATH + players[i]) - childPay);
      }
    }
    else {
      int parentIndex = _prefs.getInt(FOUR_PARENT);
      int parentPay = childTsumoPointTable[fu][han].parent + (100 * place);
      childPay = childTsumoPointTable[fu][han].child + (100 * place);
      for (int i = 0; i < 4; i++) {
        if (i == playerIndex)
          _prefs.setInt(FOUR_POINT_PATH + players[i],
              _prefs.getInt(FOUR_POINT_PATH + players[i]) + (childPay * 2) + parentPay + (1000 * reachBets));
        else {
          if (i == parentIndex)
            _prefs.setInt(FOUR_POINT_PATH + players[i],
                _prefs.getInt(FOUR_POINT_PATH + players[i]) - parentPay);
          else
            _prefs.setInt(FOUR_POINT_PATH + players[i],
                _prefs.getInt(FOUR_POINT_PATH + players[i]) - childPay);
        }
      }
    }
  }
}

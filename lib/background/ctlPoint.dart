import 'package:shared_preferences/shared_preferences.dart';
import 'point.dart';

const FOUR_POINT_PATH = '/four/point/';
const THREE_POINT_PATH = '/three/point/';

class ControlPoint {
  final SharedPreferences _prefs;
  ControlPoint(this._prefs);

  final List<String> players = ['under', 'right', 'top', 'left'];
  final ChildTsumoPointTable _childTsumoPointTable = ChildTsumoPointTable();
  final ParentTsumoPointTable _parentTsumoPointTable = ParentTsumoPointTable();
  final ChildRonPointTable _childRonPointTable = ChildRonPointTable();
  final ParentRonPointTable _parentRonPointTable = ParentRonPointTable();
  static List<int> points = [25000, 25000, 25000, 25000];

  void resetPoint() {
    players.forEach((element) {
      _prefs.setInt(FOUR_POINT_PATH + element, 25000);
    });
  }

  int readPoint(int index) {
    return _prefs.getInt(FOUR_POINT_PATH + players.elementAt(index));
  }

  void reach(int index) {
    int point = _prefs.getInt(FOUR_POINT_PATH + players.elementAt(index));
    _prefs.setInt(FOUR_POINT_PATH + players.elementAt(index), point - 1000);
  }

  void reachCancel(int index) {
    int point = _prefs.getInt(FOUR_POINT_PATH + players.elementAt(index));
    _prefs.setInt(FOUR_POINT_PATH + players.elementAt(index), point + 1000);
  }

  void ron(int getter, int payer, int point) {


  }

}
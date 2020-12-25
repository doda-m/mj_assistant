/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:shared_preferences/shared_preferences.dart';

class SettingRule {
  final SharedPreferences _prefs;
  bool _isFourVer;
  bool _isChanged;
  int startingPoint;
  int stackBetPoint;
  bool _isLossTsumo;
  bool _isFixedPoint;

  SettingRule(int playerNum, this._prefs) {
    _isFourVer = (4 == playerNum)? true:false;
    // _startingPoint = (4 == playerNum)? 25000:35000;
    startingPoint = (_isFourVer)? _prefs.getInt("startPoint4"):_prefs.getInt("startPoint3");
    // stackBetPoint = (4 == playerNum)? 300:200;
    stackBetPoint = (_isFourVer)? _prefs.getInt("stackBetPoint4"):_prefs.getInt("stackBetPoint3");
    // _isLossTsumo = true;
    _isLossTsumo = _prefs.getBool("isLossTsumo");
    // _isFixedPoint = false;
    _isFixedPoint = _prefs.getBool("isFixedPoint");
  }

  bool get isChanged => _isChanged;
  bool get isLossTsumo => _isLossTsumo;
  bool get isFixedPoint => _isFixedPoint;
  // set startingPoint(int point) => startingPoint = point;
  void toggleLossTsumo() => _isLossTsumo = !_isLossTsumo;
  void toggleFixedPoint() => _isFixedPoint = !_isFixedPoint;

  void setStartingPoint(int point) {
    if (_isFourVer)
      _prefs.setInt("startingPoint4", point);
    else
      _prefs.setInt("startingPoint3", point);
  }

  void setStackBetPoint(int point) {
    if (_isFourVer)
      _prefs.setInt("stackBetPoint4", point);
    else
      _prefs.setInt("stackBetPoint3", point);
  }


}
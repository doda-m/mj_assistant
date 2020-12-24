/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

class SettingRule {
  bool _isChanged;
  int _startingPoint;
  int stackBetPoint;
  bool _isLossTsumo;
  bool _isFixedPoint;

  SettingRule(int playerNum) {
    _startingPoint = (4 == playerNum)? 25000:35000;
    stackBetPoint = (4 == playerNum)? 300:200;
    _isLossTsumo = true;
    _isFixedPoint = false;
  }

  bool get isChanged => _isChanged;
  bool get isLossTsumo => _isLossTsumo;
  bool get isFixedPoint => _isFixedPoint;
  set startingPoint(int point) => _startingPoint = point;
  void toggleLossTsumo() => _isLossTsumo = !_isLossTsumo;
  void toggleFixedPoint() => _isFixedPoint = !_isFixedPoint;

}
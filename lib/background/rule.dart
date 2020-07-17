class SettingRule {
  int _startingPoint;
  bool _isLossTsumo;
  bool _isFixedPoint;

  SettingRule(int playerNum) {
    _startingPoint = (4 == playerNum)? 25000:35000;
    _isLossTsumo = false;
    _isFixedPoint = false;
  }

  set startingPoint(int point) => _startingPoint = point;
  void toggleLossTsumo() => _isLossTsumo = !_isLossTsumo;
  void toggleFixedPoint() => _isFixedPoint = !_isFixedPoint;



}
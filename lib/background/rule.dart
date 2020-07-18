class SettingRule {
  bool _isChanged;
  int _startingPoint;
  bool _isNoLossTsumo;
  bool _isFixedPoint;

  SettingRule(int playerNum) {
    _startingPoint = (4 == playerNum)? 25000:35000;
    _isNoLossTsumo = false;
    _isFixedPoint = false;
  }

  bool get isChanged => _isChanged;
  set startingPoint(int point) => _startingPoint = point;
  void toggleLossTsumo() => _isNoLossTsumo = !_isNoLossTsumo;
  void toggleFixedPoint() => _isFixedPoint = !_isFixedPoint;

}
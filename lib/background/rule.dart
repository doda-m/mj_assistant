import 'package:mj_assistant/background/controlApp.dart';

class SettingRule {
  bool _isChanged;
  int _startingPoint;
  bool _isLossTsumo;
  bool _isFixedPoint;

  SettingRule(int playerNum) {
    _startingPoint = (4 == playerNum)? 25000:35000;
    _isLossTsumo = false;
    _isFixedPoint = false;
  }

  bool get isChanged => _isChanged;
  set startingPoint(int point) => _startingPoint = point;
  void toggleLossTsumo() => _isLossTsumo = !_isLossTsumo;
  void toggleFixedPoint() => _isFixedPoint = !_isFixedPoint;

}
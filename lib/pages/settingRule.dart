import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'package:mj_assistant/background/rule.dart';
import 'package:mj_assistant/background/player.dart';


class SettingRulePage extends StatefulWidget {
  final ControlApp controlApp;
  SettingRulePage(this.controlApp);
  @override
  _SettingRuleState createState() => _SettingRuleState(controlApp);
}

class _SettingRuleState extends State<SettingRulePage> {
  final ControlApp controlApp;
  bool _isLossTsumo;
  bool _isFixedPoint;
  _SettingRuleState(this.controlApp):
        _isFixedPoint = controlApp.rule.isFixedPoint,
        _isLossTsumo = controlApp.rule.isLossTsumo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('ツモり損'),
            value: (4 == controlApp.playerNum)? false:_isLossTsumo,
            activeColor: Colors.blueAccent,
            onChanged: (e) {
              setState(() {
                if (3 == controlApp.playerNum) {
                  _isLossTsumo = e;
                  controlApp.rule.toggleLossTsumo();
                }
              });
            }
          ),
          SwitchListTile(
              title: Text('符計算なし(30符，一部切り上げ)'),
              value: (4 == controlApp.playerNum)? false:_isFixedPoint,
              activeColor: Colors.blueAccent,
              onChanged: (e) {
                setState(() {
                  if (3 == controlApp.playerNum) {
                    _isFixedPoint = e;
                    controlApp.rule.toggleFixedPoint();
                  }
                });
              }
          ),
        ],
      ),
    );
  }
}

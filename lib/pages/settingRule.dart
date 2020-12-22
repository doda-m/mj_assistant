import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';
import 'setting/settingStack.dart';

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
        title: Text('ルール設定'),
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
//          ListTile(
//            title: Text('原点'),
//            trailing: Icon(Icons.navigate_next),
//            onTap: () => Navigator.push(
//                this.context,
//                MaterialPageRoute(
//                  builder: (context) => SettingStackPage(controlApp),
//                )
//            ),
//          ),
          ListTile(
            title: Text('積み棒'),
            subtitle: Text('${controlApp.rule.stackBetPoint}'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => Navigator.push(
                this.context,
                MaterialPageRoute(
                  builder: (context) => SettingStackPage(controlApp),
                )
            ).then((value) {
              setState(() { });
            }),
          )
        ],
      ),
    );
  }
}

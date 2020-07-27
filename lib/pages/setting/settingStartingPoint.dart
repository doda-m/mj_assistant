import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';

class SettingStartingPointPage extends StatefulWidget {
  final ControlApp controlApp;
  SettingStartingPointPage(this.controlApp);
  @override
  _SettingStartingPoint createState() => _SettingStartingPoint(controlApp);
}

class _SettingStartingPoint extends State<SettingStartingPointPage> {
  final ControlApp controlApp;
  String _type;
  _SettingStartingPoint(this.controlApp):
        _type = '${controlApp.rule.stackBetPoint ~/ (controlApp.playerNum - 1)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定 (原点)'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          RadioListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.trailing,
            title: (4 == controlApp.playerNum)? const Text('25000'):const Text('35000'),
            value: '100',
            groupValue: _type,
            onChanged: (e) {
              setState(() {
                controlApp.rule.stackBetPoint = (4 == controlApp.playerNum)? 300:200;
                _type = e;
              });
            },
          ),
          RadioListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.trailing,
            title: (4 == controlApp.playerNum)? Text('1500'):Text('1000'),
            value: '500',
            groupValue: _type,
            onChanged: (e) {
              setState(() {
                controlApp.rule.stackBetPoint = (4 == controlApp.playerNum)? 1500:1000;
                _type = e;
              });
            }
          ),
//          RadioListTile(
//              activeColor: Colors.blue,
//              controlAffinity: ListTileControlAffinity.trailing,
//              title: Text('カスタム (${controlApp.rule.stackBetPoint})'),
//              value: 'custom',
//              groupValue: _type,
//              onChanged: (e) {
//                setState(() {
//                  _type = e;
//                });
//              }
//          ),
        ],
      ),
    );
  }
}

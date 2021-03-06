/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';

class SettingStackPage extends StatefulWidget {
  final ControlApp controlApp;
  SettingStackPage(this.controlApp);
  @override
  _SettingStackState createState() => _SettingStackState(controlApp);
}

class _SettingStackState extends State<SettingStackPage> {
  final ControlApp controlApp;
  String _type;
  _SettingStackState(this.controlApp) {
    int stackBet = controlApp.rule.stackBetPoint ~/ (controlApp.playerNum - 1);
    switch (stackBet) {
      case 100: {
        _type = '100';
        break;
      }
      case 500: {
        _type = '500';
        break;
      }
      default:
        _type = 'custom';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定/積み棒'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          RadioListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.trailing,
            title: (4 == controlApp.playerNum)? Text('300'):Text('200'),
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

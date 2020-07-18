import 'package:flutter/material.dart';

class SettingRulePage extends StatefulWidget {
  @override
  _SettingRuleState createState() => _SettingRuleState();
}

class _SettingRuleState extends State<SettingRulePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
        backgroundColor: Colors.green,
      ),
      body: Container(),
    );
  }
}

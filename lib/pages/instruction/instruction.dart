import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使い方"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('基本操作'),
            // subtitle: Text('${controlApp.rule.stackBetPoint}'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => null,
          ),
          ListTile(
            title: Text('点数差の表示'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => null,
          ),
          ListTile(
            title: Text('点数の手入力'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => null,
          ),
          ListTile(
            title: Text('ルール設定'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => null,
          ),
        ],
      ),
    );
    // TODO: implement build

  }

}
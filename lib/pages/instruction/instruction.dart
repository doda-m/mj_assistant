import 'package:flutter/material.dart';
import 'InstDecideStarter.dart';
import 'InstWin.dart';
import 'InstDrawn.dart';
import 'InstReach.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使い方"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('起家決め'),
              // subtitle: Text('${controlApp.rule.stackBetPoint}'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstDecideStarterPage()),
              ),
            ),
            ListTile(
              title: Text('リーチ'),
              // subtitle: Text('${controlApp.rule.stackBetPoint}'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstReachPage()),
              ),
            ),
            ListTile(
              title: Text('ツモ・ロン'),
              // subtitle: Text('${controlApp.rule.stackBetPoint}'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstWinPage()),
              ),
            ),
            ListTile(
              title: Text('流局'),
              // subtitle: Text('${controlApp.rule.stackBetPoint}'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstDrawnPage()),
              ),            ),
            ListTile(
              title: Text('前局・次局，連荘＋ー'),
              // subtitle: Text('${controlApp.rule.stackBetPoint}'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstDecideStarterPage()),
              ),            ),
            ListTile(
              title: Text('点数差の表示'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstDecideStarterPage()),
              ),            ),
            ListTile(
              title: Text('点数の手入力'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstDecideStarterPage()),
              ),            ),
            ListTile(
              title: Text('ルール設定'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstDecideStarterPage()),
              ),            ),
          ],
        ),
      )
    );
  }
}
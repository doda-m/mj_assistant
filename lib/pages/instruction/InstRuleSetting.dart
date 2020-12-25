/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';

class InstRuleSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/点数の手入力"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  const Text("1. 画面下部にある「ルール設定」をタップする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  SizedBox(height: 10,),
                  const Text("2. 現在は，積み棒の変化やツモ損のありなしなどを変更できる．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  SizedBox(height: 10,),
                  const Text("3. リセットするとルール設定も初期化されるため，毎回設定し直す必要がある．",
                    style: TextStyle(fontSize: 18,),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';

class InstWinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/ツモ・ロン"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      const Text("ツモについて",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("1. ツモ和了をしたプレイヤーの「ツモボタン」をタップする．",
                        style: TextStyle(fontSize: 18,),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          children: [
                            const Text("※ツモボタン: ",
                              style: TextStyle(fontSize: 18,),
                            ),
                            SizedBox(
                              height: 25, width: 70,
                              child: RaisedButton(
                                color: Colors.teal,
                                child: const Text("ツモ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: () => null,
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 10,),
                      const Text("2. 和了の符と飜に応じた点数を表から選択してタップする．"
                          "満貫以上の和了は画面上部のボタンから選択する．",
                        style: TextStyle(fontSize: 18,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      const Text("ロンについて",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("1. ロン和了をしたプレイヤーの「ロンボタン」をタップする．",
                        style: TextStyle(fontSize: 18,),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          children: [
                            const Text("※ロンボタン: ",
                              style: TextStyle(fontSize: 18,),
                            ),
                            SizedBox(
                              height: 25, width: 70,
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                child: const Text("ロン",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: () => null,
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 10,),
                      const Text("2. 放銃したプレイヤーの「放銃ボタン」をタップする．",
                        style: TextStyle(fontSize: 18,),
                      ),
                      Row(
                          children: [
                            const Text("※放銃ボタン: ",
                              style: TextStyle(fontSize: 18,),
                            ),
                            SizedBox(
                              height: 25, width: 70,
                              child: RaisedButton(
                                color: Colors.redAccent[100],
                                child: const Text("放銃",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: () => null,
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 10,),
                      const Text("3. 和了の符と飜に応じた点数を表から選択してタップする．"
                          "満貫以上の和了は画面上部のボタンから選択する．",
                        style: TextStyle(fontSize: 18,),
                      ),
                      const SizedBox(height: 10,),
                      const Text("4. 次局に進む場合は「次局へ」をタップする．"
                          "ダブロンの場合などは「いいえ」をタップし，別のプレイヤーのロン和了処理を行う．"
                          "親が和了した場合は連荘をタップする．",
                        style: TextStyle(fontSize: 18,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ),
    );
  }
}
/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';

class InstRoundCtlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/前局・次局，連荘＋ー"),
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
                      const Text("前局・次局について",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("1. 画面下部にある「前局ボタン」と「次局ボタン」で局を戻したり，進めたりできる．"
                          "ただし，点数には反映されない．",
                        style: TextStyle(fontSize: 18,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      const Text("連荘＋ーについて",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("1. 画面下部にある「連荘＋ボタン」と「連荘ーボタン」で本場を増減できる．",
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
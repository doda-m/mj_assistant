/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';

class InstDecideStarterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/起家決め"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("1. 画面左下にある「起家決めボタン」をタップする．",
                      style: TextStyle(fontSize: 18,),
                    ),
                    Row(
                        children: [
                          const Text("※起家決めボタン: ",
                            style: TextStyle(fontSize: 18,),
                          ),
                          SizedBox(
                            height: 25,
                            child: RaisedButton(
                              child: const Text("起家決め"),
                              onPressed: () => null,
                            ),
                          ),
                        ]
                    ),
                    const SizedBox(height: 10,),
                    const Text("2. 起家にしたいプレイヤーが持つ「起家マーク」をタップする．",
                      style: TextStyle(fontSize: 18,),
                    ),
                    Row(
                        children: [
                          const Text("※起家マーク: ",
                            style: TextStyle(fontSize: 18,),
                          ),
                          SizedBox(
                            height: 25,
                            width: 35,
                            child: RaisedButton(
                              child: const Text("東",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              color: Colors.white30,
                              onPressed: () => null,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),


        ),
    );
  }
}
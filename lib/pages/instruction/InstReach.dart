/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';

class InstReachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/リーチ"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("1. 各プレイヤーが持つ「リーチボタン」をタップする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  Row(
                      children: [
                        const Text("※リーチボタン: ",
                          style: TextStyle(fontSize: 18,),
                        ),
                        SizedBox(
                          height: 25,
                          child: RaisedButton(
                            color: Colors.grey,
                            child: const Text('リーチ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),
                            onPressed: () => null,
                          ),
                        )

                      ]
                  ),
                  const SizedBox(height: 10,),
                  const Text("2. リーチを取り消したい場合は，もう一度「リーチボタン」をタップする．",
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
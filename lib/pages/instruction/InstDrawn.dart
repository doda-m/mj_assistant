import 'package:flutter/material.dart';

class InstDrawnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("使い方/流局"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  const Text("1. 画面下部にある「流局ボタン」をタップする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  Row(
                      children: [
                        const Text("※流局ボタン: ",
                          style: TextStyle(fontSize: 18,),
                        ),
                        SizedBox(
                          height: 25,
                          child: RaisedButton(
                            child: const Text("流局"),
                            onPressed: () => null,
                          ),
                        ),
                      ]
                  ),
                  const SizedBox(height: 10,),
                  const Text("2. 聴牌しているプレイヤーの「ノーテンボタン」をタップして「聴牌ボタン」に"
                      "変える．間違って押した場合，「聴牌ボタン」をタップすると「ノーテンボタン」に変わる．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                      children: [
                        const Text("※ノーテンボタン: ",
                          style: TextStyle(fontSize: 18,),
                        ),
                        SizedBox(
                          height: 25,
                          child: RaisedButton(
                            color: Colors.grey,
                            child: Text('ノーテン',
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
                  Row(
                      children: [
                        const Text("※聴牌ボタン: ",
                          style: TextStyle(fontSize: 18,),
                        ),
                        SizedBox(
                          height: 25,
                          child: RaisedButton(
                            color: Colors.redAccent[100],
                            child: Text('聴牌',
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
                  const Text("3. 「流局ボタン」が「確定ボタン」に変わっているので，「確定ボタン」をタップする．",
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
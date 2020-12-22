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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10, width: MediaQuery.of(context).size.width,),
                const SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: const Text("1. 画面左下にある「起家決めボタン」をタップする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
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
                ),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: const Text("2. 起家にしたいプレイヤーが持つ「起家マーク」をタップする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
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
                ),
              ],
            ),
        ),
    );
  }
}
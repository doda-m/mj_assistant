import 'package:flutter/material.dart';

class InstPointChangePage extends StatelessWidget {
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
                  const Text("1. 点数を変更したいプレイヤーの「点数表示」を長押しする．",
                    style: TextStyle(fontSize: 18,),
                  ),
                  SizedBox(height: 10,),
                  const Text("2. 変更する差分の点数を入力して確定ボタンをタップする．",
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
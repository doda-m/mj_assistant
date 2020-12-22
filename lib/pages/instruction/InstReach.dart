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
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10, width: MediaQuery.of(context).size.width,),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: const Text("1. 各プレイヤーが持つ「リーチボタン」をタップする．",
                  style: TextStyle(fontSize: 18,),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
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
              ),
              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: const Text("2. リーチを取り消したい場合は，もう一度「リーチボタン」をタップする．",
                  style: TextStyle(fontSize: 18,),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
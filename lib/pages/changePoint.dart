import 'package:flutter/material.dart';
import 'package:mj_assistant/background/controlApp.dart';

class ChangePointPage extends StatefulWidget {
  final ControlApp controlApp;
  final playerID;
  ChangePointPage(this.controlApp, this.playerID);
  @override
  _ChangePointPage createState() => _ChangePointPage(controlApp, playerID);
}

class _ChangePointPage extends State<ChangePointPage> {
  final ControlApp controlApp;
  final playerID;
  int score;
  int addScore = 0;
  _ChangePointPage(this.controlApp, this.playerID):
        score = controlApp.players[playerID].score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('点数入力'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('現在点数',
                  style: TextStyle(
                    fontSize: 24,
                  ),),
                  Text(score.toString(),
                    style: TextStyle(
                      fontSize: 24,
                    ),),
                ],
              ),
              Container(
                  child: const Icon(Icons.navigate_next, size: 40),
              ),
              Column(
                children: [
                  const Text('変更後',
                    style: TextStyle(fontSize: 24,),
                  ),
                  Text((score + addScore).toString(),
                    style: TextStyle(fontSize: 24,),
                  ),
                ],
              )
            ],
          ),
          Text(addScore.toString(),
          style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('+ 100',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                      onPressed: () => setState(() {
                        addScore += 100;
                      }),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('+ 1000',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: () => setState(() {
                        addScore += 1000;
                      }),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('+ 10000',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: () => setState(() {
                        addScore += 10000;
                      }),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('- 100',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: () => setState(() {
                        addScore -= 100;
                      }),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('- 1000',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: () => setState(() {
                        addScore -= 1000;
                      }),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 110, height: 40,
                    child: RaisedButton(
                      child: const Text('- 10000',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: () => setState(() {
                        addScore -= 10000;
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: RaisedButton(
              child: Text('確定'),
              onPressed: () {
                  controlApp.players[playerID].setScore(score + addScore);
                  Navigator.of(context).pop();
              }
            ),
          )
        ],
      ),
    );
  }
}


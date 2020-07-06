import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
        backgroundColor: Colors.lightGreen,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 300,
                  height: 70,
                  child: RaisedButton(
                    child: Text('四人麻雀',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),),
                    color: Colors.lightGreen,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/fourPlayer');
                    }
                  )
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  child: Text('三人麻雀/未実装',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),),
                  color: Colors.lightBlue,
                  onPressed: () {
                    null;
//                    Navigator.of(context).pushNamed('threePlayer');
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
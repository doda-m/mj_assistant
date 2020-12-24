/*!
 * mj_assistant
 *
 * (c) 2020 Masahiro Dodare.
 *
 * This software is released under the GNU General Public License v3.0.
 * see https://github.com/doda-m/mj_assistant/blob/master/LICENSE
 */

import 'package:flutter/material.dart';
import 'package:mj_assistant/pages/playDisplay.dart';
import 'package:mj_assistant/pages/instruction/instruction.dart';

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
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayDisplayPage(
                              isFourVer: true,
                            )
                        )
                    ),
                  )
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  child: Text('三人麻雀',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),),
                  color: Colors.lightBlue,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayDisplayPage(
                            isFourVer: false,
                          )
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  child: Text('使い方',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),),
                  color: Colors.amber,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InstructionPage()
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
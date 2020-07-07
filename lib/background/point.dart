import 'package:flutter/material.dart';

class Tsumo {
  final int child;
  final int parent;
  Tsumo(this.child, this.parent);
}

const List<String> fuList = [
  '20 符', '25 符', '30 符', '40 符', '50 符', '60 符',
  '70 符', '80 符', '90 符', '100 符', '110 符',
];
const List<String> pointList = ['満貫', '跳満', '倍満', '三倍満', '役満',];

final List<String> han = ['1翻', '2翻', '3翻', '4翻',];

class ChildTsumoPointTable {
  final List<Tsumo> twenty = [Tsumo(0,0), Tsumo(400, 700), Tsumo(700, 1300), Tsumo(1300, 2600), Tsumo(2000, 4000)];
  final List<Tsumo> twentyFive = [Tsumo(0,0), Tsumo(400, 800), Tsumo(800, 1600), Tsumo(1600, 3200), Tsumo(2000, 4000)];
  static List<Tsumo> thirty = [Tsumo(300, 500), Tsumo(500, 1000), Tsumo(1000, 2000), Tsumo(2000, 3900), Tsumo(2000, 4000)];
  final List<Tsumo> forty = [Tsumo(400, 700), Tsumo(700, 1300), Tsumo(1300, 2600), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> fifty = [Tsumo(400, 800), Tsumo(800, 1600), Tsumo(1600, 3200), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  static List<Tsumo> sixty = [Tsumo(500, 1000), Tsumo(1000, 2000), Tsumo(2000, 3900), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> seventy = [Tsumo(600, 1200), Tsumo(1200, 2300), Tsumo(2000, 4000), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> eighty = [Tsumo(700, 1300), Tsumo(1300, 2600), Tsumo(2000, 4000), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> ninety = [Tsumo(800, 1500), Tsumo(1500, 2900), Tsumo(2000, 4000), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> hundred = [Tsumo(800, 1600), Tsumo(1600, 3200), Tsumo(2000, 4000), Tsumo(2000, 4000), Tsumo(2000, 4000)];
  final List<Tsumo> hundredTen = [Tsumo(900, 1800), Tsumo(1800, 3600), Tsumo(2000, 4000), Tsumo(2000, 4000), Tsumo(2000, 4000)];
}

class ParentTsumoPointTable {
  final List<int> twenty = [0, 700, 1300, 2600, 4000];
  final List<int> twentyFive = [0, 800, 1600, 3200, 4000];
  static List<int> thirty = [500, 1000, 2000, 3900, 4000];
  final List<int> forty = [700, 1300, 2600, 4000, 4000];
  final List<int> fifty = [800, 1600, 3200, 4000, 4000];
  static List<int> sixty = [1000, 2000, 3900, 4000, 4000];
  final List<int> seventy = [1200, 2300, 4000, 4000, 4000];
  final List<int> eighty = [1300, 2600, 4000, 4000, 4000];
  final List<int> ninety = [1500, 2900, 4000, 4000, 4000];
  final List<int> hundred = [1600, 3200, 4000, 4000, 4000];
  final List<int> hundredTen = [1800, 3600, 4000, 4000, 4000];
}

class ChildRonPointTable {
  final List<int> twentyFive = [0, 1600, 3200, 6400, 8000];
  static List<int> thirty = [1000, 2000, 3900, 7700, 8000];
  final List<int> forty = [1300, 2600, 5200, 8000, 8000];
  final List<int> fifty = [1600, 3200, 6400, 8000, 8000];
  static List<int> sixty = [2000, 3900, 7700, 8000, 8000];
  final List<int> seventy = [2300, 4500, 8000, 8000, 8000];
  final List<int> eighty = [2600, 5200, 8000, 8000, 8000];
  final List<int> ninety = [2900, 5800, 8000, 8000, 8000];
  final List<int> hundred = [3200, 6400, 8000, 8000, 8000];
  final List<int> hundredTen = [3600, 7100, 8000, 8000, 8000];
}

class ParentRonPointTable {
  final List<int> twentyFive = [0, 2400, 4800, 9600, 12000];
  static List<int> thirty = [1500, 2900, 5800, 11600, 12000];
  final List<int> forty = [2000, 3900, 7700, 12000, 12000];
  final List<int> fifty = [2400, 4800, 9600, 12000, 12000];
  static List<int> sixty = [2900, 5800, 11600, 12000, 12000];
  final List<int> seventy = [3400, 6800, 12000, 12000, 12000];
  final List<int> eighty = [3900, 7700, 12000, 12000, 12000];
  final List<int> ninety = [4400, 8700, 12000, 12000, 12000];
  final List<int> hundred = [4800, 9600, 12000, 12000, 12000];
  final List<int> hundredTen = [5300, 10600, 12000, 12000, 12000];
}

const List<Widget> cTwenty = [
  Text('20符', textAlign: TextAlign.center,),
  FlatButton(
    child: Text('-\n-', textAlign: TextAlign.center,),
  ),
  Text('-\n400/700', textAlign: TextAlign.center,),
  Text('-\n700/1300', textAlign: TextAlign.center,),
  Text('-\n1300/2600', textAlign: TextAlign.center,),
];


const List<Widget> cTwentyFive = [
  Text('25符', textAlign: TextAlign.center,),
  Text('-\n-', textAlign: TextAlign.center,),
  Text('-\n400/800', textAlign: TextAlign.center,),
  Text('-\n800/1600', textAlign: TextAlign.center,),
  Text('-\n1600/3200', textAlign: TextAlign.center,),
];

const List<Widget> cThirty = [
  Text('30符', textAlign: TextAlign.center,),
  Text('1000\n300/500', textAlign: TextAlign.center,),
  Text('2000\n500/100', textAlign: TextAlign.center,),
  Text('3900\n1000/2000', textAlign: TextAlign.center,),
  Text('7700\n2000/3900', textAlign: TextAlign.center,),
];

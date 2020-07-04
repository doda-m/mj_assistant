import 'package:flutter/material.dart';
import 'point.dart';

class ControlPlayerPoint {
  final List<String> players = ['under', 'right', 'top', 'left'];
  final ChildTsumoPointTable _childTsumoPointTable = ChildTsumoPointTable();
  final ParentTsumoPointTable _parentTsumoPointTable = ParentTsumoPointTable();
  final ChildRonPointTable _childRonPointTable = ChildRonPointTable();
  final ParentRonPointTable _parentRonPointTable = ParentRonPointTable();
  static List<int> points = [25000, 25000, 25000, 25000];

  int readPoint(int index) {
    return points.elementAt(index);
  }

  void ron(int getter, int payer, int point) {


  }

}
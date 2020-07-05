import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'ctlPoint.dart';

const FOUR_REACH_PATH = '/four/reach/';
const UNREACH = 0;
const REACH = 1;
const EAST = 0;
const SOUTH = 1;
const WEST = 2;
const NORTH = 3;

class ControlPlayer{
  final List<String> players = ['under', 'right', 'top', 'left'];
  final SharedPreferences _prefs;
  ControlPoint ctlPoint;

  ControlPlayer(this._prefs) {
    ctlPoint = ControlPoint(_prefs);
    for (String element in players) {
      _prefs.setInt(FOUR_REACH_PATH + element, UNREACH);
    }
  }

  static List<Color> reachList = List.filled(4, Colors.grey);

  void reset () {
    reachList = List.filled(4, Colors.grey);
    players.forEach((element) {
      _prefs.setInt(FOUR_REACH_PATH + element, UNREACH);
    });
    ctlPoint.resetPoint();
  }

  void reach(int index) {
    if (Colors.grey == reachList[index]) {
      _prefs.setInt(FOUR_REACH_PATH + players[index], REACH);
      reachList[index] = Colors.redAccent;
      ctlPoint.reach(index);
    }
    else {
      _prefs.setInt(FOUR_REACH_PATH + players[index], UNREACH);
      reachList[index] = Colors.grey;
      ctlPoint.reachCancel(index);
    }
  }

  Color reachStatus(int index) {
    return reachList[index];
  }
}
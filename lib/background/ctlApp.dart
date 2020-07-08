import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mj_assistant/background/ctlPlayer.dart';

const FOUR_PARENT = '/four/parent';
const FOUR_WIND = '/four/wind';
const FOUR_STATION = '/four/station';
const FOUR_PLACE = '/four/place';
const FOUR_REACH_BETS = '/four/reachBets';

class ControlApplication {
  static bool first = true;
  final List<String> windList = ['東', '南', '西', '北'];
  final List<String> stationList = ['一局', '二局', '三局', '四局'];
  static int wind = 0;
  static int station = 0;
  static int place = 0;
  static int parent = 0;
  ControlPlayer ctlPlayer;

  final SharedPreferences _prefs;
  ControlApplication(this._prefs) {
    ctlPlayer = ControlPlayer(_prefs);
    if (true == first) {
      _prefs.setInt(FOUR_WIND, 0);
      _prefs.setInt(FOUR_STATION, 0);
      _prefs.setInt(FOUR_PLACE, 0);
      _prefs.setInt(FOUR_PARENT, 0);
      _prefs.setInt(FOUR_REACH_BETS, 0);
      ctlPlayer.reset();
      first = false;
    }
    wind = _prefs.getInt(FOUR_WIND);
    station = _prefs.getInt(FOUR_STATION);
    place = _prefs.getInt(FOUR_PLACE);
    parent = _prefs.getInt(FOUR_PARENT);
  }

  void reset() {
    _prefs.setInt(FOUR_WIND, 0);
    _prefs.setInt(FOUR_STATION, 0);
    _prefs.setInt(FOUR_PLACE, 0);
    _prefs.setInt(FOUR_REACH_BETS, 0);
    ctlPlayer.reset();
  }

  void incrementPlace () {
    place++;
    _prefs.setInt(FOUR_PLACE, place);
  }

  void decreasePlace () {
    if (0 < place) {
      place--;
      _prefs.setInt(FOUR_PLACE, place);
    }
  }

  void nextStation() {
    place = 0;
    station++;
    parent++;
    _prefs.setInt(FOUR_PARENT, parent);
    if (3 < station) {
      station = 0;
      wind++;
      _prefs.setInt(FOUR_WIND, wind);
    }
    _prefs.setInt(FOUR_STATION, station);
    _prefs.setInt(FOUR_PLACE, place);
    ctlPlayer.reachReset();
  }

  String getWind(int index) {
    return windList[(index - parent) % 4];
  }

  String getStation() {
    int nowWind = _prefs.getInt(FOUR_WIND);
    int nowStation = _prefs.getInt(FOUR_STATION);
    return windList[nowWind % 4] + stationList[nowStation % 4];
  }

  int getPlace() {
    return _prefs.getInt(FOUR_PLACE);
  }

  int getReachSticks() {
    return _prefs.getInt(FOUR_REACH_BETS);
  }

  int getParent() {
    return _prefs.getInt(FOUR_PARENT);
  }

  void setParent(int index) {
    _prefs.setInt(FOUR_PARENT, index);
    parent = index;
  }

  void tsumo(int playerIndex, int fu, int han) {
    ctlPlayer.tsumo(playerIndex, fu, han);
    if (playerIndex == _prefs.getInt(FOUR_PARENT)) {
      incrementPlace();
    }
  }

}

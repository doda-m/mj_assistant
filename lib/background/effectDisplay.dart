import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const FOUR_DISPLAY_PATH = '/four/display/';
const FOUR_DISPLAY_WIND = '/four/display/wind';
const FOUR_DISPLAY_STATION = '/four/display/parent';
const FOUR_DISPLAY_PLACE = '/four/display/place';

class EffectDisplay {
  final List<String> windList = ['東', '南', '西', '北'];
  final List<String> stationList = ['一局', '二局', '三局', '四局'];
  static int wind = 0;
  static int station = 0;
  static int place = 0;
  static int reachSticks = 0;

  final SharedPreferences _prefs;
  EffectDisplay(this._prefs) {
    wind = _prefs.getInt(FOUR_DISPLAY_WIND);
    station = _prefs.getInt(FOUR_DISPLAY_STATION);
    place = _prefs.getInt(FOUR_DISPLAY_PLACE);
  }

  void reset() {
    _prefs.setInt(FOUR_DISPLAY_WIND, 0);
    _prefs.setInt(FOUR_DISPLAY_STATION, 0);
    _prefs.setInt(FOUR_DISPLAY_PLACE, 0);
  }

  void incrementPlace () {
    place++;
    _prefs.setInt(FOUR_DISPLAY_PLACE, place);
  }

  void nextStation() {
    place = 0;
    station++;
    if (3 < station) {
      station = 0;
      wind++;
      _prefs.setInt(FOUR_DISPLAY_WIND, wind);
    }
    _prefs.setInt(FOUR_DISPLAY_STATION, station);
    _prefs.setInt(FOUR_DISPLAY_PLACE, place);
  }

  String getStation() {
    int nowWind = _prefs.getInt(FOUR_DISPLAY_WIND);
    int nowStation = _prefs.getInt(FOUR_DISPLAY_STATION);
    return windList[nowWind] + stationList[nowStation];
  }

  int getPlace() {
    return _prefs.getInt(FOUR_DISPLAY_PLACE);
  }


}

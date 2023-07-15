import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 0;
  }

  void setInt(String key, int i) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setInt(key, i);
  }

  void setStringList(String key, List<String> list) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, list);
  }

  Future<List<String>> getStringList(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(key) ?? [];
  }
}

import 'dart:async' show Future;

import 'package:etma_demo/res/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PreferenceUtils {
  static String userId;
  static bool userType;
  static String userName;

  static Future <SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance ();
  static SharedPreferences _prefsInstance;

  static Future <SharedPreferences> init () async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString (String key, [String defValue]) {
    return _prefsInstance.getString (key) ?? defValue ?? "";
  }

  static Future <bool> setString (String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString (key, value) ?? Future.value (null);
  }

  static Future <bool> setInt (String key, int value) async {
    var prefs = await _instance;
    return prefs?.setInt (key, value) ?? Future.value (null);
  }

  static int getInt (String key, [int defValue]) {
    return _prefsInstance.getInt (key) ?? defValue ?? 0;
  }

  static Future <bool> setBool (String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool (key, value) ?? Future.value (false);
  }

  static bool getBool (String key, [bool defValue]) {
    return _prefsInstance.getBool (key) ?? defValue ?? false;
  }

  static void clear(){
    _prefsInstance.clear();
  }


  static String getUserId(){
    userId = PreferenceUtils.getString(Strings.userIdKey);
    return userId;
  }
  static setUserId(String name) async{
    PreferenceUtils.setString(Strings.userIdKey, name);
  }

  static bool getPosterUser(){
    userType = PreferenceUtils.getBool(Strings.userTypeKey);
    return userType;
  }
  static setPosterUser(bool userType) async{
    PreferenceUtils.setBool(Strings.userTypeKey, userType);
  }

  static String getUserName(){
    userName = PreferenceUtils.getString(Strings.userNameKey);
    return userName;
  }
  static setUserName(String userName) async{
    PreferenceUtils.setString(Strings.userNameKey, userName);
  }
}
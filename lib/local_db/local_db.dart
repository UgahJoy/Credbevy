import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

mixin LocalDb {
  static SharedPreferences? preferences;
  static Future<SharedPreferences> _getInstance() async {
    if (preferences != null) {
      return preferences!;
    }
    preferences = await SharedPreferences.getInstance();
    return preferences!;
  }

  static Future<void> init() async {
    await _getInstance();
    return;
  }

  static Future<bool> setValue(String key, String value) async {
    return await (await _getInstance()).setString(key, value);
  }

  static Future<String> getValue(String key) async {
    return (await _getInstance()).getString(key) ?? "";
  }

  static Future<bool> clearDb() async {
    (await _getInstance()).clear();
    (await _getInstance()).reload();
    return true;
  }

  static const allCards = "ALL_CARDS";
  static const allExpenses = "ALL_EXPENSES";
  static const allBeneficiariesModel = "ALL_BENEFICIARIES";
  static const balance = "TIER_LISTING";
}

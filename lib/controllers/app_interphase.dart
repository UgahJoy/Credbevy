import 'dart:convert';
import 'package:credbevy/local_db/local_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInterface extends GetxController with LocalDb {
  ConnectionState networkCon = ConnectionState.waiting;
  String dbKey = "";
  String serverKey = "";

  @override
  void onInit() async {
    init();
    try {
      if (await localStore()) {
        fetchData();
      }
    } catch (ex) {
      fetchData();
    }

    super.onInit();
  }

  void init() {}

  Future<void> fetchData() async {}

  Future<bool> localStore() async {
    return true;
  }

  void insertData(String key, String value) async {
    LocalDb.setValue(key, value);
  }

  Future<dynamic> getData(String key, {bool convert = true}) async {
    if (convert) {
      var data = (await LocalDb.getValue(key)).toString();
      if (data.isEmpty) {
        return null;
      }
      return jsonDecode(data);
    }
    return await LocalDb.getValue(key);
  }
}

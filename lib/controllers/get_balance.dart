import 'dart:convert';
import 'package:credbevy/controllers/app_interphase.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/local_db/local_db.dart';
import 'package:credbevy/server/server.dart';
import 'package:flutter/material.dart';

class GetBalaceController extends AppInterface {
  double balance = 0.0;
//
  @override
  void init() {
    dbKey = LocalDb.balance;
    serverKey = "balance";
    super.init();
  }

  @override
  Future<void> fetchData() async {
    var response = await Server(key: serverKey).getRequest();
    networkCon = ConnectionState.done;
    if (processResponse(response,
        showErrorMessage: false, showSuccessMessage: false)) {
      var value = response['data'];
      balance = value;
      insertData(dbKey, jsonEncode(value));
    }

    update();
  }
}

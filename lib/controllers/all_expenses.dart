import 'dart:convert';
import 'package:credbevy/controllers/app_interphase.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/local_db/local_db.dart';
import 'package:credbevy/models/all_expanses.dart';
import 'package:credbevy/server/server.dart';
import 'package:flutter/material.dart';

class GetAllExpensesController extends AppInterface {
  List<AllExpensesModel> allExpenses = [];
  @override
  void init() {
    dbKey = LocalDb.allExpenses;
    serverKey = "myexpenses";
    super.init();
  }

  @override
  Future<void> fetchData() async {
    var response = await Server(key: serverKey).getRequest();
    networkCon = ConnectionState.done;
    if (processResponse(response,
        showErrorMessage: false, showSuccessMessage: false)) {
      var value = response['data'];
      allExpenses =
          (value as List).map((e) => AllExpensesModel.fromJson(e)).toList();
      insertData(dbKey, jsonEncode(value));
    }

    update();
  }
}

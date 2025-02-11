import 'dart:convert';
import 'package:credbevy/controllers/app_interphase.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/local_db/local_db.dart';
import 'package:credbevy/models/all_card.model.dart';
import 'package:credbevy/server/server.dart';
import 'package:flutter/material.dart';

class GetAllCardsController extends AppInterface {
  List<AllCardsModel> allCards = [];

  @override
  void init() {
    dbKey = LocalDb.allCards;
    serverKey = "cards";
    super.init();
  }

  @override
  Future<void> fetchData() async {
    var response = await Server(key: serverKey).getRequest();
    networkCon = ConnectionState.done;
    if (processResponse(response,
        showErrorMessage: false, showSuccessMessage: false)) {
      var value = response['data'];
      allCards = (value as List).map((e) => AllCardsModel.fromJson(e)).toList();
      insertData(dbKey, jsonEncode(value));
    }

    update();
  }
}

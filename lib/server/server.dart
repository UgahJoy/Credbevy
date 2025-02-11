// ignore_for_file: deprecated_member_use

import 'dart:convert' as convert;
import 'package:credbevy/helpers/global_variables/global_variables.dart';
import 'package:credbevy/helpers/helpers.dart';
import 'package:credbevy/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:http/retry.dart';

class Server {
  final String key;
  final bool isFull;
  final bool showProgressBar;
  final Function(bool)? onFinishDownload;
  Map<String, String>? header;
  final int timeout;
  static http.Client client = RetryClient(http.Client());
  static bool forceLogout = false;
  static const String _baseUrl =
      "https://credbevyinterview.jbenergyservices.com/public/api/user/interview/";
  static bool allowBounceOut = false;

  /// base class for making http request[Server]
  Server(
      {required this.key,
      this.timeout = 55,
      this.showProgressBar = false,
      this.isFull = false,
      this.onFinishDownload,
      this.header});

  ///call method to make a http request using get method [getRequest]
  ///it returns a list with the first element being the body while the last element is the response code
  Future<dynamic> getRequest() async {
    showProgresss();
    try {
      return await client
          .get(Uri.parse(isFull ? key : _baseUrl + key),
              headers: await _getHeader())
          .then((response) async {
        if (response.body.isEmpty) {
          return "failed";
        }

        var data = convert.jsonDecode(response.body);
        if (data.runtimeType != List &&
            (data as Map).containsKey("statusCode") &&
            data['statusCode'] == 401) {
          autoLogout();
          return "failed";
        }
        return data;
      }).timeout(Duration(seconds: timeout), onTimeout: () {
        return "failed";
      });
    } catch (ex) {
      return "failed";
    } finally {
      hideProgresss();
    }
  }

  ///call method to make a http request using post method [postRequest]
  ///it returns a list with the first element being the body while the last element is the response code
  Future<dynamic> postRequest(Map<String, dynamic> body) async {
    showProgresss();
    try {
      //var test = convert.jsonEncode(body);
      // print(test);
      return await client
          .post(Uri.parse(isFull ? key : _baseUrl + key),
              body: convert.json.encode(body), headers: await _getHeader())
          .then((response) {
        if (response.body.isEmpty) {
          logger(convert.json.encode(body));
          return "failed";
        }

        var data = convert.jsonDecode(response.body);
        if (data.runtimeType != List &&
            (data as Map).containsKey("statusCode") &&
            data['statusCode'] == 401) {
          autoLogout();
          return data["message"];
        }
        return data;
      }).timeout(Duration(seconds: timeout), onTimeout: () {
        return "failed";
      });
    } catch (ex) {
      logger(ex);
      return "failed";
    } finally {
      hideProgresss();
    }
  }

  void showProgresss() {
    if (showProgressBar) {
      showProgressContainer(navigatorKey.currentContext!);
    }
  }

  void hideProgresss() {
    if (showProgressBar) {
      Navigator.pop(navigatorKey.currentContext!);
    }
  }

  Future<dynamic> getFile(String url) async {
    try {
      final RetryClient client = RetryClient(http.Client());
      var data = await client
          .get(Uri.parse(url), headers: await _getHeader())
          .timeout(Duration(seconds: timeout));
      var bytes = data.bodyBytes;
      return bytes;
    } catch (e) {
      showAppSnackbar("connection timeout");
      return "Error opening url file";
    }
  }

  void autoLogout() async {
    if (forceLogout) {
      return;
    }
    if (!allowBounceOut) {
      return;
    }

    forceLogout = true;

    // LocalDb.dropDb();
    //  AppData.deleteControllers();
    // Get.offAll(const Login());
  }

  ///private method to return header   [_getHeader]
  Future<Map<String, String>> _getHeader() async {
    var value = <String, String>{
      'content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };
    return value;
  }
}

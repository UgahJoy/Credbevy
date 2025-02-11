// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

String token = "";
String orgId = "";
dynamic userId = 0;
dynamic agencyId = 0;
String email = "";
String roleId = "";
int selectedPropertyID = 0;
int selectedCustomerID = 0;
dynamic selectedBillID;

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

String datePicked() {
  var date = DateTime.now();
  return "${date.toString().split(" ")[0]}T10:27:37.676Z";
}

//Emuneration items
String selectedPropertyName = "";
String selectedCustomerName = "";
String selectedAgencyName = "";
int selectedRevID = 0;

/// report
dynamic selectedRevenue;
dynamic startDate;
dynamic endDate;

///billing
dynamic selectedCategoryID = 0;
dynamic selectedRevenueID = 0;

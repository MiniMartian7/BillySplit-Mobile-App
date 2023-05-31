import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? balanceUserCreditSum(List<BalanceRecord>? balanceInList) {
  double sum_credit = 0;

  if (balanceInList != null) {
    for (int i = 0; i < balanceInList.length; i++) {
      sum_credit += balanceInList[i].credit;
    }
    return sum_credit;
  } else
    return 0;
}

double? balanceUserDebtSum(List<BalanceRecord>? balanceInList) {
  double sum_debt = 0;

  if (balanceInList != null) {
    for (int i = 0; i < balanceInList.length; i++) {
      sum_debt += balanceInList[i].debt;
    }
    return sum_debt;
  } else
    return 0;
}

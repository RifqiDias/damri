import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class UtilsApp {
  String key;
  String value;
  // UtilsApp({this.key, this.value});

  static UtilsApp _instance = new UtilsApp.internal();
  UtilsApp.internal();
  factory UtilsApp() => _instance;

  saveToLocalString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getLocalString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(key);
  }

  saveToLocalBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getLocalBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(key);
  }

  saveToLocalInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getLocalInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt(key);
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyy HH:mm').format(dateTime);
  }

  String formatDateId(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  String formatDateEng(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String formatTimeId(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

//   String dateFormatId(DateTime date) {
//     return formatDate(date, [dd, '/', mm, '/', yyyy]);
//   }

//   String timeFormatId(DateTime date) {
//     return formatDate(date, [HH, ':', nn]);
//   }

//   String dateId(String date) {
//     return DateFormat("dd MMM yyyy").format(DateTime.parse(date));
//   }

//   showError(context, msg, alertType) {
//     Alert(
//         context: context,
//         type: alertType,
//         title: "Sorry..",
//         desc: msg,
//         style: AlertStyle(
//           isOverlayTapDismiss: false,
//           animationType: AnimationType.fromTop,
//           isCloseButton: false,
//           descStyle: TextStyle(fontWeight: FontWeight.bold),
//           animationDuration: Duration(milliseconds: 400),
//           alertBorder: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0.0),
//             side: BorderSide(
//               color: Colors.grey,
//             ),
//           ),
//           titleStyle: TextStyle(
//             color: Colors.red,
//           ),
//         ),
//         buttons: []).show();
//   }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

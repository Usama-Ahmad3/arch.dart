import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 30,
      backgroundColor: Colors.teal.shade100,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}

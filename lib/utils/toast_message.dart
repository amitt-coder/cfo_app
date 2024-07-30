import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {


  static void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM, int duration = 2}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration == 1 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: AppColor.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
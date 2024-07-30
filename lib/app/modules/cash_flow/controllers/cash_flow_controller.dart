import 'dart:async';
import 'dart:ffi';

import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashflowController extends GetxController{

  RxInt buttonSelect = 1.obs;
  var dividerPosition = 0.0.obs;

  Timer? _timer;
  // Define three observable color variables for the buttons
  var buttonColor1 = Rx<Color>(AppColor.primaryColor);
  var buttonColor2 = Rx<Color>(AppColor.whiteColor);
  var buttonColor3 = Rx<Color>(AppColor.whiteColor);

  // Define default and selected colors
  final Color defaultColor = AppColor.whiteColor;
  final Color selectedColor = AppColor.primaryColor;




  @override
  void onInit() {
    // TODO: implement onInit
    _startMovingDivider();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  // Method to toggle the color of the buttons
  void toggleColor(int buttonNumber) {
    buttonSelect.value = buttonNumber;

    if (buttonNumber == 1) {
      buttonColor1.value = selectedColor;
      buttonColor2.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 2) {
      buttonColor2.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 3) {
      buttonColor3.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor2.value = defaultColor;
    }
  }




  void _startMovingDivider() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        dividerPosition.value += 1;
        if (dividerPosition.value > 30) {
          dividerPosition.value = 10; // Reset to initial position
        }

    });
  }


}
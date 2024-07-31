import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyRatioAnalsisController extends GetxController{

  // RxDouble _dividerPosition = 10.obs as RxDouble;
  Timer? _timer;
  var dividerPosition = 0.0.obs;

  final List<KeyRatio> keyRatios = [
    KeyRatio(name: 'Current..', value:"1.5", benchmark:'1.0-2.0', interpretation: 'Healthy'),//7Healthy
    KeyRatio(name: 'Current..', value:"1.2", benchmark:'0.8-1.5', interpretation: 'Healthy'),//8Adequate
    KeyRatio(name: 'Current..', value:"1.2", benchmark:'0.8-1.5', interpretation: 'Healthy'),//6Strong
    KeyRatio(name: 'Current..', value:"1.2", benchmark:'0.8-1.5', interpretation: 'Healthy'),//9Efficient
    KeyRatio(name: 'Current..', value:"1.2", benchmark:'0.8-1.5', interpretation: 'Healthy'),//6Optimal
  ];

  Color getColorForInterpretation(String interpretation) {
    switch (interpretation) {
      case 'Healthy':
      case 'Strong':
      case 'Efficient':
      case 'Optimal':
        return Colors.green;
      case 'Adequate':
        return Colors.yellowAccent;
      default:
        return Colors.red;
    }
}

  @override
  void onInit() {
    _startMovingDivider();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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

class KeyRatio {
  final String name;
  final String value;
  final String benchmark;
  final String interpretation;

  KeyRatio({
    required this.name,
    required this.value,
    required this.benchmark,
    required this.interpretation,
  });
}
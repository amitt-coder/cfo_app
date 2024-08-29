import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/api.dart';

class KeyRatioAnalsisController extends GetxController{

  // RxDouble _dividerPosition = 10.obs as RxDouble;
  Timer? _timer;
  var dividerPosition = 0.0.obs;

  final List<KeyRatio> keyRatios = [
    KeyRatio(name: 'Current Ratio', value:"1.5", benchmark:'1.0-2.0', interpretation: 'Healthy'),//7Healthy
    KeyRatio(name: 'Quick Ratio', value:"1.2", benchmark:'0.8-1.5', interpretation: 'Optimal'),//8Adequate
    KeyRatio(name: 'Debt Cover', value:"2.5", benchmark:'0.8-1.5', interpretation: 'Strong'),//6Strong
    KeyRatio(name: 'AR Turnover', value:"6.0", benchmark:'0.8-1.5', interpretation: 'Efficient'),//9Efficient
    KeyRatio(name: 'AP Turnover', value:"10.0", benchmark:'0.8-1.5', interpretation: 'Efficient'),//6Optimal
    KeyRatio(name: 'Inventory', value:"12.0", benchmark:'0.8-1.5', interpretation: 'Optimal'),//6Optimal
    KeyRatio(name: 'Working', value:"4.0", benchmark:'0.8-1.5', interpretation: 'Efficient'),//6Optimal
  ];

  TextEditingController daysController = TextEditingController();
  RxString showday = 'Above 30 days'.obs;

  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;

  Rxn<DateTimeRange> selectedDateRange = Rxn<DateTimeRange>();
  TextEditingController dateRangeController = TextEditingController();



  Color getColorForInterpretation(String interpretation) {
    switch (interpretation) {
      case 'Healthy':
      case 'Strong':
      case 'Efficient':
      case 'Optimal':
        return Colors.green;
      case 'Adequate':
        return Colors.yellow;
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

  Future<void> pickDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (picked != null) {
      selectedDateRange.value = picked;
    }
    final range = selectedDateRange.value;
    final startDate = DateFormat('yyyy-MM-dd').format(range!.start);
    final endDate = DateFormat('yyyy-MM-dd').format(range.end);

    print('StartDate: ${startDate}');
    print('endDate: ${endDate}');

    dateRangeController.text = startDate + " to " + endDate;

    print('dateRangeController: ${dateRangeController.text.toString()}');
  }



  Future<dynamic> keyRatioApi() async {

    print('-------keyRatioApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.last_week}${userId}');

    try {
      var response = await http.get(Uri.parse(''),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);
          print('ResponseData: ${responseData}');
        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: ${e}');
      return e;
    }
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
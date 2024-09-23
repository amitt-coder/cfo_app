import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/api.dart';

class KeyRatioAnalsisController extends GetxController {
  // RxDouble _dividerPosition = 10.obs as RxDouble;

  final List<KeyRatio> keyRatios = [
    KeyRatio(
        name: 'Current Ratio',
        value: "1.5",
        benchmark: '1.0-2.0',
        interpretation: 'Healthy'), //7Healthy
    KeyRatio(
        name: 'Quick Ratio',
        value: "1.2",
        benchmark: '0.8-1.5',
        interpretation: 'Optimal'), //8Adequate
    KeyRatio(
        name: 'Debt Cover',
        value: "2.5",
        benchmark: '0.8-1.5',
        interpretation: 'Strong'), //6Strong
    KeyRatio(
        name: 'Daily Base',
        value: "6.0",
        benchmark: '0.8-1.5',
        interpretation: 'Efficient'), //9Efficient
    KeyRatio(
        name: 'Daily Payment Out',
        value: "10.0",
        benchmark: '0.8-1.5',
        interpretation: 'Efficient'), //6Optimal
    KeyRatio(
        name: 'Inventory',
        value: "12.0",
        benchmark: '0.8-1.5',
        interpretation: 'Optimal'), //6Optimal
    KeyRatio(
        name: 'Working Capital Ratio',
        value: "4.0",
        benchmark: '0.8-1.5',
        interpretation: 'Efficient'), //6Optimal
  ];

  //Working - Working Capital Ratio
  //Inventory - Days
  //AR Turnover - Daily Base
  //AP Turnover - Daily Payment Out

  TextEditingController daysController = TextEditingController();
  Rxn<DateTimeRange> selectedDateRange = Rxn<DateTimeRange>();
  TextEditingController dateRangeController = TextEditingController();

  Timer? _timer;
  var dividerPosition = 0.0.obs;
  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;
  var ratios = <dynamic>[].obs;

  var spotsData = <FlSpot>[].obs;

  //   Color getColorForInterpretation(String interpretation) {
//     // print('interpretation: ${interpretation}');
//     switch (interpretation) {
//       case 'Healthy':
//       case 'Strong':
//       case '1.5':
//       case '1.2':
//       case '1.8':
//       case '0.9':
//       case '0.8':
//         return Colors.green;
//       case 'Efficient':
//       case 'Optimal':
//       case '12.0':
//       case '10.0':
//       case '6.0':
//       case '2.5':
//       case '4.0':
//         return Colors.red;
//       default:
//         return Colors.yellow;
//     }
// }

  Color getColorForInterpretation(double value) {
    if (value >= 1.0 && value <= 2.0) {
      // Values between 1.0 and 2.0 are considered 'Healthy'
      return Colors.green;
    } else if (value > 2.0) {
      // Values above 2.0 are considered 'Efficient' or 'Optimal'
      return Colors.green;
    } else if (value < 1.0) {
      // Values below 1.0 but greater than 0.1 are considered less than 'Healthy'
      return Colors.green;
    } else {
      // Values below 0.1 are also considered 'Unhealthy'
      return Colors.red;
    }
  }

  @override
  void onInit() {
    _startMovingDivider();
    keyRatioApi("2024-05-05", "2024-05-20");
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startMovingDivider() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Ensure spotsData is not empty before accessing its elements
      if (spotsData.isNotEmpty) {
        dividerPosition.value += 1;
        if (dividerPosition.value > spotsData.last.x) {
          dividerPosition.value =
              spotsData.first.x; // Reset to initial position based on data
        }
      } else {
        // Handle the case where spotsData is empty if necessary
        dividerPosition.value = 0; // Or some default value
      }
    });
  }

  // void _startMovingDivider() {
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //       dividerPosition.value += 1;
  //       if (dividerPosition.value > 30) {
  //         dividerPosition.value = 10; // Reset to initial position
  //       }
  //   });
  // }

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

    print('StartDate: $startDate');
    print('endDate: $endDate');

    dateRangeController.text = "$startDate to $endDate";

    // print('dateRangeController: ${dateRangeController.text.toString()}');
    keyRatioApi(startDate, endDate);
  }

  void updateGraphData(List<dynamic> ratioData) {
    print('-----updateGraphData-------');
    // Clear the previous data
    spotsData.clear();

    // Parse the ratio data and convert it to FlSpot for the graph
    for (int i = 0; i < ratioData.length; i++) {
      var item = ratioData[i];

      // Use the index `i` for the x-axis (time/index) and a distinct value for the y-axis (e.g., `item['value']`)
      double x = i.toDouble(); // x can be the index or time point
      double y = item['value'] != null
          ? double.parse(item['value'].toStringAsFixed(1))
          : 0.0; // Replace 'value' with your actual key

      // Add the valid FlSpot point
      spotsData.add(FlSpot(x, y));
      print('spotsData: $spotsData');
    }

    print('spotsData : $spotsData');
  }

  Future<dynamic> keyRatioApi(String startDate, String endDate) async {
    print('-------keyRatioApi--------');

    print('startDate: $startDate');
    print('endDate: $endDate');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.ratio}$userId/$startDate/$endDate/');

    try {
      var response = await http.get(
        Uri.parse('${Api.ratio}$userId/$startDate/$endDate/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );

      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        ratios.value = responseData['data'];
        var ratioData =
            responseData['data']; // Assuming 'data' holds the ratio information
        print('ratios: ${ratios}');
        // Update the graph with the API data
        updateGraphData(ratioData);

        // String stringValue = "1.2425730440491334";
        // double value = double.parse(stringValue);
        // String formattedValue = value.toStringAsFixed(1);
        // print("value: $formattedValue");
        // final name = ratios[0]['name'];
        // final value = ratios[0]['value'];
        // final minimum = ratios[0]['minimum'];
        // final maximum = ratios[0]['maximum'];
        // print('Ratio name: $name');
        // print('Ratio value: $value');
        // print('Ratio minimum: $minimum');
        // print('Ratio maximum: $maximum');

        return responseData;
      } else {
        print('Failed with statusCode: ${response.statusCode}');
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

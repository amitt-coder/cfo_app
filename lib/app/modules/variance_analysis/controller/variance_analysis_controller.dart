import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VarianceAnalysisController extends GetxController {
  TextEditingController salesController = TextEditingController();
  RxString showProperty = 'Expenses'.obs;
  RxList<String> showpropertyList = ['Sales', 'Expenses'].obs;
  RxString showday = 'rolling 3 months'.obs;
  RxList<String> dayList =
      ['Q1', 'Q2', 'Q3', 'Q4', 'rolling 3 months', 'rolling 6 months'].obs;

  RxList<Map<String, dynamic>> varianceData = [
    {
      'account': 'Sales',
      'month1': '100,000',
      'month2': '105,000',
      'month3': '110,000',
      'average': '105,000',
    },
    {
      'account': 'Expenses',
      'month1': '60,000',
      'month2': '55,000',
      'month3': '65,000',
      'average': '60,000',
    },
  ].obs;

  void updateVarianceData(String period) {
    // Update your data based on the selected period
    // For example:
    if (period == 'Q1') {
      // Update data for Q1
    } else if (period == 'Rolling 3 months') {
      // Update data for rolling 3 months
    }
    // And so on...

    // setState(() {
    //   // Trigger UI update
    // });
  }
}

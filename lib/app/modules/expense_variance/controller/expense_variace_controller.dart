import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExpenseVarianceController extends GetxController{
  TextEditingController daysController = TextEditingController();
  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;
}
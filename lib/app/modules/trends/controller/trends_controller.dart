import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../data/api.dart';

class TrendsController extends GetxController{


  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  final selectedDate = DateTime.now().obs;

  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;


  Future<void> calendarOpen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value = picked;
      String formattedDate =
      DateFormat('dd-MM-yyyy').format(selectedDate.value);
      dateController.text = formattedDate;
      print('selectedDate.value ${dateController.text}');
    }
  }


  Future<dynamic> trendsApi() async {

    print('-------trendsApi--------');

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


      print('response Status: ${response.statusCode}');

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
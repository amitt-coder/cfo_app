import 'dart:convert';
import 'package:cfo_app/app/data/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../../utils/images.dart';
import 'package:http/http.dart' as http;

class AccountPayablesController extends GetxController {

  final storage = GetStorage();

  final selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  RxBool creditorShow = false.obs;
  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;
  TextEditingController categoryController = TextEditingController();
  RxString showCategory = 'Cateogory A'.obs;
  RxList<String> showCategoryList =
      ['Cateogory A', 'Cateogory B', 'Cateogory C'].obs;

  List<Items> ItemList = [
    Items(
        Name: "Mohit",
        image: ProjectImages.a_category,
        Db: '-40,000',
        LP: '01-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Amit.",
        image: ProjectImages.b_category,
        Db: '+40,000',
        LP: '10-05-2024',
        CINFO: '123-4'),
    Items(
        Name: "Divy.",
        image: ProjectImages.c_category,
        Db: '+40,000',
        LP: '11-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Ashok.",
        image: ProjectImages.a_category,
        Db: '-40,000',
        LP: '14-09-2024',
        CINFO: '123-4'),
    Items(
        Name: "Aman.",
        image: ProjectImages.b_category,
        Db: '+40,000',
        LP: '05-06-2024',
        CINFO: '123-4'),
  ];
   RxList<dynamic> creditors=[].obs;

  void onInit() {
    super.onInit();
    accountPayableApi();
  }


  void debitor() {
    creditorShow.value = !creditorShow.value;
    print('creditorShow ${creditorShow.value}');
    update();
  }

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


  Future<dynamic> accountPayableApi() async {

    print('-------accountPayableApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.filter_creditors}${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.filter_creditors}${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        creditors.value = responseData['creditor'] ?? [];
        final List<dynamic> debtors = responseData['debtor'] ?? [];

        // print('creditors: ${creditors}');
        // print('debtors: ${debtors}');



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

  Future<dynamic> filterbyDay(String days) async {

    print('-------filterbyDay--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.filter_by_day_debtor_creditor}${userId}/${days}/');

    try {
      var response = await http.get(Uri.parse('${Api.filter_by_day_debtor_creditor}${userId}/${days}/'),
      // var response = await http.get(Uri.parse('http://cfo2.webzcon.in/api/filter_by_day_debtor_creditor/8/90/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        creditors.value = responseData['Creditors'] ?? [];
        final List<dynamic> debtors = responseData['debtor'] ?? [];

        print('creditors: ${creditors}');
        // print('debtors: ${debtors}');

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

class Items {
  String Name;
  String image;
  String Db;
  String LP;
  String CINFO;
  Items({
    required this.Name,
    required this.image,
    required this.Db,
    required this.LP,
    required this.CINFO,
  });
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/images.dart';

class ArWithCreditBalanceController extends GetxController {


  final storage = GetStorage();


  RxBool debitorShow = false.obs;

  TextEditingController daysController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  final selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();
  RxString showCategory = 'Cateogory A'.obs;
  RxList<String> showCategoryList =
      ['Cateogory A', 'Cateogory B', 'Cateogory C'].obs;

  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;


  RxList<Items> ItemList = [
    Items(
        Name: "Vishal",
        image: ProjectImages.a_category,
        Db: '+50,000',
        LP: '01-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Arpit",
        image: ProjectImages.b_category,
        Db: '-50,000',
        LP: '10-05-2024',
        CINFO: '123-4'),
    Items(
        Name: "Akshay",
        image: ProjectImages.c_category,
        Db: '+50,000',
        LP: '11-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Pankaj",
        image: ProjectImages.a_category,
        Db: '+50,000',
        LP: '14-09-2024',
        CINFO: '123-4'),
    Items(
        Name: "Suresh",
        image: ProjectImages.b_category,
        Db: '-50,000',
        LP: '05-06-2024',
        CINFO: '123-4'),
  ].obs;

  void debitor() {
    debitorShow.value = !debitorShow.value;
    print('debitorShow ${debitorShow.value}');
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

  Future<dynamic> accountReceivableApi() async {

    print('---------accountReceivableApi--------');

    String? userId = storage.read('USER_ID');
    String? token = storage.read('accessToken');

    var request = http.Request('GET', Uri.parse(''));
    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print('res: ${res}');

    if (response.statusCode == 200 || response.statusCode == 201) {

      print('api successfully work');

      var responseData = json.decode(res);
      print('responseData: ${responseData}');
    } else if (response.statusCode == 404) {
      print('Error: Not Found ${response.statusCode}');
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error ${response.statusCode}');
    } else if (response.statusCode == 429) {
      print('Error: Too Many Request ${response.statusCode}');
    } else {
      print('Error: ${response.statusCode}');
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

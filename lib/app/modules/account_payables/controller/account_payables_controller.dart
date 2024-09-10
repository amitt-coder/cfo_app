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
  RxString showCategory = 'Category A'.obs;
  RxList<String> showCategoryList = ['Category A', 'Category B', 'Category C'].obs;
    RxInt totalDebitBalance =0.obs;
  var filteredCreditors = [].obs;
  RxList<dynamic> creditors=[].obs;


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



  void onInit() {
    super.onInit();
    accountPayableApi();
    update();
  }


  // void debitor() {
  //   creditorShow.value = !creditorShow.value;
  //   print('creditorShow ${creditorShow.value}');
  //   update();
  // }


  Future<void> calendarOpen(BuildContext context) async {
    showCategory.value = 'Category A';
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value = picked;
      String formattedDate = DateFormat('yyy-MM-dd').format(selectedDate.value);
      print('formattedDate: $formattedDate');
      dateController.text= formattedDate;
      print('selectedDate.value: ${dateController.text.toString()}');
      showCategory.value = 'Category A';
      filterbyCustomeDateApi();
    }
  }


  String getImageForCategory(String category) {
    print('getImageForCategory: ${category}');
    switch (category) {
      case 'A':
        return ProjectImages.a_category;
      case 'B':
        return ProjectImages.b_category;
      case 'C':
        return ProjectImages.c_category;
      default:
        return ProjectImages.a_category;
    }

  }


  void filterByCategory() {
    print('filterByCategory: $showCategory');
    List<String> splitParts = showCategory.value.split(' ');

    // Check if the splitParts has at least two elements to avoid index out of range error
    if (splitParts.length >= 2) {
      String categoryValue = splitParts[1];
      print('categoryValue: $categoryValue');
      showCategory.value=categoryValue;
    } else {
      print('Invalid Category');
    }

    if (showCategory.value.isEmpty) {
      filteredCreditors.value = creditors;
    } else {
      filteredCreditors.value = creditors.where((creditor) =>
      creditor['category']['category'] == showCategory.value).toList();
    }

    if (filteredCreditors.isEmpty) {
      print("Data Not Found");
    }
    showCategory.value = 'Category A';
  }

  Future<dynamic> accountPayableApi() async {

    print('-------accountPayableApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');


    print('url:${Api.filter_creditors}${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.filter_creditors}${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );


      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        creditors.value = responseData['creditor'] ?? [];
        final List<dynamic> debtors = responseData['debtor'] ?? [];

        // print('creditors: ${creditors}');
        // print('debtors: ${debtors}');
        double totalAmount = 0.0;

        // Iterate through the list and sum up all the total_balance amounts
        for (var creditor in creditors) {
          // Convert total_balance to a double, handling possible formatting issues
          double balance = double.tryParse(creditor['total_balance'].replaceAll(',', '')) ?? 0.0;
          totalAmount += balance;
        }
        // print('Total Amount: ${totalAmount}');
        totalDebitBalance.value = totalAmount.toInt();
        print('totalDebitBalance: ${totalDebitBalance.value}');
        creditors.value = responseData['creditor']; // Assuming the API response structure
        filterByCategory();

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

      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        creditors.value = responseData['Creditors'] ?? [];
        showCategory.value = 'Category A';
        filterByCategory();

        print('creditors: ${creditors}');
        double totalAmount = 0.0;

        // Iterate through the list and sum up all the total_balance amounts
        for (var creditor in creditors) {
          // Convert total_balance to a double, handling possible formatting issues
          double balance = double.tryParse(creditor['total_balance'].replaceAll(',', '')) ?? 0.0;
          totalAmount += balance;
        }

        totalDebitBalance.value = totalAmount.toInt();
        print('totalDebitBalance: ${totalDebitBalance.value}');
        // creditors.value = responseData['Creditors']; // Assuming the API response structure
        // filterByCategory();

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


  Future<dynamic> filterbyCustomeDateApi() async {

    print('-------filterbyCustomeDateApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('${Api.filter_by_custome_date}${userId}/${dateController.text}');

    try {
      var response = await http.get(Uri.parse('${Api.filter_by_custome_date}${userId}/${dateController.text}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        // final List<dynamic> creditors = responseData['Creditors'] ?? [];
        // final List<dynamic> debtors = responseData['Debtors'] ?? [];
        // filterByCategory();
        ///
        creditors.value = responseData['Creditors'] ?? [];
        // final List<dynamic> debtors = responseData['debtor'] ?? [];

        print('creditors: ${creditors}');
        // print('debtors: ${debtors}');
        double totalAmount = 0.0;

        // Iterate through the list and sum up all the total_balance amounts
        for (var creditor in creditors) {
          // Convert total_balance to a double, handling possible formatting issues
          double balance = double.tryParse(creditor['total_balance'].replaceAll(',', '')) ?? 0.0;
          totalAmount += balance;
        }
        // print('Total Amount: ${totalAmount}');
        totalDebitBalance.value = totalAmount.toInt();
        print('totalDebitBalance: ${totalDebitBalance.value}');
        creditors.value = responseData['Creditors']; // Assuming the API response structure
        showCategory.value = 'Category A';
        filterByCategory();
        // update();

        print('creditors: $creditors');

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

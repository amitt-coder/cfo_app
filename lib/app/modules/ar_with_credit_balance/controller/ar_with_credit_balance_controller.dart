import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/images.dart';
import '../../../data/api.dart';

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

  var filteredCreditors = [].obs;
  RxInt totalCreditBalance =0.obs;
  RxList<String> categoryImages = <String>[].obs; // To store images based on category
  RxList<dynamic> debtors=[].obs;


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



  void onInit() {
    super.onInit();
    accountReceivableApi();
    update();
  }


  String getImageForCategory(String category) {
    print('getImageForCategory: ${category}');
    switch (category.toLowerCase()) {
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

    print('filterByCategory');

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
      filteredCreditors.value = debtors;
    } else {
      filteredCreditors.value = debtors.where((creditor) =>
      creditor['category']['category'] == showCategory.value).toList();
    }
    if (filteredCreditors.isEmpty) {
      print("Data Not Found");
    }
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
      String formattedDate = DateFormat('yyy-MM-dd').format(selectedDate.value);
      print('formattedDate: $formattedDate');
      dateController.text= formattedDate;
      print('selectedDate.value: ${dateController.text}');
      filterbyCustomeDateApi();
    }
  }

  Future<dynamic> accountReceivableApi() async {

    print('-------accountReceivableApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('url:${Api.filter_debtor}${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.filter_debtor}${userId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        debtors.value = responseData['debtor'] ?? [];
        // final List<dynamic> debtors = responseData['debtor'] ?? [];

        // print('creditors: ${creditors}');
        print('debtors: ${debtors}');
        double totalAmount = 0.0;

        // Iterate through the list and sum up all the total_balance amounts
        for (var creditor in debtors) {
          // Convert total_balance to a double, handling possible formatting issues
          double balance = double.tryParse(creditor['total_balance'].replaceAll(',', '')) ?? 0.0;
          totalAmount += balance;
        }
        totalCreditBalance.value = totalAmount.toInt();
        print('totalCreditBalance: ${totalCreditBalance.value}');
        debtors.value = responseData['debtor']; // Assuming the API response structure
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

    print('url:${Api.filter_by_day_debtor_creditor}${userId}/${days}/');

    try {
      var response = await http.get(Uri.parse('${Api.filter_by_day_debtor_creditor}${userId}/${days}/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);


        // print('creditors: ${creditors}');
        // print('debtors: ${debtors}');

        debtors.value = responseData['Debtors'] ?? [];
        // final List<dynamic> debtors = responseData['debtor'] ?? [];

        // print('creditors: ${creditors}');
        print('debtors: ${debtors}');

        showCategory.value = 'Category A';

        filterByCategory();

        double totalAmount = 0.0;

        // Iterate through the list and sum up all the total_balance amounts
        for (var creditor in debtors) {
          // Convert total_balance to a double, handling possible formatting issues
          double balance = double.tryParse(creditor['total_balance'].replaceAll(',', '')) ?? 0.0;
          totalAmount += balance;
        }
        totalCreditBalance.value = totalAmount.toInt();
        print('totalCreditBalance: ${totalCreditBalance.value}');
        debtors.value = responseData['creditor']; // Assuming the API response structure


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
      );


      print('response statusCode: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        // final List<dynamic> creditors = responseData['Creditors'] ?? [];
        final List<dynamic> debtors = responseData['Debtors'] ?? [];
        // filterByCategory();
        update();

        print('debtors: ${debtors}');
        print('Response Data: ${responseData}');



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

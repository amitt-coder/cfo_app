import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../data/api.dart';
import 'package:http/http.dart' as http;

class TrendsController extends GetxController{


  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  final selectedDate = DateTime.now().obs;


  RxList<String> creditorsList = <String>[].obs;
  RxList<String> debtorsList = <String>[].obs;

  RxList<String> creditorsAmountList = <String>[].obs;
  RxList<String> debtorsAmountList = <String>[].obs;

  RxList<String> creditorsdueDateList = <String>[].obs;
  RxList<String> debtordueDateList = <String>[].obs;

  RxList<String> creditorslastPaymentDate = <String>[].obs;
  RxList<String> debtorlastPaymentDate = <String>[].obs;

  RxList<String> creditorInvoiceIds = <String>[].obs;
  RxList<String> debtorInvoiceIds = <String>[].obs;

  RxList<dynamic> allCreditor=[].obs;
  RxList<dynamic> allDebtor=[].obs;

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
      filterbyCustomeDateApi();//api calling
    }
  }


  Future<dynamic> filterbyCustomeDateApi() async {

    print('-------filter_by_custom_date--------');

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

        final List<dynamic> creditors = responseData['Creditors'] ?? [];
        final List<dynamic> debtors = responseData['Debtors'] ?? [];
        allCreditor.value = responseData['Creditors'] ?? [];
        allDebtor.value = responseData['Debtors'] ?? [];

        creditorsList.clear();
        creditorsAmountList.clear();
        creditorsdueDateList.clear();
        creditorslastPaymentDate.clear();
        creditorInvoiceIds.clear();
        // Populate creditors
        for (var creditor in creditors) {
          creditorsList.add(creditor['name']);
          creditorsAmountList.add(creditor['total_balance']);
          creditorsdueDateList.add(creditor['due_date']);
          creditorslastPaymentDate.add(creditor['last_payment_date']);
          creditorInvoiceIds.add(creditor['id'].toString());
        }
        debtorsList.clear();
        debtorsAmountList.clear();
        debtordueDateList.clear();
        debtorlastPaymentDate.clear();
        debtorInvoiceIds.clear();
        // Populate debtors
        for (var debtor in debtors) {
          debtorsList.add(debtor['name']);
          debtorsAmountList.add(debtor['total_balance']);
          debtordueDateList.add(debtor['due_date']);
          debtorlastPaymentDate.add(debtor['last_payment_date']);
          debtorInvoiceIds.add(debtor['id'].toString());
        }

        update();
        // print('Response Data: ${responseData}');

        print('creditorsList: $creditorsList');
        print('debtorsList: ${debtorsList}');

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
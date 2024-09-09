import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../data/api.dart';

class ExpenseVarianceController extends GetxController{
  TextEditingController daysController = TextEditingController();
  TextEditingController dateRangeController = TextEditingController();
  RxString showday = 'Above 30 days'.obs;
  RxList<String> dayList =
      ['Above 30 days', 'Above 60 days', 'Above 90 days', 'Above 120 days'].obs;

  RxString creditors_amount=''.obs;
  RxString debtors_amount=''.obs;
  RxString total_amount=''.obs;
  RxList cashIn=[].obs;
  final List<double> cashOut=[];

  RxList<FlSpot> debtorSpots = <FlSpot>[].obs;
  RxList<FlSpot> creditorSpots = <FlSpot>[].obs;
  RxDouble highestAmount=0.0.obs;
  RxDouble lowestAmount=0.0.obs;
  RxList cashInPercentages=[].obs;

  var dividerPosition = 0.0.obs;
  var crBalance = 0.0.obs;

  Rxn<DateTimeRange> selectedDateRange = Rxn<DateTimeRange>();

  void onInit() {
    super.onInit();
    expenseVarianceApi('2024-09-09','2024-09-10');
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

    print('StartDate: $startDate');
    print('endDate: $endDate');

    dateRangeController.text = startDate + " to " + endDate;

    print('dateRangeController: ${dateRangeController.text.toString()}');
    expenseVarianceApi(startDate,endDate);
  }


  List<FlSpot> convertCreditorData(List<Map<String, dynamic>> creditors) {
    return List<FlSpot>.generate(
      creditors.length,
          (index) {
        final totalBalance = double.parse(creditors[index]['total_balance']);
        // print('cr total $totalBalance');
        cashIn.add(totalBalance);
        print('cashIn ${cashIn}');
        updateCrBalance(totalBalance); // Update balance
        return FlSpot(index.toDouble(), totalBalance);
      },
    );
  }

  List<FlSpot> convertDebtorData(List<Map<String, dynamic>> debtors) {
    return List<FlSpot>.generate(
      debtors.length,
          (index) {
        final totalBalance = double.parse(debtors[index]['total_balance']);
        cashOut.add(totalBalance);
        print('cashOut ${cashOut}');
        return FlSpot(index.toDouble(), totalBalance);
      },
    );
  }


  void updateDividerPosition(double newPosition) {
    dividerPosition.value = newPosition;
  }

  // Method to update balance
  void updateCrBalance(double newBalance) {
    crBalance.value = double.parse(newBalance.toString());
  }


  Future<dynamic> expenseVarianceApi(String startDate,String endDate) async {

    print('--------expenseVarianceApi--------');

    print('startDate: $startDate');
    print('endDate: $endDate');
    //parameters: budget,actual, variance,data
    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);

    print('url:${Api.expense}$userId/$startDate/$endDate/');

    try {
      var response = await http.get(Uri.parse('${Api.expense}$userId/$startDate/$endDate/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {

        var responseData = json.decode(response.body);

        creditors_amount.value=responseData['creditors_amount'].toString();
        debtors_amount.value=responseData['debtors_amount'].toString();
        total_amount.value=responseData['total_amount'].toString();

        String jsonString = '''
    {
      "creditor": [
        {
          "id": 4,
          "name": "Aman",
          "contact_no": "9988447387",
          "email": "mailto:aman@gmail.com",
          "total_balance": "40000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-20",
          "outstanding_invoices": [
            {
              "Invoice": 12362,
              "Due": "2024-08-22"
            }
          ],
          "created_at": "2024-08-22T13:13:29.224684Z",
          "created_from": 1
        }, 
        {
          "id": 4,
          "name": "Aman",
          "contact_no": "9988447387",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-20",
          "outstanding_invoices": [
            {
              "Invoice": 12362,
              "Due": "2024-08-22"
            }
          ],
          "created_at": "2024-08-22T13:13:29.224684Z",
          "created_from": 1
        },
        {
          "id": 4,
          "name": "Aman",
          "contact_no": "9988447387",
          "email": "mailto:aman@gmail.com",
          "total_balance": "60000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-20",
          "outstanding_invoices": [
            {
              "Invoice": 12362,
              "Due": "2024-08-22"
            }
          ],
          "created_at": "2024-08-22T13:13:29.224684Z",
          "created_from": 1
        },
        {
          "id": 4,
          "name": "Aman",
          "contact_no": "9988447387",
          "email": "mailto:aman@gmail.com",
          "total_balance": "70000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-20",
          "outstanding_invoices": [
            {
              "Invoice": 12362,
              "Due": "2024-08-22"
            }
          ],
          "created_at": "2024-08-22T13:13:29.224684Z",
          "created_from": 1
        },
         {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
         {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "70000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        }
      ],
      "debtor": [
        {
          "id": 3,
          "name": "Divy",
          "contact_no": "9988447376",
          "email": "mailto:divy@gmail.com",
          "total_balance": "40000",
          "last_payment_date": "2024-08-01",
          "due_date": "2024-07-28",
          "outstanding_invoices": [
            {
              "Invoice": 12241,
              "Due": "2024-08-21"
            },
            {
              "Invoice": 12243,
              "Due": "2024-08-04"
            },
            {
              "Invoice": 12244,
              "Due": "2024-08-12"
            },
            {
              "Invoice": 12245,
              "Due": "2024-08-10"
            }
          ],
          "created_at": "2024-08-22T13:20:21.790467Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Divy",
          "contact_no": "9988447376",
          "email": "mailto:divy@gmail.com",
          "total_balance": "90000",
          "last_payment_date": "2024-08-01",
          "due_date": "2024-07-28",
          "outstanding_invoices": [
            {
              "Invoice": 12241,
              "Due": "2024-08-21"
            },
            {
              "Invoice": 12243,
              "Due": "2024-08-04"
            },
            {
              "Invoice": 12244,
              "Due": "2024-08-12"
            },
            {
              "Invoice": 12245,
              "Due": "2024-08-10"
            }
          ],
          "created_at": "2024-08-22T13:20:21.790467Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Divy",
          "contact_no": "9988447376",
          "email": "mailto:divy@gmail.com",
          "total_balance": "30000",
          "last_payment_date": "2024-08-01",
          "due_date": "2024-07-28",
          "outstanding_invoices": [
            {
              "Invoice": 12241,
              "Due": "2024-08-21"
            },
            {
              "Invoice": 12243,
              "Due": "2024-08-04"
            },
            {
              "Invoice": 12244,
              "Due": "2024-08-12"
            },
            {
              "Invoice": 12245,
              "Due": "2024-08-10"
            }
          ],
          "created_at": "2024-08-22T13:20:21.790467Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Divy",
          "contact_no": "9988447376",
          "email": "mailto:divy@gmail.com",
          "total_balance": "60000",
          "last_payment_date": "2024-08-01",
          "due_date": "2024-07-28",
          "outstanding_invoices": [
            {
              "Invoice": 12241,
              "Due": "2024-08-21"
            },
            {
              "Invoice": 12243,
              "Due": "2024-08-04"
            },
            {
              "Invoice": 12244,
              "Due": "2024-08-12"
            },
            {
              "Invoice": 12245,
              "Due": "2024-08-10"
            }
          ],
          "created_at": "2024-08-22T13:20:21.790467Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Divy",
          "contact_no": "9988447376",
          "email": "mailto:divy@gmail.com",
          "total_balance": "45000",
          "last_payment_date": "2024-08-01",
          "due_date": "2024-07-28",
          "outstanding_invoices": [
            {
              "Invoice": 12241,
              "Due": "2024-08-21"
            },
            {
              "Invoice": 12243,
              "Due": "2024-08-04"
            },
            {
              "Invoice": 12244,
              "Due": "2024-08-12"
            },
            {
              "Invoice": 12245,
              "Due": "2024-08-10"
            }
          ],
          "created_at": "2024-08-22T13:20:21.790467Z",
          "created_from": 1
        },
        {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "20000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
        {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "80000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
        {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "30000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
        {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
         {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
         {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        },
         {
          "id": 5,
          "name": "Aman",
          "contact_no": "8969686886",
          "email": "mailto:aman@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-08-15",
          "due_date": "2024-08-22",
          "outstanding_invoices": [
            {
              "Invoice": 12248,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:23:00.929506Z",
          "created_from": 1
        }
      ],
      "creditors_amount": 25000,
      "debtors_amount": 50000,
      "total_amount": 25000
    }
    ''';

        final data = jsonDecode(jsonString) as Map<String, dynamic>;

        var creditors = List<Map<String, dynamic>>.from(data['creditor']);
        var debtors = List<Map<String, dynamic>>.from(data['debtor']);

        creditorSpots.value = convertCreditorData(creditors);
        debtorSpots.value = convertDebtorData(debtors);
        print('creditorSpots: $creditorSpots');
        print('debtorSpots: $debtorSpots');

        // Extract only creditor due dates
        // dates.clear();
        // dates.addAll(creditors.map((item) {
        //   final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
        //   final DateFormat outputFormat = DateFormat('dd MMM yyyy');
        //
        //   DateTime date = inputFormat.parse(item['due_date']);
        //   return outputFormat.format(date);
        // }).toList());

        // Extract only debtors due dates
        // debtordates.clear();
        // debtordates.addAll(debtors.map((item) {
        //   final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
        //   final DateFormat outputFormat = DateFormat('dd MMM yyyy');
        //
        //   DateTime date = inputFormat.parse(item['due_date']);
        //   return outputFormat.format(date);
        // }).toList());
        // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //   // Update the dividerPosition to move the line smoothly
        //   double newPosition = (dividerPosition.value + 1) % (dates.length - 1);
        //   updateDividerPosition(newPosition);
        // });

        print('cashIn: $cashIn');
        print('cashOut: $cashOut');

        final List<double> combinedList = [...cashIn, ...cashOut];

        // Find the highest and lowest amounts
        highestAmount.value = combinedList.reduce((a, b) => a > b ? a : b);
        lowestAmount.value = combinedList.reduce((a, b) => a < b ? a : b);

        print('Highest Amount: $highestAmount');
        print('Lowest Amount: $lowestAmount');

        final maxCashInValue = cashIn.reduce((a, b) => a > b ? a : b);
        cashInPercentages.value = cashIn.map((value) => (value / maxCashInValue) * 100).toList();
        update();
        // print('ResponseData: ${responseData}');
        return responseData;
      } else {
        print('Failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }




}
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CashflowController extends GetxController{

  RxInt buttonSelect = 1.obs;
  var dividerPosition = 0.0.obs;

  RxString creditors_amount=''.obs;
  RxString debtors_amount=''.obs;
  RxString total_amount=''.obs;

  Timer? _timer;
  // Define three observable color variables for the buttons
  var buttonColor1 = Rx<Color>(AppColor.primaryColor);
  var buttonColor2 = Rx<Color>(AppColor.whiteColor);
  var buttonColor3 = Rx<Color>(AppColor.whiteColor);

  // Define default and selected colors
  final Color defaultColor = AppColor.whiteColor;
  final Color selectedColor = AppColor.primaryColor;


  RxString showday = 'Last week'.obs;
  RxList<String> dayList =
      ['Last week','Last month', 'Last quarter',].obs;

  TextEditingController daysController = TextEditingController();
  TextEditingController numberofdaysReceiptController = TextEditingController();
  TextEditingController numberofdaysPaymentController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  final selectedDate = DateTime.now().obs;

  var selectedValue = 'AR'.obs;

  // List Debitors$credtors = [
  //   "Aadtiya Kolasani",
  //   "Aarika Singh    ",
  //   "Abel Binnis George",
  //   "Abrar Hussain     "
  // ];
  // List DebitorscredtorsAmount = [
  //   "+36000",
  //   "-30000",
  //   "-50000",
  //   "+80000",
  // ];
  RxBool isViewingCreditors = true.obs;
  RxList<String> creditorsList = <String>[].obs;
  RxList<String> debtorsList = <String>[].obs;
  RxList<String> creditorsAmountList = <String>[].obs;
  RxList<String> debtorsAmountList = <String>[].obs;

  void selectValue(String value) {
    selectedValue.value = value;
  }

  // void startMovingDivider() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     dividerPosition.value += 1;
  //     if (dividerPosition.value > 30) {
  //       dividerPosition.value = 10; // Reset to initial position
  //     }
  //   });
  // }




   // Accessor for animation value


  RxList<FlSpot> debtorSpots = <FlSpot>[].obs;
  RxList<FlSpot> creditorSpots = <FlSpot>[].obs;

  var creditorDueDates = <String>[].obs;
  var debtorDueDates = <String>[].obs;
  var dueDates = <String>[].obs;


  RxString formattedDate =''.obs;
  List<String> dates =[];
  List<String> debtordates =[];
  double verticalLineX = 0.0; // Initial x position of the vertical line
  // RxString crBalance = ''.obs;
  var crBalance = 0.0.obs; // Example balance
  final List<double> cashIn=[];
  final List<double> cashOut=[];
  RxDouble highestAmount=0.0.obs;
  RxDouble lowestAmount=0.0.obs;

  void onInit() {
    super.onInit();
    lastWeekApi();
    String jsonString = '''
    {
      "creditor": [
        {
          "id": 3,
          "name": "Ashok",
          "contact_no": "8969686800",
          "email": "mailto:ashok@gmail.com",
          "total_balance": "100000",
          "last_payment_date": "2024-05-11",
          "due_date": "2024-05-08",
          "outstanding_invoices": [
            {
              "Invoice": 12360,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:12:25.898552Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Amit",
          "contact_no": "8969686800",
          "email": "mailto:ashok@gmail.com",
          "total_balance": "80000",
          "last_payment_date": "2024-05-11",
          "due_date": "2024-05-08",
          "outstanding_invoices": [
            {
              "Invoice": 12360,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:12:25.898552Z",
          "created_from": 1
        },
         {
          "id": 3,
          "name": "Amit",
          "contact_no": "8969686800",
          "email": "mailto:ashok@gmail.com",
          "total_balance": "40000",
          "last_payment_date": "2024-05-11",
          "due_date": "2024-05-08",
          "outstanding_invoices": [
            {
              "Invoice": 12360,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:12:25.898552Z",
          "created_from": 1
        },
        {
          "id": 3,
          "name": "Amit",
          "contact_no": "8969686800",
          "email": "mailto:ashok@gmail.com",
          "total_balance": "50000",
          "last_payment_date": "2024-05-11",
          "due_date": "2024-05-08",
          "outstanding_invoices": [
            {
              "Invoice": 12360,
              "Due": "2024-08-15"
            }
          ],
          "created_at": "2024-08-22T13:12:25.898552Z",
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
          "total_balance": "80000",
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

    // Extract only creditor due dates
    dates.clear();
    dates.addAll(creditors.map((item) {
      final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
      final DateFormat outputFormat = DateFormat('dd MMM yyyy');

      DateTime date = inputFormat.parse(item['due_date']);
      return outputFormat.format(date);
    }).toList());

  // Extract only debtors due dates
    debtordates.clear();
    debtordates.addAll(debtors.map((item) {
      final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
      final DateFormat outputFormat = DateFormat('dd MMM yyyy');

      DateTime date = inputFormat.parse(item['due_date']);
      return outputFormat.format(date);
    }).toList());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Update the dividerPosition to move the line smoothly
      double newPosition = (dividerPosition.value + 1) % (dates.length - 1);
      updateDividerPosition(newPosition);
    });

    final List<double> combinedList = [...cashIn, ...cashOut];

    // Find the highest and lowest amounts
     highestAmount.value = combinedList.reduce((a, b) => a > b ? a : b);
     lowestAmount.value = combinedList.reduce((a, b) => a < b ? a : b);

    print('Highest Amount: $highestAmount');
    print('Lowest Amount: $lowestAmount');

  }


  // Method to update the position, e.g., for animation
  void updateDividerPosition(double newPosition) {
    dividerPosition.value = newPosition;
  }

  // Method to update balance
  void updateCrBalance(double newBalance) {
    crBalance.value = double.parse(newBalance.toString());
  }

  // List<FlSpot> convertCreditorData(List<Map<String, dynamic>> creditors) {
  //   return List<FlSpot>.generate(
  //     creditors.length,
  //         (index) {
  //       final totalBalance = double.parse(creditors[index]['total_balance']);
  //       print('cr total $totalBalance');
  //       crBalance.value=totalBalance;
  //       return FlSpot(index.toDouble(), totalBalance);
  //     },
  //   );
  // }

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





  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Method to toggle the color of the buttons
  void toggleColor(int buttonNumber) {
    buttonSelect.value = buttonNumber;

    if (buttonNumber == 1) {
      buttonColor1.value = selectedColor;
      buttonColor2.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 2) {
      buttonColor2.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 3) {
      buttonColor3.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor2.value = defaultColor;
    }
  }


  Future<void> calendarOpen(BuildContext context,) async {
    print('Calendar Open');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value  = picked;
      // String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);2024-08-22
      String formattedDate = DateFormat('yyy-MM-dd').format(selectedDate.value);

      print('formattedDate $formattedDate');

      dateController.text= formattedDate;
      print('selectedDate.value ${dateController.text}');
      filterbyCustomeDateApi();
    }
  }

  Future<dynamic> lastWeekApi() async {

    print('-------last_week_api--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    // Map<String, dynamic> requestBody = {
    //   'id': userId,
    // };
    // String encodedBody = json.encode(requestBody);
    print('url:${Api.last_week}/${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.last_week}/${userId}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        final List<dynamic> creditors = responseData['creditor'] ?? [];
        final List<dynamic> debtors = responseData['debtor'] ?? [];

        print('creditors: ${creditors}');
        print('debtors: ${debtors}');

        creditorsList.clear();
        creditorsAmountList.clear();
        // Populate creditors
        for (var creditor in creditors) {
          creditorsList.add(creditor['name']);
          creditorsAmountList.add(creditor['total_balance']);
        }
        debtorsList.clear();
        debtorsAmountList.clear();
        // Populate debtors
        for (var debtor in debtors) {
          debtorsList.add(debtor['name']);
          debtorsAmountList.add(debtor['total_balance']);
        }

          creditors_amount.value=responseData['creditors_amount'].toString();
          debtors_amount.value=responseData['debtors_amount'].toString();
          total_amount.value=responseData['total_amount'].toString();

        print('creditors_amount: ${creditors_amount}');
        print('debtors_amount: ${debtors_amount}');
        print('total_amount: ${total_amount}');



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

  Future<dynamic> lastMonthApi() async {

    print('-------lastMonthApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('url: ${Api.last_month}/${userId}');

    try {
      var response = await http.get(Uri.parse('${Api.last_month}/${userId}'),
      // var response = await http.get(Uri.parse('http://cfo2.webzcon.in/api/last_month/8'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {

        var responseData = json.decode(response.body);

        final List<dynamic> creditors = responseData['creditor'] ?? [];
        final List<dynamic> debtors = responseData['debtor'] ?? [];
        creditorsList.clear();
        creditorsAmountList.clear();
        // Populate creditors
        for (var creditor in creditors) {
          creditorsList.add(creditor['name']);
          creditorsAmountList.add(creditor['total_balance']);
        }
        debtorsList.clear();
        debtorsAmountList.clear();
        // Populate debtors
        for (var debtor in debtors) {
          debtorsList.add(debtor['name']);
          debtorsAmountList.add(debtor['total_balance']);
        }
        creditors_amount.value=responseData['creditors_amount'].toString();
        debtors_amount.value=responseData['debtors_amount'].toString();
        total_amount.value=responseData['total_amount'].toString();
        // print('Response Data: ${responseData}');

        print('debtorsList: ${debtorsList}');
        print('debtorsAmountList: ${debtorsAmountList}');
        print('creditorsList: ${creditorsList}');
        print('creditorsAmountList: ${creditorsAmountList}');
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
        // var response = await http.get(Uri.parse('http://cfo2.webzcon.in/api/last_month/8'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

        final List<dynamic> creditors = responseData['Creditors'] ?? [];
        final List<dynamic> debtors = responseData['Debtors'] ?? [];

        creditorsList.clear();
        creditorsAmountList.clear();
        // Populate creditors
        for (var creditor in creditors) {
          creditorsList.add(creditor['name']);
          creditorsAmountList.add(creditor['total_balance']);
        }
        debtorsList.clear();
        debtorsAmountList.clear();
        // Populate debtors
        for (var debtor in debtors) {
          debtorsList.add(debtor['name']);
          debtorsAmountList.add(debtor['total_balance']);
        }

        creditors_amount.value=responseData['creditors_amount'].toString();
        debtors_amount.value=responseData['debtors_amount'].toString();
        total_amount.value=responseData['total_amount'].toString();
        print('Response Data: ${responseData}');
        print('debtorsList: ${debtorsList}');
        print('debtorsAmountList: ${debtorsAmountList}');
        print('creditorsList: ${creditorsList}');
        print('creditorsAmountList: ${creditorsAmountList}');
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


  Future<dynamic> filterCreditorsApi() async {

    print('-------filterCreditorsApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('url: ${Api.filter_creditors}$userId');

    try {
      var response = await http.get(Uri.parse('${Api.filter_creditors}${8}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

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

  Future<dynamic> filterDebtorApi() async {

    print('-------filterDebtorApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    print('url: ${Api.filter_debtor}$userId');

    try {
      var response = await http.get(Uri.parse('${Api.filter_debtor}${8}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          // body: encodedBody,
      );


      print('response Status ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = json.decode(response.body);

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
class Creditor {
  final DateTime dueDate;
  final double totalBalance;

  Creditor({required this.dueDate, required this.totalBalance});

  factory Creditor.fromJson(Map<String, dynamic> json) {
    return Creditor(
      dueDate: DateTime.parse(json['due_date']),
      totalBalance: double.parse(json['total_balance']),
    );
  }
}

class Debtor {
  final DateTime dueDate;
  final double totalBalance;

  Debtor({required this.dueDate, required this.totalBalance});

  factory Debtor.fromJson(Map<String, dynamic> json) {
    return Debtor(
      dueDate: DateTime.parse(json['due_date']),
      totalBalance: double.parse(json['total_balance']),
    );
  }
}
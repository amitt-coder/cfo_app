import 'dart:async';
import 'dart:convert';
import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CashflowController extends GetxController {

  RxInt buttonSelect = 1.obs;
  var dividerPosition = 0.0.obs;

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

  var selectedValue = 'AR'.obs;
  List Debitors$credtors = [
    "Aadtiya Kolasani",
    "Aarika Singh    ",
    "Abel Binnis George",
    "Abrar Hussain     "
  ];
  List DebitorscredtorsAmount = [
    "+36000",
    "-30000",
    "-50000",
    "+80000",
  ];
  void selectValue(String value) {
    selectedValue.value = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _startMovingDivider();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    cashFlowApi();
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

  void _startMovingDivider() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      dividerPosition.value += 1;
      if (dividerPosition.value > 30) {
        dividerPosition.value = 10; // Reset to initial position
      }
    });
  }
  TextEditingController dateController = TextEditingController();
  final selectedDate = DateTime.now().obs;
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
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);

      print('formattedDate $formattedDate');

      dateController.text= formattedDate;
      print('selectedDate.value ${dateController.text}');

    }
  }

  Future<dynamic> cashFlowApi() async {

    print('-------cashFlowApi--------');

    final storage = GetStorage();

    String? token = storage.read('accessToken');
    String? userId = storage.read('USER_ID');

    Map<String, dynamic> requestBody = {
      'id': userId,
    };

    String encodedBody = json.encode(requestBody);

    print('data pass to api: ${encodedBody.toString()}');

    try {
      var response = await http.post(Uri.parse(''),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: encodedBody,
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

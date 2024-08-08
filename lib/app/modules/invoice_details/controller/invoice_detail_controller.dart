import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InvoiceDetailController extends GetxController{

  RxString userName = ''.obs;
  RxString paymentDate = ''.obs;
  RxString crBalance = ''.obs;
  RxString whichDetail = ''.obs;

  TextEditingController descriptionController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    userName.value = args?['userName'] ?? 'DefaultUser';
    crBalance.value = args?['crBalance'] ?? 'DefaultUser';
    paymentDate.value = args?['paymentDate'] ?? 'DefaultUser';
    whichDetail.value = args?['whichDetail'] ?? 'DefaultUser';
    // print('userName ${userName.value}');
  // print('crBalance ${crBalance.value}');
  // print('payment ${paymentDate.value}');
  // print('whichDetail ${whichDetail.value}');
  }




}
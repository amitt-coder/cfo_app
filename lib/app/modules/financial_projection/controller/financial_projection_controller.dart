import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FinancialProjectionController extends GetxController {
  RxBool firstCheck = false.obs;
  RxBool secondCheck = false.obs;
  RxBool thirdCheck = false.obs;

  TextEditingController discountRate = TextEditingController();
  TextEditingController growthRate = TextEditingController();

  void checkCondition() {
    print('checkCondition ${firstCheck.value}');
    // firstCheck.value=!firstCheck.value;
    print('checkCondition2 ${firstCheck.value}');
    if (firstCheck == false) {
      firstCheck.value = true;
    } else {
      // secondCheck.value=true;
      print('checkCondition3 ${secondCheck.value}');
      if (secondCheck == false) {
        secondCheck.value = true;
      } else {
        thirdCheck.value = true;
      }
    }
  }

}

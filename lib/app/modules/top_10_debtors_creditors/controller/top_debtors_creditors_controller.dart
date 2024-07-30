import 'package:get/get.dart';

class TopDebtorsCreditorsController extends GetxController{
  var selectedValue = 'Top 10 Debitors'.obs;
  var selectPrice = 'Weekly'.obs;

  void selectValue(String value) {
    selectedValue.value = value;
    print("SelectD&C================================${selectedValue.value}");
  }
  void selectmonth(String value) {
    selectPrice.value = value;
  }


}
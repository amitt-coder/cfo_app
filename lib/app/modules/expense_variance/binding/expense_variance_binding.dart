import 'package:get/get.dart';

import '../controller/expense_variace_controller.dart';

class ExpenseVarianceBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<ExpenseVarianceController>(() => ExpenseVarianceController());
  }

}
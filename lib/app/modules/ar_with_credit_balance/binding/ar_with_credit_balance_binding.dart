import 'package:cfo_app/app/modules/ar_with_credit_balance/controller/ar_with_credit_balance_controller.dart';
import 'package:get/get.dart';

class ArWithCreditBalanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ArWithCreditBalanceController>(() => ArWithCreditBalanceController());
  }

}
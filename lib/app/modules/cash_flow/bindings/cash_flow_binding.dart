
import 'package:cfo_app/app/modules/cash_flow/controllers/cash_flow_controller.dart';
import 'package:get/get.dart';

class CashflowBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<CashflowController>(() => CashflowController());
  }

}
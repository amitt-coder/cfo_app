import 'package:cfo_app/app/modules/cash_flow_statement/controller/cash_flow_statement_controller.dart';
import 'package:get/get.dart';

class CashFlowStatementBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CashFlowStatementController>(() => CashFlowStatementController());
  }

}
import 'package:cfo_app/app/modules/financial_projection/controller/financial_projection_controller.dart';
import 'package:get/get.dart';

class FinancialProjectionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FinancialProjectionController>(() => FinancialProjectionController());
  }

}
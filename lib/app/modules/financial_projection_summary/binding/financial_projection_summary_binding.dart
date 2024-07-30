import 'package:get/get.dart';

import '../controller/financial_projection_summary_controller.dart';

class FinancialProjectionSummaryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FinancialProjectionSummaryController>(() => FinancialProjectionSummaryController());
  }

}

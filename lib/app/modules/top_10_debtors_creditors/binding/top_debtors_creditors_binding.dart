import 'package:cfo_app/app/modules/top_10_debtors_creditors/controller/top_debtors_creditors_controller.dart';
import 'package:get/get.dart';

class TopDetorsCreditorsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TopDebtorsCreditorsController>(() => TopDebtorsCreditorsController());
  }

}
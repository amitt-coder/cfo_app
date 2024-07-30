import 'package:cfo_app/app/modules/account_reclassification/controller/account_reclassification_controller.dart';
import 'package:get/get.dart';

class AccountReclassificationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountReclassificationController>(() => AccountReclassificationController());
  }

}
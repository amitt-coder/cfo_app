import 'package:get/get.dart';
import '../controller/account_reclassification_controller.dart';


class AccountReclassificationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountReclassificationController>(() => AccountReclassificationController());
  }

}
import 'package:cfo_app/app/modules/account_payables/controller/account_payables_controller.dart';
import 'package:get/get.dart';

class AccountPayablesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountPayablesController>(() => AccountPayablesController());
  }

}
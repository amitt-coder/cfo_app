import 'package:get/get.dart';

import '../controllers/account_verfiy_controller.dart';

class AccountVerfiyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountVerfiyController>(
      () => AccountVerfiyController(),
    );
  }
}

import 'package:cfo_app/app/modules/tds_check/controller/tds_check_controller.dart';
import 'package:get/get.dart';

class TdsCheckBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<TdsCheckController>(() => TdsCheckController());
  }

}
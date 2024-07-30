import 'package:cfo_app/app/modules/all_creditors/controller/all_creditor_controller.dart';
import 'package:get/get.dart';

class AllCreditorBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<AllCreditorController>(() => AllCreditorController());
  }

}
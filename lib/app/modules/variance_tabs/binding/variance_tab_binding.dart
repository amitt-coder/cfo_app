import 'package:cfo_app/app/modules/variance_tabs/controller/variance_tabs_controller.dart';
import 'package:get/get.dart';

class VarianceTabsBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<VarianceTabsController>(() => VarianceTabsController());
  }

}
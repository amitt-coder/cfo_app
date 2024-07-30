import 'package:cfo_app/app/modules/purchase_order_list/controller/purchase_order_list_controller.dart';
import 'package:get/get.dart';

class PurchaseOrderListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PurchaseOrderListController>(() => PurchaseOrderListController());
  }
}

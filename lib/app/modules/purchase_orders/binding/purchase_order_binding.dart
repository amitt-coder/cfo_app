import 'package:cfo_app/app/modules/purchase_orders/controllers/purchase_order_controller.dart';
import 'package:get/get.dart';

class PurchaseOrderBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PurchaseOrderController>(() => PurchaseOrderController());
  }

}
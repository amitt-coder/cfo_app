import 'package:cfo_app/app/modules/revenue_variance/revenue_variance_controller.dart';
import 'package:get/get.dart';

class RevenueVarianceBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<RevenueVarianceController>(() => RevenueVarianceController());
  }

}
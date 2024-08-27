import 'package:cfo_app/app/modules/trends/controller/trends_controller.dart';
import 'package:get/get.dart';

class TrendsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TrendsController>(() => TrendsController());
  }

}
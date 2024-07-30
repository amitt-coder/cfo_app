import 'package:cfo_app/app/modules/key_ratio_analysis/controller/key_ratio_analysis_controller.dart';
import 'package:get/get.dart';

class KeyRatioAnalsisBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<KeyRatioAnalsisController>(() => KeyRatioAnalsisController());
  }

}
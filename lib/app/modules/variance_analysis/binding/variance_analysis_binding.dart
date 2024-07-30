import 'package:cfo_app/app/modules/variance_analysis/controller/variance_analysis_controller.dart';
import 'package:get/get.dart';

class VarianceAnalysisBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VarianceAnalysisController>(() => VarianceAnalysisController());
  }
}

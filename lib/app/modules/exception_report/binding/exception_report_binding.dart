import 'package:cfo_app/app/modules/exception_report/controller/exception_report_controller.dart';
import 'package:get/get.dart';

class ExceptionReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExceptionReportController>(() => ExceptionReportController());
      }
}
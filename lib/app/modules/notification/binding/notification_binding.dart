import 'package:cfo_app/app/modules/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }

}

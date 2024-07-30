import 'package:cfo_app/app/modules/drawer/controller/drawer_controller.dart';
import 'package:get/get.dart';

class DrawerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DrawerController>(() => DrawerController());
  }

}

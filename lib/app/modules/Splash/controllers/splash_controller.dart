import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;

  final storage = GetStorage();

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), () {
      var userId = storage.read(
        'USER_ID',
      );
      if (userId == null) {
        Get.toNamed(Routes.ON_BOARDING);
      } else {
        Get.offAllNamed(Routes.DASH_BOARD);
      }
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

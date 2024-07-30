import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;


  Future<Timer>loadData()async{
    return Timer(Duration(seconds: 3), () {
      print("Iss loadess");
      Get.toNamed(Routes.ON_BOARDING);
      print("Iss loadess");
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

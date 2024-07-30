import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  //TODO: Implement OnBoardingController


  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void onSkipPressed() {
    // Get.off(SignInView());
  }

  void onNextPressed() {
    // Get.off(SignInView());
  }
  List OnBoardingData = [
    {
      "title": 'Empower Your\nMoney',
      "description": 'Tired of juggling spreadsheets and receipts?\nCFO puts your finances at your fingertips.\nTrack income, expenses, and invoices\n– all in one place.',
      "images":'assets/images/onboarding1.svg'
    },
    {
      "title": 'Track Everything,\nEffortlessly',
      "description": 'No more scrambling to remember\ntransactions. CFO automatically organizes\nyour income and expenses, giving you a\nclear view of your financial health.',
      "images":'assets/images/onboarding2.svg'

    },
    {
      "title": 'Make Smarter\nDecisions',
      "description": 'Gain valuable insights with CFO easy-to-\nread reports. See where your money goes\nand make informed decisions for your\nfinancial future.',
      "images":'assets/images/onboarding3.svg'
    },
  ];
  // continueMethod(int index) {
  //   currentindex.value=   index;
  // }
  PageController pageController = PageController();

  final count = 0.obs;
  @override
  void onInit() {
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

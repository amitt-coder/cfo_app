import 'package:cfo_app/app/modules/revenue_variance/view/revenue_variance_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../customers/customer_screen.dart';
import '../../expense_variance/view/expense_variance_view.dart';

class VarianceTabsController extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt buttonSelect = 1.obs;
  RxString showCategory = 'Cateogory A'.obs;
  RxList<String> showCategoryList =
      ['Cateogory A', 'Cateogory B', 'Cateogory C'].obs;

  TextEditingController categoryController = TextEditingController();
  // Define three observable color variables for the buttons
  var buttonColor1 = Rx<Color>(AppColor.primaryColor);
  var buttonColor2 = Rx<Color>(AppColor.whiteColor);
  var buttonColor3 = Rx<Color>(AppColor.whiteColor);

  // Define default and selected colors
  final Color defaultColor = AppColor.whiteColor;
  final Color selectedColor = AppColor.primaryColor;
  RxString whichUser = ''.obs;
  late TabController tabController;

  List<Widget> listingScreens = [
    ExpenseVariancesView(),
    RevenueVariancesView(),
  ];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    final args = Get.arguments as Map<String, dynamic>?;
    whichUser.value = args?['whichUser'] ?? 'DefaultUser';
  }

  // Method to toggle the color of the buttons
  void toggleColor(int buttonNumber) {
    buttonSelect.value = buttonNumber;

    if (buttonNumber == 1) {
      buttonColor1.value = selectedColor;
      buttonColor2.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 2) {
      buttonColor2.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor3.value = defaultColor;
    } else if (buttonNumber == 3) {
      buttonColor3.value = selectedColor;
      buttonColor1.value = defaultColor;
      buttonColor2.value = defaultColor;
    }
  }

}
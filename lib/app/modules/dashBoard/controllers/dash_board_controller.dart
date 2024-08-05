import 'package:cfo_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class DashBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;

  var activeSlide = 0.obs;

  List banner = [
    ProjectImages.banner,
    ProjectImages.banner,
    ProjectImages.banner,
  ];

  List Debitors$credtors = [
    "Aadtiya Kolasani",
    "Aarika Singh    ",
    "Abel Binnis George",
    "Abrar Hussain     "
  ];
  List summary = [
    "EBITDA",
    "EBIT",
    "Burn Rate",
  ];
  var selectedValue = 'Top 10 Debitors'.obs;

  void selectValue(String value) {
    selectedValue.value = value;
  }

  final List<double> ebitda = [
    10.03,
    20.04,
    15.585,
    1200.89,
    1500.00,
    5.585,
    3000.89,
    150.00,
    25.01,
    28.85,
    45.8,
    85.0,
    3000.89,
    1500.00,
    1200.89,
    1500.00,
    5.585,
    100.89,
    750.00,
    1025.01,
    3000.89,
    1500.00,
    1200.89,
    1500.00,
    5.585,
    3000.89,
    750.00,
    1025.01
  ].obs;

  // Sample months data
  List<Items> ItemList = [
    // Items(title: "Customers", image: ProjectImages.customers),
    // Items(title: "Invoices", image: ProjectImages.invoices),
    // Items(title: "Bills", image: ProjectImages.bills),
    // Items(title: "Expenses", image: ProjectImages.expenses),
    // Items(title: "AR", image: ProjectImages.ar),
    // Items(title: "AP", image: ProjectImages.ap),
    Items(title: "Projection", image: ProjectImages.projection),
    Items(title: "Cashflow", image: ProjectImages.cashOverFlow),
    Items(title: "MIS", image: ProjectImages.mis),
    Items(title: "Compliances", image: ProjectImages.complainces),
  ];

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

class Items {
  String title;
  String image;
  Items({required this.title, required this.image});
}

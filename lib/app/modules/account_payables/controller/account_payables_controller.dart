import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../utils/images.dart';

class AccountPayablesController extends GetxController {
  final selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  RxBool creditorShow = false.obs;
  RxString showday = 'Last 30 days'.obs;
  RxList<String> dayList = ['Last 30 days', 'Last 60 days','Last 90 days','Last 120 days'].obs;

  List<Items> ItemList = [
    Items(
        Name: "Mohit",
        image: ProjectImages.a_category,
        Db: '-40,000',
        LP: '01-06-2024',
        CINFO: '123-4'),
    Items(
        Name: "Amit.",
        image: ProjectImages.b_category,
        Db: '+40,000',
        LP: '10-05-2024',
        CINFO: '123-4'),
    Items(
        Name: "Divy.",
        image: ProjectImages.c_category,
        Db: '+40,000',
        LP: '11-07-2024',
        CINFO: '123-4'),
    Items(
        Name: "Ashok.",
        image: ProjectImages.a_category,
        Db: '-40,000',
        LP: '14-09-2024',
        CINFO: '123-4'),
    Items(
        Name: "Aman.",
        image: ProjectImages.b_category,
        Db: '+40,000',
        LP: '05-06-2024',
        CINFO: '123-4'),
  ];

  void debitor() {
    creditorShow.value = !creditorShow.value;
    print('creditorShow ${creditorShow.value}');
    update();
  }

  Future<void> calendarOpen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value = picked;
      String formattedDate =
          DateFormat('dd-MM-yyyy').format(selectedDate.value);
      dateController.text = formattedDate;
      print('selectedDate.value ${dateController.text}');
    }
  }
}

class Items {
  String Name;
  String image;
  String Db;
  String LP;
  String CINFO;
  Items({
    required this.Name,
    required this.image,
    required this.Db,
    required this.LP,
    required this.CINFO,
  });
}

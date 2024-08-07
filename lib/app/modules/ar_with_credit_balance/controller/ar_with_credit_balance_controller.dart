import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/images.dart';

class ArWithCreditBalanceController extends GetxController{


  RxBool debitorShow = false.obs;

  TextEditingController daysController = TextEditingController();
  RxString showday = 'Last 30 days'.obs;
  RxList<String> dayList = ['Last 30 days', 'Last 60 days', 'Last 90 days','Last 120 days'].obs;
  final selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();


  RxList<Items> ItemList = [
    Items(Name: "Vishal", image: ProjectImages.a_category,Db:'+2000',LP:'01-06-2024',CINFO: '123-4'),
    Items(Name: "Arpit", image: ProjectImages.b_category,Db:'-5000',LP:'10-05-2024',CINFO: '123-4'),
    Items(Name: "Akshay", image: ProjectImages.c_category,Db:'+8000',LP:'11-07-2024',CINFO: '123-4'),
    Items(Name: "Pankaj", image: ProjectImages.a_category,Db:'+7000',LP:'14-09-2024',CINFO: '123-4'),
    Items(Name: "Suresh", image: ProjectImages.b_category,Db:'-3000',LP:'05-06-2024',CINFO: '123-4'),
  ].obs;


  void debitor(){
    debitorShow.value = !debitorShow.value;
    print('debitorShow ${debitorShow.value}');
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
    required this.CINFO,});
}


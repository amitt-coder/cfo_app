import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/images.dart';

class AccountPayablesController extends GetxController{

  List<Items> ItemList = [
    Items(Name: "Mohit", image: ProjectImages.a_category,Db:'6000',LP:'01-06-2024',CINFO: '123-4'),
    Items(Name: "Amit.", image: ProjectImages.b_category,Db:'5000',LP:'10-05-2024',CINFO: '123-4'),
    Items(Name: "Divy.", image: ProjectImages.c_category,Db:'7000',LP:'11-07-2024',CINFO: '123-4'),
    Items(Name: "Ashok.", image: ProjectImages.a_category,Db:'8000',LP:'14-09-2024',CINFO: '123-4'),
    Items(Name: "Aman.", image: ProjectImages.b_category,Db:'4000',LP:'05-06-2024',CINFO: '123-4'),
  ];

  final selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();

  Future<void> calendarOpen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      selectedDate.value = picked;

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

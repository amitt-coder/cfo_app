import 'package:get/get.dart';

import '../../../../utils/images.dart';

class ArWithCreditBalanceController extends GetxController{


  RxList<Items> ItemList = [
    Items(Name: "Vishal", image: ProjectImages.a_category,Db:'2000',LP:'01-06-2024',CINFO: '123-4'),
    Items(Name: "Arpit", image: ProjectImages.b_category,Db:'5000',LP:'10-05-2024',CINFO: '123-4'),
    Items(Name: "Akshay", image: ProjectImages.c_category,Db:'8000',LP:'11-07-2024',CINFO: '123-4'),
    Items(Name: "Pankaj", image: ProjectImages.a_category,Db:'7000',LP:'14-09-2024',CINFO: '123-4'),
    Items(Name: "Suresh", image: ProjectImages.b_category,Db:'3000',LP:'05-06-2024',CINFO: '123-4'),
  ].obs;

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


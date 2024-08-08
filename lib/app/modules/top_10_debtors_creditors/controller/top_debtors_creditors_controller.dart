import 'package:get/get.dart';
import '../../../../utils/images.dart';

class TopDebtorsCreditorsController extends GetxController{
  var selectedValue = 'Top 10 Debitors'.obs;
  var selectPrice = 'Weekly'.obs;

  void selectValue(String value) {
    selectedValue.value = value;
  }

  void selectmonth(String value) {
    selectPrice.value = value;
  }

  List<Items> ItemList = [
    Items(
        Name: "Mohit",
        image: ProjectImages.a_category,
        weekly: '₹1,000',
        monthly: '₹2,000',
        quarterly: '₹3,000'),
    Items(
        Name: "Amit.",
        image: ProjectImages.b_category,
        weekly: '₹2,000',
        monthly: '₹3,000',
        quarterly: '₹35,00'),
    Items(
        Name: "Divy.",
        image: ProjectImages.c_category,
        weekly: '₹4,000',
        monthly: '₹5,000',
        quarterly: '₹1,000'),
    Items(
        Name: "Ashok.",
        image: ProjectImages.a_category,
        weekly: '₹2,000',
        monthly: '₹6,000',
        quarterly: '₹7,000'),
    Items(
        Name: "Aman.",
        image: ProjectImages.b_category,
        weekly: '₹3,000',
        monthly: '₹4,000',
        quarterly: '₹5,000'),
    Items(
        Name: "Akshay.",
        image: ProjectImages.c_category,
        weekly: '₹6,000',
        monthly: '₹7,000',
        quarterly: '₹8,000'),
    Items(
        Name: "Tarun.",
        image: ProjectImages.a_category,
        weekly: '₹2,000',
        monthly: '₹35,000',
        quarterly: '₹5,000'),
    Items(
        Name: "Chandra.",
        image: ProjectImages.b_category,
        weekly: '₹3,000',
        monthly: '₹35,00',
        quarterly: '₹45,00'),
    Items(
        Name: "Pankaj.",
        image: ProjectImages.c_category,
        weekly: '₹4,000',
        monthly: '₹55,00',
        quarterly: '₹65,00'),
    Items(
        Name: "Vishal.",
        image: ProjectImages.a_category,
        weekly: '₹4,000',
        monthly: '₹5,000',
        quarterly: '₹6,000'),
  ];

}


class Items {
  String Name;
  String image;
  String weekly;
  String monthly;
  String quarterly;
  Items({
    required this.Name,
    required this.image,
    required this.weekly,
    required this.monthly,
    required this.quarterly,
  });
}
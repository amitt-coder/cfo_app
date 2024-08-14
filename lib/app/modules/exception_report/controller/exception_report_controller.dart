import 'package:get/get.dart';
import '../../../../utils/images.dart';

class ExceptionReportController extends GetxController{

  List<Items> ItemList = [
    Items(title: "AR", image: ProjectImages.ar),
    Items(title: "AP", image: ProjectImages.ap),
    Items(title: "Ratio", image: ProjectImages.mis),
    Items(title: "Variance", image: ProjectImages.variance_svg),
    Items(title: "Trends", image: ProjectImages.trends),
  ];

}

class Items {
  String title;
  String image;
  Items({required this.title, required this.image});
}

import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController{


  TextEditingController companynameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final picker = ImagePicker();
  var selectedImagePath = ''.obs;
  var printLogoImagePath = ''.obs;
 Map<String, dynamic> body = {};

  void showPicker(context,) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera,),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void getImage(ImageSource source,) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      printLogoImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  void profileApi(){

    print('------profileApi-------');


    body['company_name'] = companynameController.text.trim();
    body['email'] = emailController.text.trim();
    body['mobile_number'] = numberController.text.trim();
    body['country'] = countryController.text.trim();
    body['city'] = cityController.text.trim();


    print('data added $body');

    ApiHelper.postApi(
        url:Api.login ,
        body: body,
        onSuccess:(){
          Get.offAllNamed(Routes.DASH_BOARD);
        });

  }






}
import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  final companynameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();

  RxBool isCheck = true.obs;
  RxBool isAgreed = false.obs;
  final count = 0.obs;

  Map<String, dynamic> body = {};


  void setIsCheck() {
    isCheck.value = !isCheck.value;
  }

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

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


  void signUpApi(){


    print('-----SignUpApi------');

    body['username'] = usernameController.text.trim();
    body['password'] = passwordController.text.trim();
    body['company_name'] = companynameController.text.trim();
    body['email'] = emailController.text.trim();
    body['contact_no'] = numberController.text.trim();
    body['country'] = countryController.text.trim();
    body['user_role'] = 'staff';
    body['city'] = cityController.text.trim();

    print('data added to body $body');


    ApiHelper.postApi(
        requiresToken: false,
        url:Api.register,
        body: body,
        onSuccess:(){
        Get.offAllNamed(Routes.ACCOUNT_VERFIY);
    });



  }


}

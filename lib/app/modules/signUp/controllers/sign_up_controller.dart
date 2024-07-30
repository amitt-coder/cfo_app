import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  final companynameController = TextEditingController();
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
    print('-----signUpApi------');

    body['company_name'] = companynameController.text.trim();
    body['email'] = emailController.text.trim();
    body['mobile_number'] = numberController.text.trim();
    body['password'] = passwordController.text.trim();
    body['country'] = countryController.text.trim();
    body['city'] = cityController.text.trim();

    print('data added to body $body');


    // ApiHelper.postApi(
    //     url:Api.login,
    //     body: body,
    //     onSuccess:(){
    //     Get.offAllNamed(Routes.ACCOUNT_VERFIY);
    // });



  }


}

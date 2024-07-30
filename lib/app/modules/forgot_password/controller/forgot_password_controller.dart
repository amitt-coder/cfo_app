import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{


  TextEditingController emailController = TextEditingController();

  Map<String, dynamic> body={};


  void forgotPasswordApi(){

    print('-----forgotPasswordApi-----');

    body['email'] = emailController.text.trim();

    print('data added $body');

    ApiHelper.postApi(
        url:Api.login,
        body: body,
        onSuccess:(){
          Get.offAllNamed(Routes.SIGN_IN);
        });


  }





}
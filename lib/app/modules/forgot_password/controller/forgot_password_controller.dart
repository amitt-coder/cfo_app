import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/toast_message.dart';

class ForgotPasswordController extends GetxController{


  TextEditingController emailController = TextEditingController();

  Map<String, dynamic> body={};


  void forgotPasswordApi(){

    print('-----forgotPasswordApi-----');

    body['email'] = emailController.text.trim();


    postApi(
        requiresToken: false,
        url:Api.ForgetPassword,
        body: body,
        onSuccess:(){
          Get.offAllNamed(Routes.SIGN_IN);
        });


  }

  static Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
    required void Function() onSuccess,
    bool requiresToken = false,
  }) async {

    print('-------postApi------');

    print('url : $url');
    print('body : $body');

    final storage = GetStorage();
    String? token;

    if (requiresToken) {
      // Retrieve the token from storage if needed
      token = storage.read('accessToken');
    }

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (requiresToken && token != null) 'Authorization': 'Bearer $token', // Add the Authorization header if needed
        },
        body: json.encode(body),
      );

      print('status ${response.statusCode}');

      if (response.statusCode == 201 || response.statusCode == 200) {

        var responseData = json.decode(response.body);
        var newPassword = responseData['Data'] ?? {};
          print('New Password ${newPassword}');
        ToastMessage.showToast('${newPassword}');
          onSuccess();

        return json.decode(response.body);
      } else {
        print('Failed with status code: ${response.statusCode}');
        return response.statusCode;
      }
    } on http.ClientException catch (e) {
      print('Client Exception: $e');
      return 'ClientException: $e';
    } on Exception catch (e) {
      print('Error: $e');
      return 'Exception: $e';
    }
  }





}
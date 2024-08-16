import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../data/api.dart';
import '../../../routes/app_pages.dart';

class DrawerControllerr extends GetxController{

  Map<String, dynamic> body = {};



  //  Future<dynamic> logOutApi() async {
  //
  //   print('-----logOutApi-----');
  //
  //   final storage = GetStorage();
  //   String? token;
  //   String? refreshToken;
  //   token = storage.read('accessToken');
  //   refreshToken = storage.read('refreshToken');
  //   var userId = storage.read('USER_ID');
  //
  //   try {
  //     var response = await http.post(
  //       Uri.parse(Api.logout),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token', // Add the Authorization header if needed
  //       },
  //       body: {
  //         json.encode({
  //         'id': userId,
  //         'refresh': refreshToken,
  //       }),
  //       },
  //     );
  //     // json.encode(body)
  //     print('status ${response.statusCode}');
  //
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //
  //       var responseData = json.decode(response.body);
  //
  //       Get.offAllNamed(Routes.SIGN_IN);
  //
  //       return json.decode(response.body);
  //     } else {
  //       print('Failed with status code: ${response.statusCode}');
  //       return response.statusCode;
  //     }
  //   } on http.ClientException catch (e) {
  //     print('Client Exception: $e');
  //     return 'ClientException: $e';
  //   } on Exception catch (e) {
  //     print('Error: $e');
  //     return 'Exception: $e';
  //   }
  // }

  Future<dynamic> logOutApi() async {
    print('-----logOutApi-----');

    final storage = GetStorage();
    String? token = storage.read('accessToken');
    String? refreshToken = storage.read('refreshToken');
    String? userId = storage.read('USER_ID');

    print('token $token');
    print('refreshToken $refreshToken');
    print('userId $userId');
    try {
      var response = await http.post(
        Uri.parse(Api.logout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
            "id": int.parse(userId.toString()),
            'refresh': refreshToken,
        }),
      );

      print('status ${response.statusCode}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        var responseData = json.decode(response.body);

        Get.offAllNamed(Routes.SIGN_IN);
        storage.remove('USER_ID');
        return responseData;
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
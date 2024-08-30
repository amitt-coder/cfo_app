import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ApiHelper {



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

        // Extract tokens if they exist in the response
        if(requiresToken == false){
          var tokens = responseData['tokens'] ?? {};
          var accessToken = tokens['access'];
          var refreshToken = tokens['refresh'];
          var userId = responseData['id'];
          print('Access Token: $accessToken');
          print('Refresh Token: $refreshToken');
          print('userId: $userId');

          // Store tokens in GetStorage
          storage.write('accessToken', accessToken);
          storage.write('refreshToken', refreshToken);
          storage.write('USER_ID', userId.toString());

          print('api success without token');
          onSuccess();
        }else{
          print('api success with token');
          onSuccess();

        }


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


  static Future<dynamic> getApi(String url,) async {

    print('----getApi----');

    print("url ${url}");

    var request = http.Request('GET', Uri.parse(url), );

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

    print("===>>> response ${res}");

    if (response.statusCode == 200) {
      print('successfully Run');
      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }
}

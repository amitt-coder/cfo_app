import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {


  static Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
    required void Function() onSuccess,
  }) async {

    print('-------postApi------');

    print('url : $url');
    print('body : $body');

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      print('status ${response.statusCode}');

      if (response.statusCode == 200) {
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

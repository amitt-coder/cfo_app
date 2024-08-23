import 'dart:convert';

import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:cfo_app/utils/toast_message.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController{

  final storage = GetStorage();

  TextEditingController companynameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final picker = ImagePicker();
  var selectedImagePath = ''.obs;
  var printLogoImagePath = ''.obs;
  Map<String, dynamic> body = {};
  var profileData = {}.obs;
  var profileData2 = {}.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }


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

  // Future<void> editProfileApi() async {
  //   // String imagePath,
  //   print('-----editProfileApi-------');
  //
  //   try {
  //
  //     String token = await storage.read('accessToken') ?? '';
  //     String userId = await storage.read('USER_ID') ?? '';
  //
  //     var request = http.MultipartRequest(
  //         'PATCH',
  //         Uri.parse(
  //           // "${url}${userId}/",
  //           Api.user_data,
  //         ));
  //
  //     request.headers['Authorization'] = 'Bearer $token';
  //     request.fields['id'] = userId;
  //     request.fields['username'] = usernameController.text;
  //     request.fields['company_name'] = companynameController.text;
  //     request.fields['email'] = emailController.text;
  //     request.fields['contact_no'] = numberController.text;
  //     request.fields['country'] = countryController.text;
  //     request.fields['city'] = cityController.text;
  //
  //     print('Request successful-----${request.fields}');
  //     print('Request successful-----${request.headers}');
  //
  //     // request.files.add(await http.MultipartFile.fromPath('profile_picture', imagePath));
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print('Request successful');
  //
  //       Get.offAllNamed(Routes.DASH_BOARD);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //       // print('Request failed with status: ${response.stream.val('msg')}');
  //     }
  //   } catch (e) {
  //     // Handle any exceptions
  //     print('Error: $e');
  //   }
  // }


  Future<void> editProfileApi() async {
    print('-----editProfileApi-------');

    try {
      // Reading the access token and user ID from storage
      String token = await storage.read('accessToken') ?? '';
      String userId = await storage.read('USER_ID') ?? '';

      // Setting up the request headers and body
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      var body = {
        // 'id': userId.toString(),
        'username': usernameController.text.toString(),
        'company_name': companynameController.text.toString(),
        'email': emailController.text.toString(),
        'contact_no': numberController.text.toString(),
        'country': countryController.text.toString(),
        'city': cityController.text.toString(),
        'user_role': 'Admin',
      };

      print('body: ${body}');
      print('token: ${token}');
      print('url: ${"${Api.user_data}${userId}/"}');

      // Sending the PATCH request
      var response = await http.patch(
        Uri.parse("${Api.user_data}${userId}/"),
        headers: headers,
        body: jsonEncode(body),
      );

      // Handling the response based on the status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Request successfully');
        profileData2.value =  json.decode(response.body);
        // print('profileData2: $profileData2');
        // var usernameMsg = profileData2['username'][0];
        // ToastMessage.showToast(usernameMsg);
        // print('usernameMsg: $usernameMsg');
        Get.offAllNamed(Routes.DASH_BOARD);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handling any exceptions
      print('Error: $e');
    }
  }

  Future<dynamic> getProfile() async {

    print('----getProfileApi----');

    String userId = await storage.read('USER_ID') ?? '';

    var request = http.Request('GET', Uri.parse("${Api.user_data}${userId}"), );

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();

      print("===>>> response ${res}");

    if (response.statusCode == 200|| response.statusCode == 201) {
      print('successfully Run');

      profileData.value = json.decode(res);
      print('profileData.value   ${profileData}');

      usernameController.text = profileData['username'];
      companynameController.text = profileData['company_name'];
      emailController.text = profileData['email'];
      numberController.text = profileData['contact_no'];
      countryController.text = profileData['country'];
      cityController.text = profileData['city'];

      return json.decode(res);
    } else if (response.statusCode == 404) {
      print('Error: Not Found ${response.statusCode}');
      // throw "Error: Not Found";
      // Handle 404 status code
    } else if (response.statusCode == 500) {
      print('Error: Internal Server Error');
      // throw "Error: Internal Server Error";
      // Handle 500 status code
    } else if (response.statusCode == 429) {
      print('Error: Too Many Requests');
      // throw "Error: Too Many Requests";`
      // Handle 429 status code
    } else {
      print('Error: ${response.statusCode}');
      // throw "Error: ${response.statusCode}";
      // Handle other status codes
    }
  }


}
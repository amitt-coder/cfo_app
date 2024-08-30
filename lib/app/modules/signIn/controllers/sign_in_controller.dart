import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../data/api.dart';
import '../../../data/api_helper.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {

  RxBool  isCheck=true.obs;
  final count = 0.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  TextEditingController tallykeyController = TextEditingController();
  TextEditingController tallyusernameController = TextEditingController();
  TextEditingController tallypasswordController = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final storage = GetStorage();
  Map<String, dynamic> body = {};



  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }


  void setIsCheck(){
    isCheck.value=!isCheck.value;
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


  void loginApi(){

    print('----loginApi-----');

    String isLogin = storage.read('isLogin') ?? '0';
    body['email'] = emailController.text.trim();
    body['password']=passwordController.text.trim();

      print('isLogin: ${isLogin}');

    ApiHelper.postApi(
        requiresToken: false,
        url: Api.login,
        body:body,
        onSuccess: (){
          // _addTallyConnector();
          if(isLogin.toString() == '1'){
            _addTallyConnector();
          }else{
            Get.offAllNamed(Routes.DASH_BOARD);
          }
        });
  }

  void _addTallyConnector() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: "Tally Connect",
      titleStyle: TextStyle(
          color: AppColor.blackColor,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          fontSize: 20),
      content: Column(
        children: [
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Tally key',
            controllers: tallykeyController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            preShow: 'Not',
            lableText: 'Tally Username',
            controllers: tallyusernameController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Tally Password',
            controllers: tallypasswordController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommonButton(
              color: const Color(0xffd9d9d9),
              ontap: () {
                Get.back();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Cancel',
            ),
            CommonButton(
              color: AppColor.primaryColor,
              ontap: () {
                tallyConnectorApi();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Submit',
            ),
          ],
        )
      ],
    );
  }

  Future<dynamic> tallyConnectorApi() async {

    print('--------TallyConnectorApi--------');
    // print('key--1--${tallykeyController.text}');
    // print('key--2--${tallyusernameController.text}');
    // print('key--3--${tallypasswordController.text}');

    String? userId = storage.read('USER_ID');
    String? token = storage.read('accessToken');
    // print('token----${token}');
    // print('userId----${userId}');
    try{
      var response = await http.post(Uri.parse(Api.TallyConnector),
          headers: {
            'Authorization':'Bearer $token',
            'Content-Type':'application/json'
          },
          body: json.encode({
            'created_by_user':userId,
            'tally_key':tallykeyController.text,
            'tally_username':tallyusernameController.text,
            'tally_password':tallypasswordController.text,
          })
      );

      if(response.statusCode==200 || response.statusCode == 201){
        print('api successfully work');
        var responseData = json.decode(response.body);
        storage.write('isLogin', '0');
        print('responseData $responseData');
        // Get.offAllNamed(Routes.DASH_BOARD);
        Get.offAllNamed(Routes.DASH_BOARD);
      }else{
        print('Failed with statusCode: ${response.statusCode}');
      }
    }catch(e){
      print('Error: ${e}');
    }

  }


  Future<User?> signInWithGoogle() async {

    print('------signInWithGoogle-------');

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    final UserCredential userCredential = await _auth.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'photoURL': user.photoURL,
      });
      Get.offAllNamed(Routes.DASH_BOARD);
    }else{
      print('not working');
    }

    return user;
  }




}

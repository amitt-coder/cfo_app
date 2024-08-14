import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../../../data/api.dart';
import '../../../data/api_helper.dart';
import '../../../routes/app_pages.dart';

class SignInController extends GetxController {

  RxBool  isCheck=true.obs;
  final count = 0.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
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

    body['email'] = emailController.text.trim();
    body['password']=passwordController.text.trim();



    ApiHelper.postApi(
        requiresToken: false,
        url: Api.login,
        body:body,
        onSuccess: (){
          Get.offAllNamed(Routes.DASH_BOARD);
        });

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

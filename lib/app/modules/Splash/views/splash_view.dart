import 'package:cfo_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
        Lottie.asset('assets/images/Splash.json',fit: BoxFit.fill,),
        // Image.asset(
        //   ProjectImages.splash,
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }
}

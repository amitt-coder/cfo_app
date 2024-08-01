import 'package:cfo_app/app/data/api.dart';
import 'package:cfo_app/app/data/api_helper.dart';
import 'package:cfo_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);

  SignInController signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Text("Welcome to CFO!".tr,
                    textScaler: const TextScaler.linear(1.0),
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Urbanist',
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1D1E25),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Text("Sign In to your account".tr,
                    textScaler: const TextScaler.linear(1.0),
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.1,
                      wordSpacing: 0.1,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF808D9E),
                    )),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    signInController.signInWithGoogle();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: const Color(0xFFE9ECF2), width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ProjectImages.google,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                              color: Color(0xFF2B3453),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.1,
                              fontFamily: 'Urbanist',
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 1,
                      child: const Divider(
                        color: Color(0xFFE9ECF2),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "OR",
                      style: GoogleFonts.urbanist(
                          color: const Color(0xFF808D9E),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Container(
                      width: 150,
                      height: 1,
                      child: const Divider(
                        color: Color(0xFFE9ECF2),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                CommonTextField(
                  lableText: 'Enter your email address',
                  controllers: signInController.emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  prefixIcon: ProjectImages.mail,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                Obx(
                  () => TextFormField(
                    controller: signInController.passwordController,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191A26),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Color(0xFF242B42),
                    cursorWidth: 1.5,
                    obscureText: signInController.isCheck.value,
                    decoration: InputDecoration(
                      labelText: "Enter your password",
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: SvgPicture.asset(
                          ProjectImages.lock,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        maxHeight: 20,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: InkWell(
                          onTap: () {
                            signInController.setIsCheck();
                          },
                          child: signInController.isCheck.value
                              ? SvgPicture.asset(
                                  ProjectImages.eye,
                                  height: 20,
                                  width: 20,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Color(0xFF7E8CA0),
                                ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 20,
                      ),
                      // labelText:"Enter your password" ,
                      // hintText:"Enter your password",
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 1),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 1),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.txtSecondaryColor, width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text("Forgot Password?".tr,
                        textScaler: const TextScaler.linear(1.0),
                        style: TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w800,
                          color: AppColor.primaryColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                CommonButton(
                  color: AppColor.primaryColor,
                  ontap: () {
                    // signInController.loginApi();
                    Get.offAllNamed(Routes.DASH_BOARD);
                  },
                  height: 45,
                  width: double.infinity,
                  textcolor: AppColor.whiteColor,
                  text: 'Sign In',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have account?".tr,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF808D9E),
                        )),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGN_UP);
                      },
                      child: Text(
                        " Sign Up".tr,
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

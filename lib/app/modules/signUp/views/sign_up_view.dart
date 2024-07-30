import 'package:cfo_app/components/common_textformfield.dart';
import 'package:cfo_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../components/common_button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/toast_message.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({Key? key}) : super(key: key);
  SignUpController signUpController = SignUpController();
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
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    ProjectImages.arrowLeft,
                    height: 24,
                    width: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text("Create Your Account!".tr,
                    textScaler: TextScaler.linear(1.0),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Urbanist',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1D1E25),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("Sign Up to your account".tr,
                    textScaler: TextScaler.linear(1.0),
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.1,
                      wordSpacing: 0.1,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF808D9E),
                    )),
                SizedBox(
                  height: 18,
                ),
                CommonTextField(
                  lableText: 'Company Name',
                  controllers: signUpController.companynameController,
                  keyboardTypes: TextInputType.text,
                  prefixIcon: ProjectImages.company,
                ),
                SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'Enter your email address',
                  controllers: signUpController.emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  prefixIcon: ProjectImages.user,
                ),
                SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'Enter your mobile number',
                  controllers: signUpController.numberController,
                  keyboardTypes: TextInputType.number,
                  prefixIcon: ProjectImages.mobile,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFE9ECF2), width: 1))),
                  child: Obx(
                    () => TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF191A26),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Color(0xFF242B42),
                      cursorWidth: 1.5,
                      controller: signUpController.passwordController,
                      obscureText: signUpController.isCheck.value,
                      decoration: InputDecoration(
                        labelText: "Enter your password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E8CA0),
                        ),
                        floatingLabelStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E8CA0),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E8CA0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10),
                          child: SvgPicture.asset(
                            ProjectImages.lock,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10),
                          child: InkWell(
                            onTap: () {
                              signUpController.setIsCheck();
                            },
                            child: signUpController.isCheck.value
                                ? SvgPicture.asset(
                                    ProjectImages.eye,
                                    height: 20,
                                    width: 20,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color(0xFF7E8CA0),
                                  ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 20,
                        ),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor, width: 1),

                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
                        ),
                        errorBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
                        ),
                        enabledBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color:AppColor.txtSecondaryColor,width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFE9ECF2), width: 1))),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191A26),
                    ),
                    controller: signUpController.countryController,
                    keyboardType: TextInputType.text,
                    cursorColor: Color(0xFF242B42),
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      labelText: "Country",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      floatingLabelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7E8CA0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: SvgPicture.asset(
                            ProjectImages.flag,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                      ),
                      border: InputBorder.none,
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
                      ),
                      errorBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
                      ),
                      enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color:AppColor.txtSecondaryColor,width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'City',
                  controllers: signUpController.cityController,
                  keyboardTypes: TextInputType.text,
                  prefixIcon: ProjectImages.city,
                ),
                SizedBox(
                  height: 18,
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              activeColor: Color(0xFF808D9E),
                              side: BorderSide(
                                  color: Color(0xFF808D9E), width: 1.2),
                              value: signUpController.isAgreed.value,
                              onChanged: (value) {
                                signUpController.toggleAgreement();
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text.rich(
                            textScaler: TextScaler.linear(1),
                            TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the company ",
                                  style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      wordSpacing: 0.1,
                                      letterSpacing: 0.1,
                                      color: Color(0xFF808D9E))),
                              TextSpan(
                                  text: "Term of Service ",
                                  style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      letterSpacing: 0.1,
                                      wordSpacing: 0.1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black)),
                              TextSpan(
                                  text: "and",
                                  style: TextStyle(
                                      letterSpacing: 0.1,
                                      wordSpacing: 0.1,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF808D9E)))
                            ]),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text("Privacy Policy",
                      style: TextStyle(
                          height: 0.9,
                          letterSpacing: 0.1,
                          wordSpacing: 0.1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: AppColor.primaryColor,
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: MaterialButton(
                //     // shape: OutlineInputBorder(
                //     //     borderRadius: BorderRadius.circular(8),
                //     // ),
                //     onPressed: () {
                //        Get.toNamed(Routes.ACCOUNT_VERFIY);
                //     },
                //     height: 45,
                //     minWidth: double.infinity,
                //     child: Text("Sign Up".tr,
                //         textScaler: TextScaler.linear(1.0),
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontFamily: 'Urbanist',
                //           fontWeight: FontWeight.w700,
                //           color: AppColor.whiteColor,
                //         )),
                //   ),
                // ),
                CommonButton(
                  color: AppColor.primaryColor,
                  ontap: () {
                    // signUpController.signUpApi();
                    signUpController.isAgreed.value==false?
                    ToastMessage.showToast('Agree to Terms and Policy'):
                    Get.offAllNamed(Routes.ACCOUNT_VERFIY);
                  },
                  height: 45,
                  width: double.infinity,
                  textcolor: AppColor.whiteColor,
                  text: 'Sign Up',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have a account?".tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF808D9E),
                        )),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGN_IN);
                      },
                      child: Text(
                        " Sign In".tr,
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
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

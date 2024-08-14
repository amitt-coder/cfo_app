import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            GestureDetector(
              onTap: (){
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
            Text("Reset Password".tr,
                textScaler: const TextScaler.linear(1.0),
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Urbanist',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D1E25),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            CommonTextField(
              lableText: 'Enter your email address',
              controllers: forgotPasswordController.emailController,
              keyboardTypes: TextInputType.emailAddress,
              prefixIcon: ProjectImages.user,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            CommonButton(
              color: AppColor.primaryColor,
              ontap: (){
                forgotPasswordController.forgotPasswordApi();
                // Get.offAllNamed(Routes.SIGN_IN);
              },
              height: 45,
              width: double.infinity,
              textcolor: AppColor.whiteColor,
              text: 'Send Password',
            ),
          ],
        ),
      ),
    );
  }
}

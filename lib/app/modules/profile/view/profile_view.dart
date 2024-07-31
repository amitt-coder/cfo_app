import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Profile',
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.DASH_BOARD);
          },
          child: Image.asset(
            ProjectImages.arrow_left,
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: Obx(() {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: AppColor.backgroundColors,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    profileController.selectedImagePath.value == ''
                        ? Center(
                            child: ClipOval(
                              child: Image.asset(
                                ProjectImages.profile,
                                height: 100,
                                width: 100,
                              ),
                            ),
                          )
                        : Center(
                            child: ClipOval(
                              child: Image.file(
                                File(
                                  profileController.selectedImagePath.value,
                                ),
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 50,
                        child: InkWell(
                          onTap: () {
                            profileController.showPicker(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration:  BoxDecoration(
                                color: AppColor.primaryColor, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonTextField(
                  lableText: 'Company Name',
                  controllers: profileController.companynameController,
                  keyboardTypes: TextInputType.text,
                  prefixIcon: ProjectImages.company,
                ),
                const SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'Enter your email address',
                  controllers: profileController.emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  prefixIcon: ProjectImages.user,
                ),
                const SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'Enter your mobile number',
                  controllers: profileController.numberController,
                  keyboardTypes: TextInputType.number,
                  prefixIcon: ProjectImages.mobile,
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFE9ECF2), width: 1))),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191A26),
                    ),
                    controller: profileController.countryController,
                    keyboardType: TextInputType.text,
                    cursorColor: const Color(0xFF242B42),
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      labelText: "Country",
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: SvgPicture.asset(
                            ProjectImages.flag,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        maxHeight: 20,
                      ),
                      border: InputBorder.none,
                      disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
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
                const SizedBox(
                  height: 8,
                ),
                CommonTextField(
                  lableText: 'City',
                  controllers: profileController.cityController,
                  keyboardTypes: TextInputType.text,
                  prefixIcon: ProjectImages.city,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CommonButton(
                    color: AppColor.primaryColor,
                    ontap: () {
                      Get.offAllNamed(Routes.DASH_BOARD);
                      // profileController.profileApi();
                    },
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    textcolor: AppColor.whiteColor,
                    text: 'Update',
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

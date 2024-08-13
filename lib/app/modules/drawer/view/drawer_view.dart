import 'package:cfo_app/utils/colors.dart';
import 'package:cfo_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {


  List<DrawerList> drawerList = [
    DrawerList(image: ProjectImages.user_drawer, name: 'Profile  '),
    // DrawerList( image: ProjectImages.account_reclassify, name: 'Account Regrouping'),
    // DrawerList(image: ProjectImages.variance, name: 'Variance Analysis'),
    // DrawerList(image: ProjectImages.tds, name: 'TDS Compliance'),
    DrawerList(image: ProjectImages.power_off, name: 'Logout '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundColors,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  ProjectImages.profile,
                  height: 70,
                  width: 70,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
                itemCount: drawerList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // if (index == 0) {
                            //   Get.toNamed(Routes.PROFILE);
                            // }
                            // if (index == 1) {
                            //   Get.toNamed(Routes.ACCOUNT_RECLASSIFICATION);
                            // }
                            // if (index == 2) {
                            //   Get.toNamed(Routes.VARIANCE_ANALYSIS);
                            // }
                            // if (index == 3) {
                            //   Get.toNamed(Routes.TDS_CHECK);
                            // }
                            // if (index == 4) {
                            //   Get.offAllNamed(Routes.SIGN_IN);
                            // }
                            if (index == 0) {
                              Get.toNamed(Routes.PROFILE);
                            }
                            if (index == 1) {
                              Get.offAllNamed(Routes.SIGN_IN);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                drawerList[index].name,
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            const  SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                drawerList[index].image,
                                height: 25,
                                width: 25,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.txtSecondaryColor,
                          thickness: 1,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class DrawerList {
  String image;
  String name;

  DrawerList({required this.image, required this.name});
}

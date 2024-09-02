import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class TrendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Trend',
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            ProjectImages.arrow_left,
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.backgroundColors,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            Text(
                              'Mohit',
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.CASHFLOWSTATEMENT);
                          },
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trends: ',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Text(
                          '#012345',
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

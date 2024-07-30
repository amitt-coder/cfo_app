import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class TdsCheckView extends StatefulWidget {
  const TdsCheckView({super.key});

  @override
  State<TdsCheckView> createState() => _TdsCheckViewState();
}

class _TdsCheckViewState extends State<TdsCheckView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'P&L Heads TDS Check',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.backgroundColors,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'P&L Summary',
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: AppColor.txtSecondaryColor
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Last Quater',
                        style: TextStyle(
                          color: AppColor.txtSecondaryColor,
                          // color: Color(0xff808D9D),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: AppColor.txtSecondaryColor,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Summary',
              style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Heads: 50',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'TDS Deducted: 35(70%)',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'TDS Not Deducted: 15(30%)',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'P&L Heads List',
              style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.boxblueColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'P&L Head',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  Text(
                    '     Amount',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  Text(
                    'TDS Deducted',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == 1
                                ? Text(
                              'Head 2',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )
                                : Text(
                              'Head 1',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              '₹10,000',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            index == 1?
                            Text(
                              'Yes',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )
                                :
                            Text(
                              'No',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColor.txtSecondaryColor,
                          thickness: 0,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            Text(
              'Head Details',
              style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Name: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                        Text('Head 1',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Amount: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                        Text('₹10,000',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('TDS Status: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                        Text('Yes',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('TDS Rate: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                        Text('10%',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('TDS Amount: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),
                        ),
                        Text('₹1,000',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

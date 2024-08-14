import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../components/common_button.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class FinancialProjectionSummary extends StatefulWidget {
  const FinancialProjectionSummary({super.key});

  @override
  State<FinancialProjectionSummary> createState() => _FinancialProjectionSummaryState();
}

class _FinancialProjectionSummaryState extends State<FinancialProjectionSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Finacial Projection',
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
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: AppColor.backgroundColors,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Financial Projections Summary',
            style: TextStyle(
              color: AppColor.blackColor,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
            ),
            SizedBox(height: 10,),
            Text('Projected Profit and Loss',
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.boxblueColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Revenue',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                  Text('F.Costs',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                  Text('V.Cost',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                  Text('Net P/L',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                  )

              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(
                    color: AppColor.txtSecondaryColor,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Discounted Cash Flow (DCF) Analysis',
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.boxblueColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Year',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                  Text('       Cash Flow',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                  Text('Present Value',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily:'Urbanist',
                        color: AppColor.blackColor
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                  )

              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2024',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(
                    color: AppColor.txtSecondaryColor,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2024',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                      Text('₹50,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Key Metrics',
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.circle,size: 20,
                    color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 5,),
                    Text('ROI:X%',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist'
                    ),
                    )
                  ],
                ),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 20,
                    color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 5,),
                    Text('NPV: X%',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist'
                    ),
                    )
                  ],
                ),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 20,
                    color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 5,),
                    Text('IRR: X%',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist'
                    ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 50,),
            Center(
              child: CommonButton(
                color: AppColor.primaryColor,
                ontap: () {
                  Get.offAllNamed(Routes.DASH_BOARD);
                },
                height: 45,
                width: MediaQuery.of(context).size.width,
                textcolor: AppColor.whiteColor,
                text: 'Done',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

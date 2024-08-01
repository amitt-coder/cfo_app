import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class PurchaseOrderListView extends StatefulWidget {
  const PurchaseOrderListView({super.key});

  @override
  State<PurchaseOrderListView> createState() => _PurchaseOrderListViewState();
}

class _PurchaseOrderListViewState extends State<PurchaseOrderListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Purchase Orders',
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vendor List',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1, color: AppColor.txtSecondaryColor)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'This Month',
                        style: TextStyle(
                          color: AppColor.txtSecondaryColor,
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
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColor.boxblueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saajh Debnath',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            const Text(
                              '',
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ProjectImages.mail_list,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'sulagnadebnath@gmail.com',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Urbanist'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ProjectImages.telephone,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '+91 1567609304',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Urbanist'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Saajh Debnath',
                              style: TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'App',
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist'),
                                    ),
                                    Text(
                                      '₹2,000',
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Urbanist'),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                  color: AppColor.primaryColor,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 200, // Adjusted height for PieChart container
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    sections: [
                      PieChartSectionData(
                        color: Colors.green,
                        value: 50,
                        title: '50%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Urbanist'),
                      ),
                      PieChartSectionData(
                        color: Colors.yellow,
                        value: 50,
                        title: '50%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Urbanist'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Indicator(color: Colors.green, text: '50% GRN booked'),
            Indicator(color: Colors.yellow, text: '50% GRN not booked'),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            //   decoration: BoxDecoration(
            //       color: AppColor.boxblueColor,
            //       borderRadius: BorderRadius.circular(5)
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Saajh Debnath',
            //             style: TextStyle(
            //                 color: AppColor.blackColor,
            //                 fontSize: 15,
            //                 fontWeight: FontWeight.w500,
            //                 fontFamily: 'Urbanist'
            //             ),
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('App',
            //                 style: TextStyle(
            //                     color: AppColor.primaryColor,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w600,
            //                     fontFamily: 'Urbanist'
            //                 ),
            //               ),
            //               SizedBox(width: 5,),
            //               Text('₹2,000   ',
            //                 style: TextStyle(
            //                     color: AppColor.primaryColor,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w500,
            //                     fontFamily: 'Urbanist'
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('sulagnadebnath@gmail.com',
            //             style: TextStyle(
            //                 color: AppColor.blackColor,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w400,
            //                 fontFamily: 'Urbanist'
            //             ),
            //           ),
            //           Text('+91 1567609304',
            //             style: TextStyle(
            //                 color: AppColor.blackColor,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w400,
            //                 fontFamily: 'Urbanist'
            //             ),
            //           ),
            //         ],
            //       ),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(text,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor)),
      ],
    );
  }
}

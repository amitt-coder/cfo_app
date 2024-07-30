import 'dart:async';

import 'package:cfo_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../components/dropdown_field.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';
import '../controller/variance_analysis_controller.dart';

class VarianceAnalysisView extends StatefulWidget {
  const VarianceAnalysisView({super.key});

  @override
  State<VarianceAnalysisView> createState() => _VarianceAnalysisViewState();
}

class _VarianceAnalysisViewState extends State<VarianceAnalysisView> {


  VarianceAnalysisController varianceAnalysisController =
      Get.put(VarianceAnalysisController());

  double _dividerPosition = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startMovingDivider();
  }

  void _startMovingDivider() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dividerPosition += 1;
        if (_dividerPosition > 30) {
          _dividerPosition = 10; // Reset to initial position
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildBottomTitle(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 10:
        text = const Text('Nov 10', style: style);
        break;
      case 15:
        text = const Text('Nov 15', style: style);
        break;
      case 20:
        text = const Text('Nov 20', style: style);
        break;
      case 25:
        text = const Text('Nov 25', style: style);
        break;
      case 30:
        text = const Text('Nov 30', style: style);
        break;
      default:
        text = Container();
        break;
    }
    return SideTitleWidget(
      fitInside: const SideTitleFitInsideData(
        enabled: true,
        distanceFromEdge: 0,
        parentAxisSize: 0,
        axisPosition: -10,
      ),
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxSpeed = 100;
    double speed = 74;
    double angle;
    if (speed <= 100 || speed >= 90) {
      angle = ((speed) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 50) {
      angle = ((speed - 1) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 10) {
      angle = ((speed) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 0) {
      angle = ((speed - 10) / maxSpeed) * 1.5 * 3.141592653589793;
    } else {
      angle = ((speed - 2) / maxSpeed) * 1.5 * 3.141592653589793;
    }

    final filteredData = varianceAnalysisController.varianceData
        .where((data) => data['account'] == varianceAnalysisController.showProperty.value).toList();
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Variance Analysis',
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
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.backgroundColors,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Sales',
                  //       style: TextStyle(
                  //         color: AppColor.blackColor,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 16,
                  //         fontFamily: 'Urbanist',
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.arrow_drop_down_sharp,
                  //       size: 30,
                  //       color: AppColor.blackColor,
                  //     )
                  //   ],
                  // ),
                  // Container(
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //       // color: Colors.white,
                  //       borderRadius: BorderRadius.circular(5),
                  //       border: Border.all(
                  //           width: 1,
                  //           color: AppColor.txtSecondaryColor
                  //       )),
                  //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     // mainAxisAlignment: MainAxisAlignment.center,
                  //     // crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Last 30 Days',
                  //         style: TextStyle(
                  //           color: AppColor.txtSecondaryColor,
                  //           // color: Color(0xff808D9D),
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 16,
                  //           fontFamily: 'Urbanist',
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_drop_down_sharp,
                  //         size: 30,
                  //         color: AppColor.txtSecondaryColor,
                  //       )
                  //     ],
                  //   ),
                  // )
                  DropDownField(
                    onChanged: (String? newValue) {
                      varianceAnalysisController.showProperty.value = newValue!;
                      varianceAnalysisController.updateVarianceData(
                          varianceAnalysisController.showProperty.value);
                    },
                    selectValue: varianceAnalysisController.showProperty.value,
                    hintName: 'show',
                    width: 120,
                    height: 60,
                    selectPriceInstallment:
                        varianceAnalysisController.showpropertyList,
                    controller: varianceAnalysisController.salesController,
                    showBorder: '1',
                  ),
                  DropDownField(
                    onChanged: (String? newValue) {
                      varianceAnalysisController.showday.value = newValue!;
                    },
                    selectValue: varianceAnalysisController.showday.value,
                    hintName: 'show',
                    width: 160,
                    height: 45,
                    selectPriceInstallment: varianceAnalysisController.dayList,
                    controller: varianceAnalysisController.salesController,
                    showBorder: '0',
                  ),
                ],
              ),
             const SizedBox(
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
             const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overall Variance: ',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        const Text(
                          '5.26%',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Variance List',
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: AppColor.boxblueColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                          Text(
                            'Month 1',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                          Text(
                            'Month 2',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                          Text(
                            'Month 3',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                          Text(
                            'Average',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                        ],
                      ),
                    ),
                    ...filteredData.map((data) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['account'],
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Text(
                              '₹${data['month1']}',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              '₹${data['month2']}',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              '₹${data['month3']}',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              '₹${data['average']}',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   decoration: BoxDecoration(
              //       color: AppColor.boxblueColor,
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Account',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //       Text(
              //         '     Actual Value',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //       Text(
              //         'Actual Average',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //     ],
              //   ),
              // ),
              // ListView.builder(
              //     itemCount: 2,
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         padding: EdgeInsets.symmetric(horizontal: 10),
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.only(
              //                 bottomRight: Radius.circular(5),
              //                 bottomLeft: Radius.circular(5))),
              //         child: Column(
              //           children: [
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 index == 1
              //                     ? Text(
              //                         'Expenses',
              //                         style: TextStyle(
              //                             color: AppColor.blackColor,
              //                             fontFamily: 'Urbanist',
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 15),
              //                       )
              //                     : Text(
              //                         'Sales',
              //                         style: TextStyle(
              //                             color: AppColor.blackColor,
              //                             fontFamily: 'Urbanist',
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 15),
              //                       ),
              //                 Text(
              //                   '₹100,000',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontFamily: 'Urbanist',
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 15),
              //                 ),
              //                 Text(
              //                   '₹95,000',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontFamily: 'Urbanist',
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 15),
              //                 ),
              //               ],
              //             ),
              //             Divider(
              //               color: AppColor.txtSecondaryColor,
              //               thickness: 1,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //           ],
              //         ),
              //       );
              //     }),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Detailed Variance Analysis',
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Text(
                            'Sales',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Actual Value: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Text(
                            '₹100,000',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Actual Average: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Text(
                            '₹100,000',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Variance: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          const Text(
                            '+5.26%',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Variance Amount: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Text(
                            '₹5,000',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Trend Analysis: ',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          extraLinesData: ExtraLinesData(
                            extraLinesOnTop: true,
                            verticalLines: [
                              VerticalLine(
                                x: _dividerPosition,
                                color: Colors.green,
                                strokeWidth: 2,
                                dashArray: [4, 2],
                                label: VerticalLineLabel(
                                  show: true,
                                  alignment: Alignment.topRight,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                  labelResolver: (line) {
                                    return '${_dividerPosition.toStringAsFixed(1)}';
                                  },
                                ),
                              ),
                            ],
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval:
                                    5, // This ensures that the interval between titles is correct
                                getTitlesWidget: _buildBottomTitle,
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(10, 3),
                                FlSpot(15, 5),
                                FlSpot(20, 3.5),
                                FlSpot(25, 4),
                                FlSpot(30, 3),
                              ],
                              isCurved: true,
                              color: Colors.green,
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.green.withOpacity(0.3),
                              ),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(10, 2.5),
                                FlSpot(15, 4),
                                FlSpot(20, 3),
                                FlSpot(25, 3.5),
                                FlSpot(30, 2.5),
                              ],
                              isCurved: true,
                              color: Colors.red,
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.green.withOpacity(0.3),
                              ),
                            ),
                          ],
                          minX: 10,
                          maxX: 30,
                          minY: 0,
                          maxY: 6,
                        ),
                      ),
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

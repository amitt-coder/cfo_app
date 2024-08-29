import 'package:cfo_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../components/dropdown_field.dart';
import '../../../../utils/images.dart';
import '../controller/key_ratio_analysis_controller.dart';

class KeyRatioAnalsisView extends StatefulWidget {
  const KeyRatioAnalsisView({super.key});

  @override
  State<KeyRatioAnalsisView> createState() => _KeyRatioAnalsisViewState();
}

class _KeyRatioAnalsisViewState extends State<KeyRatioAnalsisView> {
  KeyRatioAnalsisController keyRatioAnalsisController =
      Get.put(KeyRatioAnalsisController());

  Widget _buildBottomTitle(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Urbanist',
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
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Key Ratio Analysis',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // 'Key Ratio Analysis',
                      'Ratio as Off',
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    CommonTextField(
                      ontap: () {
                        keyRatioAnalsisController.pickDateRange(context);
                      },
                      preShow: 'Not',
                      width: MediaQuery.of(context).size.width * 0.40,
                      lableText: 'Select Date',
                      controllers: keyRatioAnalsisController.dateRangeController,
                      keyboardTypes: TextInputType.name,
                      prefixIcon: ProjectImages.mail,
                    ),
                    // DropDownField(
                    //   onChanged: (String? newValue) {
                    //     keyRatioAnalsisController.showday.value = newValue!;
                    //   },
                    //   selectValue: keyRatioAnalsisController.showday.value,
                    //   hintName: 'show',
                    //   width: MediaQuery.of(context).size.width * 0.40,
                    //   height: 45,
                    //   selectPriceInstallment:
                    //   keyRatioAnalsisController.dayList,
                    //   controller: keyRatioAnalsisController.daysController,
                    //   showBorder: '0',
                    // ),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Overall Financial Health: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                          const Text(
                            'Good',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: KdGaugeView(
                              inactiveGaugeColor: Colors.red,
                              minSpeed: 0,
                              maxSpeed: 100,
                              speed: speed,
                              speedTextStyle: const TextStyle(
                                  color: Colors
                                      .transparent), // Speed text inside gauge
                              minMaxTextStyle:
                                  const TextStyle(color: Colors.transparent),
                              animate: false,
                              gaugeWidth: 5,
                              duration: const Duration(seconds: 3),
                              unitOfMeasurement: "",
                              alertColorArray: [
                                AppColor.primaryColor,
                                Colors.yellow
                              ],
                              alertSpeedArray: const [30, 35],
                              subDivisionCircleColors: Colors.transparent,
                              activeGaugeColor: AppColor.primaryColor,
                              divisionCircleColors: Colors.transparent,
                              child: Stack(
                                children: [
                                  // Background container for gauge view
                                  Container(
                                    height: 100,
                                    width: 150,
                                  ),
                                  // Positioned gauge circle
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Transform.scale(
                                      scaleX: 1,
                                      scaleY: 1,
                                      child: SvgPicture.asset(
                                        height: 58,
                                        width: 58,
                                        ProjectImages
                                            .circle, // Replace with your gauge circle image path
                                      ),
                                    ),
                                  ),
                                  // Positioned pointer
                                  Positioned(
                                    top: 25,
                                    right: 25,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationZ(
                                          angle), // Rotate pointer
                                      child: SvgPicture.asset(
                                        ProjectImages
                                            .point, // Replace with your pointer image path
                                        width: 10,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  // Speed text inside the gauge
                                  Positioned(
                                    top:
                                        55, // Adjust top to position text correctly
                                    left:
                                        25, // Adjust left to position text correctly
                                    child: Center(
                                      child: Text(
                                        "${speed.toStringAsFixed(0)}%",
                                        style: TextStyle(
                                          color: AppColor.fontColor,
                                          fontSize: 17,
                                          letterSpacing: 0.1,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Urbanist',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 15,),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     height: 80,
                //     width: 180,
                //     child: Align(
                //       alignment: Alignment.topRight,
                //       child: KdGaugeView(
                //         minSpeed: 0,
                //         maxSpeed: 100,
                //         speed: speed,
                //         speedTextStyle: TextStyle(color: Colors.transparent), // Speed text inside gauge
                //         minMaxTextStyle: TextStyle(color: Colors.transparent),
                //         animate: false,
                //         gaugeWidth: 5,
                //         duration: Duration(seconds: 3),
                //         unitOfMeasurement: "",
                //         alertColorArray: [AppColor.primaryColor,Colors.yellow],
                //         alertSpeedArray: [30,35],
                //         subDivisionCircleColors: Colors.transparent,
                //         activeGaugeColor: AppColor.primaryColor,
                //         divisionCircleColors: Colors.transparent,
                //         child: Stack(
                //           children: [
                //             // Background container for gauge view
                //             Container(
                //               height: 100,
                //               width: 150,
                //               // Optionally add a background color or margin if needed
                //               // color: Colors.black,
                //               // margin: EdgeInsets.all(5),
                //             ),
                //             // Positioned gauge circle
                //             Positioned(
                //               top: 7,
                //               right: 43,
                //               child: Transform.scale(
                //                 scaleX: 1,
                //                 scaleY: 1,
                //                 child: SvgPicture.asset(
                //                   height: 55,
                //                   width: 55,
                //                   ProjectImages.circle, // Replace with your gauge circle image path
                //                 ),
                //               ),
                //             ),
                //             // Positioned pointer
                //             Positioned(
                //               top: 25,
                //               right: 55,
                //               child: Transform(
                //                 alignment: Alignment.center,
                //                 transform: Matrix4.rotationZ(angle), // Rotate pointer
                //                 child: SvgPicture.asset(
                //                   ProjectImages.point, // Replace with your pointer image path
                //                   width: 10,
                //                   height: 20,
                //                 ),
                //               ),
                //             ),
                //             // Speed text inside the gauge
                //             Positioned(
                //               top: 55, // Adjust top to position text correctly
                //               left: 60, // Adjust left to position text correctly
                //               child: Center(
                //                 child: Text(
                //                   "${speed.toStringAsFixed(0)}%",
                //                   style: TextStyle(
                //                     color: AppColor.fontColor,
                //                     fontSize: 17,
                //                     letterSpacing: 0.1,
                //                     fontWeight: FontWeight.w400,
                //                     fontFamily: 'Urbanist',
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Key Ratios List',
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Urbanist'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        '      Value',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        'Benchmark',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        'Interpret..',
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
                    itemCount: int.parse(
                        keyRatioAnalsisController.keyRatios.length.toString()),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                    // 'Current',
                                    keyRatioAnalsisController
                                        .keyRatios[index].name
                                        .toString(),
                                    style: TextStyle(
                                        color: AppColor.blackColor,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  // '1.5',
                                  keyRatioAnalsisController
                                      .keyRatios[index].value
                                      .toString(),
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Text(
                                  // '1.0-2.0',
                                  keyRatioAnalsisController
                                      .keyRatios[index].benchmark
                                      .toString(),
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Text(
                                  // 'Healthy',
                                  keyRatioAnalsisController
                                      .keyRatios[index].interpretation
                                      .toString(),
                                  style: TextStyle(
                                      color: keyRatioAnalsisController
                                          .getColorForInterpretation(
                                              keyRatioAnalsisController
                                                  .keyRatios[index]
                                                  .interpretation),
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColor.txtSecondaryColor,
                              thickness: 1,
                            ),

                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                // Text(
                //   'Ratio Details',
                //   style: TextStyle(
                //       color: AppColor.blackColor,
                //       fontFamily: 'Urbanist',
                //       fontWeight: FontWeight.w500,
                //       fontSize: 16),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           Text(
                //             'Ratio Name: ',
                //             style: TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w600,
                //                 fontFamily: 'Urbanist'),
                //           ),
                //           Text(
                //             'Current Ratio',
                //             style: TextStyle(
                //                 color: AppColor.blackColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: 'Urbanist'),
                //           )
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Defination: ',
                //             style: TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w600,
                //                 fontFamily: 'Urbanist'),
                //           ),
                //           Text(
                //             'Measures the comapny s\nability to pay short-term\nobligation with current assets',
                //             style: TextStyle(
                //                 color: AppColor.blackColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: 'Urbanist'),
                //           )
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Formula: ',
                //             style: TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w600,
                //                 fontFamily: 'Urbanist'),
                //           ),
                //           Text(
                //             'Current Assets / Current Liabilities',
                //             style: TextStyle(
                //                 color: AppColor.blackColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: 'Urbanist'),
                //           )
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Trend Analysis: ',
                //             style: TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w600,
                //                 fontFamily: 'Urbanist'),
                //           ),
                //           Text(
                //             'Chart showing trend over...',
                //             style: TextStyle(
                //                 color: AppColor.blackColor,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w500,
                //                 fontFamily: 'Urbanist'),
                //           )
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 15,
                //       ),
                //       Container(
                //         height: 200,
                //         child: LineChart(
                //           LineChartData(
                //             extraLinesData: ExtraLinesData(
                //               extraLinesOnTop: true,
                //               verticalLines: [
                //                 VerticalLine(
                //                   x: keyRatioAnalsisController
                //                       .dividerPosition.value,
                //                   color: Colors.green,
                //                   strokeWidth: 2,
                //                   dashArray: [4, 2],
                //                   label: VerticalLineLabel(
                //                     show: true,
                //                     alignment: Alignment.topRight,
                //                     style: const TextStyle(
                //                         color: Colors.green,
                //                         fontSize: 12,
                //                         fontFamily: 'Urbanist'),
                //                     labelResolver: (line) {
                //                       return '${keyRatioAnalsisController.dividerPosition.value.toStringAsFixed(1)}';
                //                     },
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             borderData: FlBorderData(show: false),
                //             gridData: const FlGridData(show: false),
                //             titlesData: FlTitlesData(
                //               bottomTitles: AxisTitles(
                //                 sideTitles: SideTitles(
                //                   showTitles: true,
                //                   interval:
                //                       5, // This ensures that the interval between titles is correct
                //                   getTitlesWidget: _buildBottomTitle,
                //                 ),
                //               ),
                //               leftTitles: const AxisTitles(
                //                 sideTitles: SideTitles(showTitles: false),
                //               ),
                //               rightTitles: const AxisTitles(
                //                 sideTitles: SideTitles(showTitles: false),
                //               ),
                //               topTitles: const AxisTitles(
                //                 sideTitles: SideTitles(showTitles: false),
                //               ),
                //             ),
                //             lineBarsData: [
                //               LineChartBarData(
                //                 spots: [
                //                   const FlSpot(10, 3),
                //                   const FlSpot(15, 5),
                //                   const FlSpot(20, 3.5),
                //                   const FlSpot(25, 4),
                //                   const FlSpot(30, 3),
                //                 ],
                //                 isCurved: true,
                //                 color: Colors.green,
                //                 barWidth: 2,
                //                 isStrokeCapRound: true,
                //                 dotData: const FlDotData(show: false),
                //                 belowBarData: BarAreaData(
                //                   show: true,
                //                   color: Colors.green.withOpacity(0.3),
                //                 ),
                //               ),
                //               LineChartBarData(
                //                 spots: [
                //                   const FlSpot(10, 2.5),
                //                   const FlSpot(15, 4),
                //                   const FlSpot(20, 3),
                //                   const FlSpot(25, 3.5),
                //                   const FlSpot(30, 2.5),
                //                 ],
                //                 isCurved: true,
                //                 color: Colors.red,
                //                 barWidth: 2,
                //                 isStrokeCapRound: true,
                //                 dotData: const FlDotData(show: false),
                //                 belowBarData: BarAreaData(
                //                   show: true,
                //                   color: Colors.green.withOpacity(0.3),
                //                 ),
                //               ),
                //             ],
                //             minX: 10,
                //             maxX: 30,
                //             minY: 0,
                //             maxY: 6,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}



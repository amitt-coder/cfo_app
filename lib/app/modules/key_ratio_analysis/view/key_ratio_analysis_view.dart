import 'dart:math';
import 'package:cfo_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_textformfield.dart';
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
      fontWeight: FontWeight.w500,
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
        body: Obx(
          () => Container(
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
                          'Ratio as of date',
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
                          controllers:
                              keyRatioAnalsisController.dateRangeController,
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
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
                              // const Text(
                              //   'Good',
                              //   style: TextStyle(
                              //       color: Colors.green,
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: 'Urbanist'),
                              // ),
                            ],
                          ),
                          Obx(() => Container(
                                height: 80,
                                width: 130,
                                padding: EdgeInsets.zero,
                                child: ListView.builder(
                                  itemCount: keyRatioAnalsisController.ratios.length,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var item = keyRatioAnalsisController.ratios[index];
                                    double value = item["value"];
                                    double minimum = item["minimum"];
                                    double maximum = item["maximum"];

                                    // Calculate speed as a percentage
                                    double speed = ((value - minimum) /
                                            (maximum - minimum)) *
                                        100;
                                    double angle;
                                    double maxSpeed = 100;
                                    // Custom angle logic based on speed
                                    if (speed.toInt() <= 100 &&
                                        speed.toInt() >= 90) {
                                      angle =
                                          (speed.toInt() / maxSpeed) * 1.5 * pi;
                                    } else if (speed.toInt() == 50) {
                                      angle = ((speed.toInt() - 1) / maxSpeed) *
                                          1.5 *
                                          pi;
                                    } else if (speed.toInt() == 10) {
                                      angle =
                                          (speed.toInt() / maxSpeed) * 1.5 * pi;
                                    } else if (speed.toInt() == 0) {
                                      angle =
                                          ((speed.toInt() - 10) / maxSpeed) *
                                              1.5 *
                                              pi;
                                    } else {
                                      angle = ((speed.toInt() - 2) / maxSpeed) *
                                          1.5 *
                                          pi;
                                    }
                                    // Determine text and color based on speed
                                    String textLabel = speed > 50 ? 'Good' : 'Bad';
                                    Color textColor = speed > 50 ? Colors.green : Colors.red;
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          textLabel,
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Urbanist',
                                          ),
                                        ),
                                        // SizedBox(width: 10,),
                                        Container(
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
                                                  color: Colors.transparent),
                                              minMaxTextStyle: const TextStyle(
                                                  color: Colors.transparent),
                                              animate: false,
                                              gaugeWidth: 5,
                                              duration:
                                                  const Duration(seconds: 3),
                                              unitOfMeasurement: "",
                                              alertColorArray: [
                                                AppColor.primaryColor,
                                                Colors.yellow,
                                              ],
                                              alertSpeedArray: const [30, 35],
                                              subDivisionCircleColors:
                                                  Colors.transparent,
                                              activeGaugeColor:
                                                  AppColor.primaryColor,
                                              divisionCircleColors:
                                                  Colors.transparent,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 150,
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: Transform.scale(
                                                      scaleX: 1,
                                                      scaleY: 1,
                                                      child: SvgPicture.asset(
                                                        height: 58,
                                                        width: 58,
                                                        ProjectImages.circle, // Your gauge circle image
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 25,
                                                    right: 25,
                                                    child: Transform(
                                                      alignment:
                                                          Alignment.center,
                                                      transform:
                                                          Matrix4.rotationZ(
                                                              angle),
                                                      child: SvgPicture.asset(
                                                        ProjectImages.point, // Your pointer image
                                                        width: 10,
                                                        height: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 55,
                                                    left: 25,
                                                    child: Center(
                                                      child: Text(
                                                        "${speed.toStringAsFixed(0)}%",
                                                        style: TextStyle(
                                                          color: AppColor
                                                              .fontColor,
                                                          fontSize: 17,
                                                          letterSpacing: 0.1,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'Urbanist',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: SizedBox(
                          //     height: 80,
                          //     width: 80,
                          //     child: Align(
                          //       alignment: Alignment.topRight,
                          //       child: KdGaugeView(
                          //         inactiveGaugeColor: Colors.red,
                          //         minSpeed: 0,
                          //         maxSpeed: 100,
                          //         speed: speed,
                          //         speedTextStyle: const TextStyle(
                          //             color: Colors
                          //                 .transparent), // Speed text inside gauge
                          //         minMaxTextStyle: const TextStyle(
                          //             color: Colors.transparent),
                          //         animate: false,
                          //         gaugeWidth: 5,
                          //         duration: const Duration(seconds: 3),
                          //         unitOfMeasurement: "",
                          //         alertColorArray: [
                          //           AppColor.primaryColor,
                          //           Colors.yellow
                          //         ],
                          //         alertSpeedArray: const [30, 35],
                          //         subDivisionCircleColors: Colors.transparent,
                          //         activeGaugeColor: AppColor.primaryColor,
                          //         divisionCircleColors: Colors.transparent,
                          //         child: Stack(
                          //           children: [
                          //             // Background container for gauge view
                          //             Container(
                          //               height: 100,
                          //               width: 150,
                          //             ),
                          //             // Positioned gauge circle
                          //             Positioned(
                          //               top: 5,
                          //               right: 5,
                          //               child: Transform.scale(
                          //                 scaleX: 1,
                          //                 scaleY: 1,
                          //                 child: SvgPicture.asset(
                          //                   height: 58,
                          //                   width: 58,
                          //                   ProjectImages.circle, // Replace with your gauge circle image path
                          //                 ),
                          //               ),
                          //             ),
                          //             // Positioned pointer
                          //             Positioned(
                          //               top: 25,
                          //               right: 25,
                          //               child: Transform(
                          //                 alignment: Alignment.center,
                          //                 transform: Matrix4.rotationZ(
                          //                     angle), // Rotate pointer
                          //                 child: SvgPicture.asset(
                          //                   ProjectImages
                          //                       .point, // Replace with your pointer image path
                          //                   width: 10,
                          //                   height: 20,
                          //                 ),
                          //               ),
                          //             ),
                          //             // Speed text inside the gauge
                          //             Positioned(
                          //               top:
                          //                   55, // Adjust top to position text correctly
                          //               left:
                          //                   25, // Adjust left to position text correctly
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
                        ],
                      ),
                    ),
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
                    Obx(() {
                      if (keyRatioAnalsisController.ratios.isEmpty) {
                        return Center(child: const Text(''));
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 70,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist',
                                    color: AppColor.blackColor),
                              ),
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
                            // Container(
                            //   width: 60,
                            //   child: Text(
                            //     'Interpretation',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600,
                            //         fontFamily: 'Urbanist',
                            //         color: AppColor.blackColor),
                            //         overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }),
                    Obx(() {
                      if (keyRatioAnalsisController.ratios.isEmpty) {
                        return const Center(child: Text('No data available'));
                      }
                      return ListView.builder(
                          itemCount: keyRatioAnalsisController.ratios.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item =
                                keyRatioAnalsisController.ratios[index];
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 70,
                                        child: Text(
                                          item['name'],
                                          style: TextStyle(
                                              color: AppColor.blackColor,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        // If the item['value'] is a double, no need for toStringAsFixed
                                        item['value'] is double
                                            ? item['value'].toStringAsFixed(1)
                                            : double.parse(item['value'])
                                                .toStringAsFixed(1),
                                        style: TextStyle(
                                          color: item['value'] is double
                                              ? keyRatioAnalsisController
                                                  .getColorForInterpretation(
                                                      item['value'])
                                              : keyRatioAnalsisController
                                                  .getColorForInterpretation(
                                                      double.parse(
                                                          item['value'])),
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      // Text(
                                      //   // '1.5',
                                      //   item['value'].toStringAsFixed(1),
                                      //   style: TextStyle(
                                      //       // color: AppColor.blackColor,
                                      //       color: keyRatioAnalsisController
                                      //           .getColorForInterpretation(
                                      //               double.parse(item['value'])),
                                      //       fontFamily: 'Urbanist',
                                      //       fontWeight: FontWeight.w500,
                                      //       fontSize: 15),
                                      // ),
                                      Text(
                                        // '1.0-2.0,
                                        '${item['minimum']}-${item['maximum']}',
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
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    ///Show/Not Show
                    Text(
                      'Ratio Details',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    // ElevatedButton(
                    //   onPressed: startRecording,
                    //   child: Text('Start Recording'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: stopRecording,
                    //   child: Text('Stop Recording'),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ratio Name: ',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist'),
                              ),
                              Text(
                                'Current Ratio',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Defination: ',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist'),
                              ),
                              Text(
                                'Measures the comapny s\nability to pay short-term\nobligation with current assets',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Formula: ',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist'),
                              ),
                              Text(
                                'Current Assets / Current Liabilities',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trend Analysis: ',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist'),
                              ),
                              Text(
                                'Chart showing trend over...',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 132,
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                barGroups: keyRatioAnalsisController.ratios
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => BarChartGroupData(
                                    groupVertically: true,
                                    x: e.key, // Index of the group
                                    barRods: [
                                      BarChartRodData(
                                        borderRadius: BorderRadius.circular(3),
                                        toY: (e.value['value'] is double)
                                            ? double.parse(e.value['value'].toStringAsFixed(1)) // Truncate to 1 decimal place
                                            : 0.0, // If value is not a double, fallback to 0.0
                                        color: const Color(0xFF48BD69),
                                        width: 11,
                                      ),
                                    ],
                                  ),
                                ).toList(),
                                titlesData: FlTitlesData(
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  leftTitles: AxisTitles(
                                    drawBelowEverything: true,
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      interval: 20,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          "${value}", // Display Y-axis values as percentages
                                          style: TextStyle(
                                            color: AppColor.fontColor,
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Urbanist',
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        // Accessing names from the ratios list for bottom titles
                                          final categories = keyRatioAnalsisController.ratios
                                            .map((e) => e['name'] ?? 'Unknown')
                                            .toList();
                                        return Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              categories[value.toInt() % categories.length], // Showing the names on X-axis
                                              style: TextStyle(
                                                color: AppColor.blackColor,
                                                fontSize: 4,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Urbanist',
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                baselineY: 0, // Set baseline to 0
                                maxY: 100, // Set max Y to 100 for percentage scale
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  verticalInterval: 20, // Interval for percentage scale
                                  horizontalInterval: 20, // Interval for percentage scale
                                  getDrawingHorizontalLine: (value) {
                                    return const FlLine(
                                      color: Color(0xFFB1B1B1),
                                      strokeWidth: 0.5,
                                    );
                                  },
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            )
                          )
                          ///Linear Chart Design
                          // Container(
                          //   height: 132,
                          //   child: BarChart(
                          //     BarChartData(
                          //       alignment: BarChartAlignment.spaceAround,
                          //       barGroups: keyRatioAnalsisController.ratios
                          //           .asMap()
                          //           .entries
                          //           .map(
                          //             (e) => BarChartGroupData(
                          //               groupVertically: true,
                          //               x: e.key, // Index of the group
                          //               barRods: [
                          //                 BarChartRodData(
                          //                   borderRadius:
                          //                       BorderRadius.circular(3),
                          //                   toY: double.tryParse(e
                          //                               .value['ratio']
                          //                               ?.toString() ??
                          //                           '0') ??
                          //                       0.0, // Accessing the 'ratio' field safely
                          //                   color: const Color(0xFF48BD69),
                          //                   width: 11,
                          //                 ),
                          //               ],
                          //             ),
                          //           )
                          //           .toList(),
                          //       titlesData: FlTitlesData(
                          //         rightTitles: const AxisTitles(
                          //             sideTitles:
                          //                 SideTitles(showTitles: false)),
                          //         topTitles: const AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: false,
                          //           ),
                          //         ),
                          //         leftTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: true,
                          //             reservedSize: 30,
                          //             interval:
                          //                 20, // Adjust for percentage values (e.g., every 20%)
                          //             getTitlesWidget: (value, meta) {
                          //               return Text(
                          //                 "${value.toInt()}%", // Display as percentage
                          //                 style: TextStyle(
                          //                   color: AppColor.fontColor,
                          //                   fontSize: 7,
                          //                   fontWeight: FontWeight.w500,
                          //                   fontFamily: 'Urbanist',
                          //                 ),
                          //               );
                          //             },
                          //           ),
                          //           drawBelowEverything: true,
                          //         ),
                          //         bottomTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: true,
                          //             getTitlesWidget: (value, meta) {
                          //               // Accessing names from the ratios list
                          //               final categories =
                          //                   keyRatioAnalsisController.ratios
                          //                       .map((e) =>
                          //                           e['name'] ?? 'Unknown')
                          //                       .toList();
                          //               return Column(
                          //                 children: [
                          //                   const SizedBox(
                          //                     height: 10,
                          //                   ),
                          //                   Text(
                          //                     categories[value.toInt() %
                          //                         categories
                          //                             .length], // Handling bottom titles (names)
                          //                     style: TextStyle(
                          //                       color: AppColor.blackColor,
                          //                       fontSize: 5,
                          //                       fontWeight: FontWeight.w500,
                          //                       fontFamily: 'Urbanist',
                          //                     ),
                          //                   ),
                          //                 ],
                          //               );
                          //             },
                          //           ),
                          //         ),
                          //       ),
                          //       baselineY: 0, // Set baseline to 0
                          //       maxY:
                          //           100, // Set max Y to 100 for percentage scale
                          //       gridData: FlGridData(
                          //         show: true,
                          //         verticalInterval:
                          //             20, // Adjusted interval for percentage scale
                          //         horizontalInterval:
                          //             20, // Adjusted interval for percentage scale
                          //         getDrawingHorizontalLine: (value) {
                          //           return const FlLine(
                          //             color: Color(0xFFB1B1B1),
                          //             strokeWidth: 0.5,
                          //           );
                          //         },
                          //         drawVerticalLine: false,
                          //       ),
                          //       borderData: FlBorderData(
                          //         show: true,
                          //         border: Border.all(
                          //           color: Colors.transparent,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                              ///
                          // Container(
                          //   height: 200,
                          //   child: LineChart(
                          //     LineChartData(
                          //       extraLinesData: ExtraLinesData(
                          //         extraLinesOnTop: true,
                          //         verticalLines: [
                          //           VerticalLine(
                          //             x: keyRatioAnalsisController.dividerPosition.value,
                          //             color: Colors.green,
                          //             strokeWidth: 2,
                          //             dashArray: [4, 2],
                          //             label: VerticalLineLabel(
                          //               show: true,
                          //               alignment: Alignment.topRight,
                          //               style: const TextStyle(
                          //                 color: Colors.green,
                          //                 fontSize: 12,
                          //                 fontFamily: 'Urbanist',
                          //               ),
                          //               labelResolver: (line) {
                          //                 return keyRatioAnalsisController.dividerPosition.value.toStringAsFixed(1);
                          //               },
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       borderData: FlBorderData(show: false),
                          //       gridData: const FlGridData(show: false),
                          //       titlesData: FlTitlesData(
                          //         bottomTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: false,
                          //             interval: 5,
                          //             getTitlesWidget: _buildBottomTitle,
                          //           ),
                          //         ),
                          //         leftTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         rightTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         topTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //       ),
                          //       lineBarsData: [
                          //         LineChartBarData(
                          //           spots: keyRatioAnalsisController.spotsData.isNotEmpty
                          //               ? keyRatioAnalsisController.spotsData
                          //               : [const FlSpot(0, 0)], // Ensure there's always data to display
                          //           isCurved: true,
                          //           color: Colors.green,
                          //           barWidth: 2,
                          //           isStrokeCapRound: true,
                          //           dotData: const FlDotData(show: false),
                          //           belowBarData: BarAreaData(
                          //             show: true,
                          //             color: Colors.green.withOpacity(0.3),
                          //           ),
                          //         ),
                          //       ],
                          //       minX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.first.x
                          //           : 0,
                          //       maxX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.last.x
                          //           : 1,
                          //       minY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a < b ? a : b)
                          //           : 0,
                          //       maxY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 1
                          //           : 6,
                          //     ),
                          //   ),
                          // )
                          // Container(
                          //   height: 200,
                          //   child: LineChart(
                          //     LineChartData(
                          //       extraLinesData: ExtraLinesData(
                          //         extraLinesOnTop: true,
                          //         verticalLines: [
                          //           VerticalLine(
                          //             x: keyRatioAnalsisController.dividerPosition.value,
                          //             color: Colors.green,
                          //             strokeWidth: 2,
                          //             dashArray: [4, 2],
                          //             label: VerticalLineLabel(
                          //               show: true,
                          //               alignment: Alignment.topRight,
                          //               style: const TextStyle(
                          //                 color: Colors.green,
                          //                 fontSize: 12,
                          //                 fontFamily: 'Urbanist',
                          //               ),
                          //               labelResolver: (line) {
                          //                 return '${keyRatioAnalsisController.dividerPosition.value.toStringAsFixed(1)}';
                          //               },
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       borderData: FlBorderData(show: false),
                          //       gridData: const FlGridData(show: false),
                          //       titlesData: FlTitlesData(
                          //         bottomTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: true,
                          //             interval: 5,
                          //             getTitlesWidget: _buildBottomTitle,
                          //           ),
                          //         ),
                          //         leftTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         rightTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         topTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //       ),
                          //       lineBarsData: [
                          //         LineChartBarData(
                          //           spots: keyRatioAnalsisController.spotsData.isNotEmpty
                          //               ? keyRatioAnalsisController.spotsData
                          //               : [FlSpot(0, 0)], // Ensure there's always data to display
                          //           isCurved: true,
                          //           color: Colors.green,
                          //           barWidth: 2,
                          //           isStrokeCapRound: true,
                          //           dotData: const FlDotData(show: false),
                          //           belowBarData: BarAreaData(
                          //             show: true,
                          //             color: Colors.green.withOpacity(0.3),
                          //           ),
                          //         ),
                          //       ],
                          //       minX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.first.x
                          //           : 0,
                          //       maxX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.last.x
                          //           : 1,
                          //       minY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a < b ? a : b)
                          //           : 0,
                          //       maxY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 1
                          //           : 6,
                          //
                          //     ),
                          //   )
                          // )
                          ///dynamic bt vertical line not show
                          // Container(
                          //   height: 200,
                          //   child: LineChart(
                          //     LineChartData(
                          //         extraLinesData: ExtraLinesData(
                          //         extraLinesOnTop: true,
                          //         verticalLines: [
                          //           VerticalLine(
                          //             x: keyRatioAnalsisController.dividerPosition.value,
                          //             color: Colors.green,
                          //             strokeWidth: 2,
                          //             dashArray: [4, 2],
                          //             label: VerticalLineLabel(
                          //               show: true,
                          //               alignment: Alignment.topRight,
                          //               style: const TextStyle(
                          //                   color: Colors.green,
                          //                   fontSize: 12,
                          //                   fontFamily: 'Urbanist'
                          //               ),
                          //               labelResolver: (line) {
                          //                 return '${keyRatioAnalsisController.dividerPosition.value.toStringAsFixed(1)}';
                          //               },
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       borderData: FlBorderData(show: false),
                          //       gridData: const FlGridData(show: false),
                          //       titlesData: FlTitlesData(
                          //         bottomTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: true,
                          //             interval: 5,
                          //             getTitlesWidget: _buildBottomTitle,
                          //           ),
                          //         ),
                          //         leftTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         rightTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         topTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //       ),
                          //       lineBarsData: [
                          //         LineChartBarData(
                          //           spots: keyRatioAnalsisController.spotsData.isNotEmpty
                          //               ? keyRatioAnalsisController.spotsData
                          //               : [FlSpot(0, 0)], // Ensure there's always data to display
                          //           isCurved: true,
                          //           color: Colors.green,  // Set the line color here
                          //           barWidth: 2,
                          //           isStrokeCapRound: true,
                          //           dotData: const FlDotData(show: false),
                          //           belowBarData: BarAreaData(
                          //             show: true,
                          //             color: Colors.green.withOpacity(0.3), // Make sure this color is visible
                          //           ),
                          //         ),
                          //       ],
                          //       // Dynamically calculate minX, maxX based on your data
                          //       minX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.first.x
                          //           : 0,
                          //       maxX: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.last.x
                          //           : 1,
                          //       minY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a < b ? a : b)
                          //           : 0,
                          //       maxY: keyRatioAnalsisController.spotsData.isNotEmpty
                          //           ? keyRatioAnalsisController.spotsData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 1
                          //           : 6,
                          //     ),
                          //   ),
                          // )
                          ///only design
                          // Container(
                          //   height: 200,
                          //   child: LineChart(
                          //     LineChartData(
                          //       extraLinesData: ExtraLinesData(
                          //         extraLinesOnTop: true,
                          //         verticalLines: [
                          //           VerticalLine(
                          //             x: keyRatioAnalsisController
                          //                 .dividerPosition.value,
                          //             color: Colors.green,
                          //             strokeWidth: 2,
                          //             dashArray: [4, 2],
                          //             label: VerticalLineLabel(
                          //               show: true,
                          //               alignment: Alignment.topRight,
                          //               style: const TextStyle(
                          //                   color: Colors.green,
                          //                   fontSize: 12,
                          //                   fontFamily: 'Urbanist'),
                          //               labelResolver: (line) {
                          //                 return '${keyRatioAnalsisController.dividerPosition.value.toStringAsFixed(1)}';
                          //               },
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       borderData: FlBorderData(show: false),
                          //       gridData: const FlGridData(show: false),
                          //       titlesData: FlTitlesData(
                          //         bottomTitles: AxisTitles(
                          //           sideTitles: SideTitles(
                          //             showTitles: true,
                          //             interval:
                          //                 5, // This ensures that the interval between titles is correct
                          //             getTitlesWidget: _buildBottomTitle,
                          //           ),
                          //         ),
                          //         leftTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         rightTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //         topTitles: const AxisTitles(
                          //           sideTitles: SideTitles(showTitles: false),
                          //         ),
                          //       ),
                          //       lineBarsData: [
                          //         LineChartBarData(
                          //           spots: [
                          //             const FlSpot(10, 3),
                          //             const FlSpot(15, 5),
                          //             const FlSpot(20, 3.5),
                          //             const FlSpot(25, 4),
                          //             const FlSpot(30, 3),
                          //           ],
                          //           isCurved: true,
                          //           color: Colors.green,
                          //           barWidth: 2,
                          //           isStrokeCapRound: true,
                          //           dotData: const FlDotData(show: false),
                          //           belowBarData: BarAreaData(
                          //             show: true,
                          //             color: Colors.green.withOpacity(0.3),
                          //           ),
                          //         ),
                          //         LineChartBarData(
                          //           spots: [
                          //             const FlSpot(10, 2.5),
                          //             const FlSpot(15, 4),
                          //             const FlSpot(20, 3),
                          //             const FlSpot(25, 3.5),
                          //             const FlSpot(30, 2.5),
                          //           ],
                          //           isCurved: true,
                          //           color: Colors.red,
                          //           barWidth: 2,
                          //           isStrokeCapRound: true,
                          //           dotData: const FlDotData(show: false),
                          //           belowBarData: BarAreaData(
                          //             show: true,
                          //             color: Colors.green.withOpacity(0.3),
                          //           ),
                          //         ),
                          //       ],
                          //       minX: 10,
                          //       maxX: 30,
                          //       minY: 0,
                          //       maxY: 6,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  // final Record _record = Record();
  //
  // Future<void> requestPermissions() async {
  //   var status = await Permission.microphone.request();
  //   if (status != PermissionStatus.granted) {
  //     print('Microphone permission denied');
  //   }
  // }
  //
  //
  // Future<void> requestStoragePermission() async {
  //   if (!await Permission.storage.isGranted) {
  //     await Permission.storage.request();
  //   }
  // }
  //
  //
  // Future<void> startRecording() async {
  //   // Request storage permission
  //   await requestStoragePermission();
  //
  //   // Get the external storage directory
  //   Directory? externalDir = await getExternalStorageDirectory();
  //
  //   // Set the path to a public folder, e.g., "Downloads"
  //   String filePath = '/storage/emulated/0/Download/audio.m4a';
  //
  //   if (await _record.hasPermission()) {
  //     await _record.start(
  //       path: filePath,
  //       encoder: AudioEncoder.aacLc,
  //       bitRate: 128000,
  //       samplingRate: 44100,
  //     );
  //     print('Recording started and saved to: $filePath');
  //   }
  // }
  //
  // Future<void> stopRecording() async {
  //   if (await _record.isRecording()) {
  //     String? path = await _record.stop();
  //     print('Recording stopped, saved at: $path');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   requestPermissions();
  // }

}

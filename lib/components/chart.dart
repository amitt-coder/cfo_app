import 'package:cfo_app/app/modules/dashBoard/controllers/dash_board_controller.dart';
import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class EbitdaGraph extends StatelessWidget {
  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => LineChart(
          LineChartData(
            backgroundColor: AppColor.primaryColor,
            lineBarsData: [
              LineChartBarData(
                gradient: LinearGradient(colors: [
                  Colors.white10,
                  Colors.white12,
                  Colors.white30,
                  Colors.white38,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white38,
                  Colors.white30,
                  Colors.white12,
                  Colors.white10,
                ]),
                spots: _createLineSpots(),
                isCurved: true,
                barWidth: 1.8,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                color: Colors.white,
                isStrokeCapRound: true,
              ),
            ],
            titlesData: FlTitlesData(
              show: false,
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            lineTouchData: LineTouchData(enabled: false),
            minX: 0,
            maxX: (controller.ebitda.length - 1).toDouble(),
            minY: controller.ebitda.reduce(
                    (value, element) => value < element ? value : element) -
                500,
            maxY: controller.ebitda.reduce(
                    (value, element) => value > element ? value : element) +
                500,
          ),
        ),
      ),
    );
  }

  List<FlSpot> _createLineSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < controller.ebitda.length; i++) {
      spots.add(FlSpot(i.toDouble(), controller.ebitda[i].toDouble()));
    }
    return spots;
  }
}

class CashFlowChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for 12 months
    final List<double> cashIn = [
      100000,
      120000,
      90000,
      150000,
      600000,
      140000,
      130000,
      170000,
      180000,
      200000,
      190000,
      210000
    ];
    final List<double> cashOut = [
      -50000,
      -70000,
      -40000,
      -80000,
      -90000,
      -60000,
      -70000,
      -90000,
      -10000,
      -120000,
      -110000,
      -130000
    ];
    final List<double> totalCash = [
      0,
      60000,
      90000,
      150000,
      600000,
      140000,
      130000,
      170000,
      180000,
      200000,
      190000,
      210000
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   height: 300,
          //   padding: EdgeInsets.all(16),
          //   child: LineChart(
          //     LineChartData(
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: totalCash
          //               .asMap()
          //               .entries
          //               .map((e) => FlSpot(e.key.toDouble(), e.value))
          //               .toList(),
          //           isCurved: false,
          //           color: Colors.green[900]!,
          //           barWidth: 2,
          //         ),
          //       ],
          //       titlesData: FlTitlesData(
          //         leftTitles: AxisTitles(sideTitles:SideTitles(showTitles: true)),
          //         bottomTitles:AxisTitles(sideTitles: SideTitles(
          //           showTitles: true,
          //           getTitlesWidget: (value, meta) {
          //             final months = [
          //               'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
          //               'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
          //             ];
          //
          //             return Text( months[value.toInt() % 12]);
          //           },
          //         )),
          //       ),
          //       gridData: FlGridData(show: false),
          //       borderData: FlBorderData(show: true),
          //     ),
          //   ),
          // ),
          Container(
            height: 132,
            child: Stack(
              children: [
                BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    barGroups: cashIn
                        .asMap()
                        .entries
                        .map(
                          (e) => BarChartGroupData(
                            groupVertically: true,
                            x: e.key,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.zero,
                                toY: e.value,
                                color: Color(0xFF48BD69),
                                width: 11,
                              ),
                              BarChartRodData(
                                borderRadius: BorderRadius.zero,
                                toY: cashOut[e.key],
                                color: Color(0xFF139939),
                                width: 11,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    titlesData: FlTitlesData(
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 200000,
                          getTitlesWidget: (value, meta) {
                            if (value == 610000) {
                              return SizedBox();
                            } else if (value == -610000) {
                              return SizedBox();
                            } else if (value >= 1000) {
                              return Text(
                                '₹${(value.toInt() / 1000).toStringAsFixed(0)}k',
                                style: TextStyle(
                                    color: AppColor.fontColor,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              );
                            } else if (value.toInt() <= -1000) {
                              return Text(
                                '₹${(value.toInt() / 1000).toStringAsFixed(0)}k',
                                style: TextStyle(
                                    color: AppColor.fontColor,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              );
                            }
                            return Text(
                              "₹${value.toInt().toString()}",
                              style: TextStyle(
                                  color: AppColor.fontColor,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            );
                          },
                        ),
                        drawBelowEverything: true,
                      ),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final months = [
                            'Jan24',
                            'Feb24',
                            'Mar24',
                            'Apr24',
                            'May24',
                            'Jun24',
                            'Jul24',
                            'Aug24',
                            'Sep24',
                            'Oct24',
                            'Nov24',
                            'Dec24'
                          ];
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                months[value.toInt() % 12],
                                style: TextStyle(
                                    color: AppColor.fontColor,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              ),
                            ],
                          );
                        },
                      )),
                    ),
                    maxY: 610000,
                    minY: -610000,
                    gridData: FlGridData(
                      show: false,
                      verticalInterval: 200000,
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    // borderData: FlBorderData(show: false,),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 132,
                    child: LineChart(
                      curve: Curves.bounceIn,
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                              spots: totalCash
                                  .asMap()
                                  .entries
                                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                                  .toList(),
                              isCurved: false,
                              color: Color(0xFF008224),
                              barWidth: 1,
                              dotData: FlDotData(show: false)),
                        ],
                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 200000,
                              // getTitlesWidget: (value, meta) {
                              //   if(value==610000){
                              //     return SizedBox();
                              //   }else if(value==-610000){
                              //     return SizedBox();
                              //   }else if (value >= 1000) {
                              //     return Text('₹${(value.toInt() / 1000).toStringAsFixed(0)}k',
                              //       style: TextStyle(
                              //           color:AppColor.fontColor,
                              //           fontSize: 7,
                              //           fontWeight: FontWeight.w500,
                              //           fontFamily: 'Urbanist'
                              //       ),
                              //     );
                              //   }else if(value.toInt()<=-1000){
                              //     return Text('₹${(value.toInt() / 1000).toStringAsFixed(0)}k',
                              //       style: TextStyle(
                              //           color:AppColor.fontColor,
                              //           fontSize: 7,
                              //           fontWeight: FontWeight.w500,
                              //           fontFamily: 'Urbanist'
                              //       ),
                              //     );
                              //   }
                              //   return Text(
                              //    "₹${value.toInt().toString()}",
                              //     style: TextStyle(
                              //         color:AppColor.fontColor,
                              //         fontSize: 7,
                              //         fontWeight: FontWeight.w500,
                              //         fontFamily: 'Urbanist'
                              //     ),
                              //   );
                              // },
                              getTitlesWidget: (value, meta) {
                                return SizedBox();
                              },
                            ),
                            drawBelowEverything: true,
                          ),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final months = [
                                'Jan24',
                                'Feb24',
                                'Mar24',
                                'Apr24',
                                'May24',
                                'Jun24',
                                'Jul24',
                                'Aug24',
                                'Sep24',
                                'Oct24',
                                'Nov24',
                                'Dec24'
                              ];
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ],
                              );
                            },
                          )),
                        ),
                        // titlesData: FlTitlesData(
                        //     topTitles: AxisTitles(sideTitles:SideTitles(showTitles: false),),
                        //   rightTitles: AxisTitles(sideTitles:SideTitles(showTitles: false)),
                        //   leftTitles: AxisTitles(sideTitles:SideTitles(showTitles:true,interval: 200000,reservedSize: 30,getTitlesWidget: (value, meta) {
                        //     return SizedBox();
                        //   },),),
                        //   bottomTitles:AxisTitles(sideTitles: SideTitles(
                        //     showTitles: false,
                        //     getTitlesWidget: (value, meta) {
                        //       final months = [
                        //         'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        //         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                        //       ];
                        //
                        //       return SizedBox(height: 10,);
                        //     },
                        //   )),
                        // ),
                        gridData: FlGridData(
                          show: true,
                          horizontalInterval: 200000,
                          drawVerticalLine: false,
                        ),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxY: 610000,
                        minY: -610000,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CashChartPL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for 12 months
    final List<double> cashIn = [
      108942,
      76620,
      13096,
      885,
      4389,
      15692,
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 132,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: cashIn
                    .asMap()
                    .entries
                    .map(
                      (e) => BarChartGroupData(
                    groupVertically: true,
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        borderRadius: BorderRadius.circular(3),
                        toY: e.value,
                        color: Color(0xFF48BD69),
                        width: 11,
                      ),
                    ],
                  ),
                )
                    .toList(),
                titlesData: FlTitlesData(
                  rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      reservedSize: 30,
                      interval: 65000,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "₹${value.toInt().toString()}",
                          style: TextStyle(
                              color: AppColor.fontColor,
                              fontSize: 7,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist'),
                        );
                      },
                    ),
                    drawBelowEverything: true,
                  ),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final months = [
                            'CC 001',
                            'CC 002',
                            'CC 003',
                            'CC 004',
                            'CC 005',
                            'CC 006',
                          ];
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                months[value.toInt() % 12],
                                style: TextStyle(
                                    color: Color(0xFF808D9E),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Urbanist'),
                              ),
                            ],
                          );
                        },
                      )),
                ),
                baselineY: 0.5,
                maxY:130000,
                gridData: FlGridData(
                  show: true,
                  verticalInterval: 65000,
                  horizontalInterval: 65000,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Color(0xFFB1B1B1),
                      strokeWidth: 0.5
                    );
                  },
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Colors.transparent,
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class RadialGaugeExample extends StatefulWidget {
//   @override
//   _RadialGaugeExampleState createState() => _RadialGaugeExampleState();
// }
// class _RadialGaugeExampleState extends State<RadialGaugeExample> {
//   double _needleValue = 50; // Initial value of the needle
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SfRadialGauge(
//           axes: <RadialAxis>[
//             RadialAxis(
//               showLabels: false,
//               showTicks: false,
//               axisLineStyle: AxisLineStyle(
//                 thickness: 15,
//                 cornerStyle: CornerStyle.bothCurve,
//               ),
//               minimum: 0,
//               maximum: 100,
//               ranges: [
//                 GaugeRange(startValue: 0, endValue:30,color:AppColor.primaryColor,
//                 )
//               ],
//               pointers: <GaugePointer>[
//                 NeedlePointer(
//                   value: 50,
//                   needleLength: 0.5,
//                   knobStyle: KnobStyle(
//                     knobRadius: 0.1,
//                     color: Colors.black,
//                     borderWidth: 20,
//                   ),
//                 ),
//               ],
//
//               annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                   widget: Text(
//                     '50',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   angle: 90,
//                   positionFactor: 0.5,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class Speedometer extends StatelessWidget {
//   final double progress;
//
//   Speedometer({required this.progress});
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           PieChart(
//             PieChartData(
//               sections: _getSections(),
//               startDegreeOffset: 270,
//               centerSpaceRadius: 60,
//               sectionsSpace: 0,
//               borderData: FlBorderData(show: false),
//             ),
//           ),
//           Text(
//             '${(progress * 100).toInt()}%',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<PieChartSectionData> _getSections() {
//     return [
//       PieChartSectionData(
//         color: Colors.green,
//         value: progress,
//         radius: 80,
//         showTitle: false,
//       ),
//       PieChartSectionData(
//         color: Colors.grey.shade300,
//         value: 1 - progress,
//         radius: 80,
//         showTitle: false,
//       ),
//     ];
//   }
// }

// class PointerRotationExample extends StatefulWidget {
//   @override
//   _PointerRotationExampleState createState() => _PointerRotationExampleState();
// }
//
// class _PointerRotationExampleState extends State<PointerRotationExample> {
//   double _angle = 0; // Rotation angle in radians
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Background or other widgets
//           // Rotating pointer
//           Transform(
//             alignment: Alignment.center,
//             transform: Matrix4.rotationZ(_angle), // Rotate around the center
//             child: Stack(
//               children: [
//                 Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue
//                   ),
//                 ),
//                 Positioned(
//                   top: 22,
//                   right: 20,
//                   child:SvgPicture.asset(
//                   ProjectImages.point, // Replace with your pointer image
//                   width: 10,
//                   height: 20,
//                 ),)
//               ],
//             ),
//           ),
//           // Slider for controlling the rotation
//
//           Positioned(
//             bottom: 20,
//             child: Slider(
//               value: _angle,
//               min: 0,
//               max: 2 * math.pi, // 360 degrees in radians
//               divisions: 360,
//               label: (_angle * 180 / math.pi).toStringAsFixed(0) + '°',
//               onChanged: (double value) {
//                 setState(() {
//                   _angle = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

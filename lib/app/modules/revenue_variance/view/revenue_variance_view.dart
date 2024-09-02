import 'package:cfo_app/app/modules/revenue_variance/controller/revenue_variance_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class RevenueVariancesView extends StatelessWidget {


  // final List<double> cashIn = [
  //   108942,
  //   76620,
  //   13096,
  //   60000,
  //   40000,
  // ];

  RevenueVarianceController revenueVarianceController = Get.put(RevenueVarianceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(
      //   title: 'Revenue Variances',
      //   automaticallyImplyLeading: false,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Get.back();
      //     },
      //     child: Image.asset(
      //       ProjectImages.arrow_left,
      //       height: 25,
      //       width: 25,
      //     ),
      //   ),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.backgroundColors,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Revenue Variances',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  CommonTextField(
                    ontap: () {
                      revenueVarianceController.pickDateRange(context);
                    },
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width * 0.40,
                    lableText: 'Select Date',
                    controllers: revenueVarianceController.dateRangeController,
                    keyboardTypes: TextInputType.name,
                    prefixIcon: ProjectImages.mail,
                  ),
                  // DropDownField(
                  //   onChanged: (String? newValue) {
                  //     revenueVarianceController.showday.value = newValue!;
                  //   },
                  //   selectValue: revenueVarianceController.showday.value,
                  //   hintName: 'show',
                  //   width: MediaQuery.of(context).size.width * 0.40,
                  //   height: 45,
                  //   selectPriceInstallment:
                  //   revenueVarianceController.dayList,
                  //   controller: revenueVarianceController.daysController,
                  //   showBorder: '0',
                  // ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Total Budgeted Revenue: ',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Obx(() =>
                  Text(
                    revenueVarianceController.creditors_amount.value,
                    // '₹600,000',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Total Actual Revenue: ',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Obx(() =>
                  Text(
                    revenueVarianceController.debtors_amount.value,
                    // '₹650,000',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Total Variance: ',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Obx(() =>
                  Text(
                    revenueVarianceController.total_amount.value,
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 30),
              Obx(() {
                // Check if the cashInPercentages list is empty to handle potential empty states
                if (revenueVarianceController.cashInPercentages.isEmpty) {
                  return const Center(child: Text('No data available')); // Graceful handling for no data
                }
                // print('cashInPercentages: ${revenueVarianceController.cashInPercentages}');
                return Container(
                  height: 132,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      barGroups: revenueVarianceController.cashInPercentages
                          .asMap()
                          .entries
                          .map(
                            (e) => BarChartGroupData(
                          groupVertically: true,
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              borderRadius: BorderRadius.circular(3),
                              toY: e.value, // Assuming these are already percentage values
                              color: const Color(0xFF48BD69),
                              width: 11,
                            ),
                          ],
                        ),
                      ).toList(),
                      titlesData: FlTitlesData(
                        rightTitles:const  AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 20, // Interval adjusted for percentage values (e.g., every 20%)
                            getTitlesWidget: (value, meta) {
                              return Text(
                                "${value.toInt()}%", // Display as percentage
                                style: TextStyle(
                                  color: AppColor.fontColor,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist',
                                ),
                              );
                            },
                          ),
                          drawBelowEverything: true,
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final categories = [
                                'Product A Sales',
                                'Product B Sales',
                                'Service',
                                'Subscription',
                                'Other',
                              ];
                              return Column(
                                children: [
                                const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    categories[value.toInt() % categories.length],
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w500,
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
                        verticalInterval: 20, // Adjusted interval for percentage scale
                        horizontalInterval: 20, // Adjusted interval for percentage scale
                        getDrawingHorizontalLine: (value) {
                          return const FlLine(
                            color: Color(0xFFB1B1B1),
                            strokeWidth: 0.5,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                );
              })
              // Obx(() =>
              // Container(
              //   height: 132,
              //   child: BarChart(
              //     BarChartData(
              //       alignment: BarChartAlignment.spaceAround,
              //       barGroups: revenueVarianceController.cashInPercentages
              //           .asMap()
              //           .entries
              //           .map(
              //             (e) => BarChartGroupData(
              //           groupVertically: true,
              //           x: e.key,
              //           barRods: [
              //             BarChartRodData(
              //               borderRadius: BorderRadius.circular(3),
              //               toY: e.value,
              //               color: Color(0xFF48BD69),
              //               width: 11,
              //             ),
              //           ],
              //         ),
              //       ).toList(),
              //       titlesData: FlTitlesData(
              //         rightTitles:
              //         AxisTitles(sideTitles: SideTitles(showTitles: false)),
              //         topTitles: AxisTitles(
              //           sideTitles: SideTitles(
              //             showTitles: false,
              //           ),
              //         ),
              //         leftTitles: AxisTitles(
              //           sideTitles: SideTitles(
              //             showTitles: true,
              //             reservedSize: 30,
              //             interval: 65000,
              //             getTitlesWidget: (value, meta) {
              //               return Text(
              //                 "₹${value.toInt().toString()}",
              //                 style: TextStyle(
              //                     color: AppColor.fontColor,
              //                     fontSize: 7,
              //                     fontWeight: FontWeight.w500,
              //                     fontFamily: 'Urbanist'),
              //               );
              //             },
              //           ),
              //           drawBelowEverything: true,
              //         ),
              //         bottomTitles: AxisTitles(
              //             sideTitles: SideTitles(
              //               showTitles: true,
              //               getTitlesWidget: (value, meta) {
              //                 final months = [
              //                   'Product A Sales',
              //                   'Product B Sales',
              //                   'Service',
              //                   'Subscription',
              //                   'other',
              //                 ];
              //                 return Column(
              //                   children: [
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       months[value.toInt() % 12],
              //                       style: TextStyle(
              //                           color: AppColor.blackColor,
              //                           fontSize: 7,
              //                           fontWeight: FontWeight.w500,
              //                           fontFamily: 'Urbanist'),
              //                     ),
              //                   ],
              //                 );
              //               },
              //             )),
              //       ),
              //       baselineY: 0.5,
              //       maxY:130000,
              //       gridData: FlGridData(
              //         show: true,
              //         verticalInterval: 65000,
              //         horizontalInterval: 65000,
              //         getDrawingHorizontalLine: (value) {
              //           return FlLine(
              //               color: Color(0xFFB1B1B1),
              //               strokeWidth: 0.5
              //           );
              //         },
              //         drawVerticalLine: false,
              //       ),
              //       borderData: FlBorderData(
              //           show: true,
              //           border: Border.all(
              //             color: Colors.transparent,
              //           )
              //       ),
              //     ),
              //   ),
              // )),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    return [
      _createBarChartGroupData(0, 10000, 'Product A Sales'),
      _createBarChartGroupData(1, 5000, 'Product B Sales'),
      _createBarChartGroupData(2, 20000, 'Service Revenue'),
      _createBarChartGroupData(3, -5000, 'Subscription Income'),
      // _createBarChartGroupData(4, 10000, 'Other Income'),
    ];
  }

  BarChartGroupData _createBarChartGroupData(int x, double y, String label) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y > 0 ? Colors.green : Colors.red,
          width: 20,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 0,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}


// class RevenueVariancesChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Revenue Variances for Q1 2024'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Revenue Variances for Q1 2024',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Total Budgeted Revenue: \$600,000\n'
//                   'Total Actual Revenue: \$650,000\n'
//                   'Total Variance: \$50,000 (8.33% Above Budget)',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: BarChart(
//                 BarChartData(
//                   alignment: BarChartAlignment.spaceBetween,
//                   maxY: 30000,
//                   minY: -15000,
//                   barGroups: _createBarGroups(),
//                   barTouchData: BarTouchData(enabled: true),
//                   titlesData: FlTitlesData(
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 40,
//                         getTitlesWidget: (value, meta) {
//                           return Text('${value.toInt()}');
//                         },
//                       ),
//                     ),
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 100,
//                         getTitlesWidget: (value, meta) {
//                           switch (value.toInt()) {
//                             case 0:
//                               return Text('Product A Sales');
//                             case 1:
//                               return Text('Product B Sales');
//                             case 2:
//                               return Text('Service Revenue');
//                             case 3:
//                               return Text('Subscription Income');
//                             case 4:
//                               return Text('Other Income');
//                             default:
//                               return Text('');
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<BarChartGroupData> _createBarGroups() {
//     return [
//       _createBarChartGroupData(0, 10000, 'Product A Sales'),
//       _createBarChartGroupData(1, 5000, 'Product B Sales'),
//       _createBarChartGroupData(2, 20000, 'Service Revenue'),
//       _createBarChartGroupData(3, -5000, 'Subscription Income'),
//       _createBarChartGroupData(4, 10000, 'Other Income'),
//     ];
//   }
//
//   BarChartGroupData _createBarChartGroupData(int x, double y, String label) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: y > 0 ? Colors.green : Colors.red,
//           width: 20,
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 0,
//             color: Colors.grey[200],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(home: RevenueVariancesChart()));

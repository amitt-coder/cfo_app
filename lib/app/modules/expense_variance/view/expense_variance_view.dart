import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../controller/expense_variace_controller.dart';

class ExpenseVariancesView extends StatelessWidget {



  final List<double> cashIn = [
    108942,
    76620,
    13096,
    30000,
    40389,
    55692,
  ];

  ExpenseVarianceController expenseVarianceController = Get.put(ExpenseVarianceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                    'Expense Variances',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  CommonTextField(
                    ontap: () {
                      expenseVarianceController.pickDateRange(context);
                    },
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width * 0.40,
                    lableText: 'Select Date',
                    controllers: expenseVarianceController.dateRangeController,
                    keyboardTypes: TextInputType.name,
                    prefixIcon: ProjectImages.mail,
                  ),
                  // DropDownField(
                  //   onChanged: (String? newValue) {
                  //     expenseVarianceController.showday.value = newValue!;
                  //   },
                  //   selectValue: expenseVarianceController.showday.value,
                  //   hintName: 'show',
                  //   width: MediaQuery.of(context).size.width * 0.40,
                  //   height: 45,
                  //   selectPriceInstallment:
                  //   expenseVarianceController.dayList,
                  //   controller: expenseVarianceController.daysController,
                  //   showBorder: '0',
                  // ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Total Budgeted Expenses: ',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Obx(() =>
                  Text(
                    expenseVarianceController.creditors_amount.value,
                    // '₹500,000',
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
                    'Total Actual Expenses: ',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Obx(() =>
                  Text(
                    expenseVarianceController.debtors_amount.value,
                    // '₹550,000',
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
                    expenseVarianceController.total_amount.value,
                    // '₹50,000',
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
              Obx(() =>
                  Container(
                    height: 132,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        barGroups: expenseVarianceController.cashInPercentages
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
                                color: const Color(0xFF48BD69),
                                width: 11,
                              ),
                            ],
                          ),
                        ).toList(),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 10, // Adjusted interval for percentage
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  "${value.toInt()}%",
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
                                  'Salaries',
                                  'Marketing',
                                  'Utilities',
                                  'Office Supplies',
                                  'Travel',
                                  'Other',
                                ];
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      months[value.toInt() % 12],
                                      style: const TextStyle(
                                          color: Color(0xFF808D9E),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Urbanist'),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        baselineY: 0.5,
                        maxY: 100, // Max Y value is now 100 for percentages
                        gridData: FlGridData(
                          show: true,
                          verticalInterval: 10, // Adjusted interval for percentage
                          horizontalInterval: 10, // Adjusted interval for percentage
                          getDrawingHorizontalLine: (value) {
                            return const FlLine(
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
                  )
              )
              ///old design
              // Obx(() =>
            //   Container(
            //     height: 132,
            //     child: BarChart(
            //       BarChartData(
            //         alignment: BarChartAlignment.spaceAround,
            //         barGroups: expenseVarianceController.cashIn
            //             .asMap()
            //             .entries
            //             .map(
            //               (e) => BarChartGroupData(
            //             groupVertically: true,
            //             x: e.key,
            //             barRods: [
            //               BarChartRodData(
            //                 borderRadius: BorderRadius.circular(3),
            //                 toY: e.value,
            //                 color: Color(0xFF48BD69),
            //                 width: 11,
            //               ),
            //             ],
            //           ),
            //         ).toList(),
            //         titlesData: FlTitlesData(
            //           rightTitles:
            //           AxisTitles(sideTitles: SideTitles(showTitles: false)),
            //           topTitles: AxisTitles(
            //             sideTitles: SideTitles(
            //               showTitles: false,
            //             ),
            //           ),
            //           leftTitles: AxisTitles(
            //             sideTitles: SideTitles(
            //               showTitles: true,
            //               reservedSize: 30,
            //               interval: 65000,
            //               getTitlesWidget: (value, meta) {
            //                 return Text(
            //                   "₹${value.toInt().toString()}",
            //                   style: TextStyle(
            //                       color: AppColor.fontColor,
            //                       fontSize: 7,
            //                       fontWeight: FontWeight.w500,
            //                       fontFamily: 'Urbanist'),
            //                 );
            //               },
            //             ),
            //             drawBelowEverything: true,
            //           ),
            //           bottomTitles: AxisTitles(
            //               sideTitles: SideTitles(
            //                 showTitles: true,
            //                 getTitlesWidget: (value, meta) {
            //                   final months = [
            //                     'Salaries',
            //                     'Marketing',
            //                     'Utilities',
            //                     'Office Supplies',
            //                     'Travel',
            //                     'Other',
            //                   ];
            //                   return Column(
            //                     children: [
            //                       SizedBox(
            //                         height: 10,
            //                       ),
            //                       Text(
            //                         months[value.toInt() % 12],
            //                         style: TextStyle(
            //                             color: Color(0xFF808D9E),
            //                             fontSize: 8,
            //                             fontWeight: FontWeight.w500,
            //                             fontFamily: 'Urbanist'),
            //                       ),
            //                     ],
            //                   );
            //                 },
            //               )),
            //         ),
            //         baselineY: 0.5,
            //         maxY:130000,
            //         gridData: FlGridData(
            //           show: true,
            //           verticalInterval: 65000,
            //           horizontalInterval: 65000,
            //           getDrawingHorizontalLine: (value) {
            //             return FlLine(
            //                 color: Color(0xFFB1B1B1),
            //                 strokeWidth: 0.5
            //             );
            //           },
            //           drawVerticalLine: false,
            //         ),
            //         borderData: FlBorderData(
            //             show: true,
            //             border: Border.all(
            //               color: Colors.transparent,
            //             )
            //         ),
            //       ),
            //     ),
            //   )
            // ),
            ],
          ),
        ),
      ),
    );
  }


  List<BarChartGroupData> _createBarGroups() {
    return [
      _createBarChartGroupData(0, -15000, 'Salaries'),
      _createBarChartGroupData(1, -20000, 'Marketing'),
      _createBarChartGroupData(2, 5000, 'Utilities'),
      _createBarChartGroupData(3, 2000, 'Office Supplies'),
      _createBarChartGroupData(4, -10000, 'Travel'),
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


import 'package:cfo_app/components/common_button.dart';
import 'package:cfo_app/utils/colors.dart';
import 'package:cfo_app/utils/images.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/chart.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/style.dart';
import '../../../routes/app_pages.dart';
import '../../ar_with_credit_balance/controller/ar_with_credit_balance_controller.dart';
import '../../dashBoard/controllers/dash_board_controller.dart';
import '../controllers/cash_flow_controller.dart';

class CashFlowScreen extends StatefulWidget {
  const CashFlowScreen({super.key});

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen> {

  CashflowController cashflowController = Get.put(CashflowController());
  DashBoardController dashBoardController = DashBoardController();
  ArWithCreditBalanceController arWithCreditBalanceController = Get.put(ArWithCreditBalanceController());

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
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Cash Flow',
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
      body: Obx(() => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: AppColor.backgroundColors,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          cashflowController.toggleColor(1);
                          cashflowController.lastWeekApi();
                        },
                        color: cashflowController.buttonColor1.value,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            width: 1,
                            color: AppColor.txtSecondaryColor,
                          ),
                        ),
                        child: Text(
                          'Last Week',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            color: cashflowController.buttonSelect.value == 1
                                ? AppColor.whiteColor
                                : AppColor.txtSecondaryColor,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cashflowController.toggleColor(2);
                          cashflowController.lastMonthApi();
                        },
                        color: cashflowController.buttonColor2.value,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            width: 1,
                            color: AppColor.txtSecondaryColor,
                          ),
                        ),
                        child: Text(
                          'Last Month',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            color: cashflowController.buttonSelect.value == 2
                                ? AppColor.whiteColor
                                : AppColor.txtSecondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: TextFormField(
                          // onFieldSubmitted: onFieldSubmit,
                          // validator: validator,
                          // maxLines: linesShow,
                          onTap: () {
                            cashflowController.toggleColor(3);
                            cashflowController.calendarOpen(
                              context,
                            );
                          },
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191A26),
                          ),
                          textInputAction: TextInputAction.done,
                          controller: cashflowController.dateController,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xFF242B42),
                          cursorWidth: 1.5,
                          decoration: InputDecoration(
                            hintText: 'Custom',
                            floatingLabelStyle: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7E8CA0),
                            ),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7E8CA0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color:
                                      cashflowController.buttonSelect.value == 3
                                          ? AppColor.primaryColor
                                          : AppColor.txtSecondaryColor,
                                  width: 1),
                            ),
                          ),
                        ),
                      ),
                      ///
                      // MaterialButton(
                      //   onPressed: () {
                      //     cashflowController.toggleColor(3);
                      //   },
                      //   color: cashflowController.buttonColor3.value,
                      //   elevation: 0,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(5),
                      //     side: BorderSide(
                      //       width: 1,
                      //       color: AppColor.txtSecondaryColor,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Custom',
                      //         style: TextStyle(
                      //           fontSize: 14,
                      //           fontFamily: 'Urbanist',
                      //           fontWeight: FontWeight.w500,
                      //           color:
                      //               cashflowController.buttonSelect.value == 3
                      //                   ? AppColor.whiteColor
                      //                   : AppColor.txtSecondaryColor,
                      //         ),
                      //       ),
                      //       Icon(
                      //         Icons.arrow_drop_down_sharp,
                      //         color: cashflowController.buttonSelect.value == 3
                      //             ? AppColor.whiteColor
                      //             : AppColor.txtSecondaryColor,
                      //         size: 30,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Summary",
                    style: TextHeader,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 125,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Opening Bank Balance',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor,
                                )),
                            Text(
                              "₹17,123",
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Urbanist'),
                            ),
                            Text('05-June-2024',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor,
                                )),
                          ],
                        ),
                        Image.asset(
                          ProjectImages.rupee_cash_flow,
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Inflow/Outflow",
                    style: TextHeader,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColor.primaryColor, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_downward_sharp,
                              size: 35,
                              color: Colors.green,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash Inflow',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.fontColor,
                                  ),
                                ),
                                Obx(() => Text(
                                      cashflowController.creditors_amount.value,
                                      // "₹15,000",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          child: const VerticalDivider(
                            color: Color(0xffd1d1d1),
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward_sharp,
                              size: 35,
                              color: Colors.red,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash Outflow',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.fontColor,
                                  ),
                                ),
                                //
                                Obx(() => Text(
                                      cashflowController.debtors_amount.value,
                                      // "₹15,000",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Current Cashflow - ",
                        style: TextHeader,
                      ),
                      Obx(
                        () => Text(
                          cashflowController.total_amount.value,
                          // "₹15,000",
                          style: TextHeader,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Past Trend Analysis",
                        style: TextHeader,
                      ),
                      CommonTextField(
                        ontap: () {
                          cashflowController.pickDateRangePastTrend(context);
                        },
                        preShow: 'Not',
                        width: MediaQuery.of(context).size.width * 0.40,
                        lableText: 'Select Date',
                        controllers: cashflowController.pastdateRangeController,
                        keyboardTypes: TextInputType.name,
                        prefixIcon: ProjectImages.mail,
                      ),
                      // DropDownField(
                      //   onChanged: (String? newValue) {
                      //     cashflowController.showday.value = newValue!;
                      //   },
                      //   selectValue: cashflowController.showday.value,
                      //   hintName: 'show',
                      //   width: MediaQuery.of(context).size.width * 0.34,
                      //   height: 40,
                      //   selectPriceInstallment: cashflowController.dayList,
                      //   controller: cashflowController.daysController,
                      //   showBorder: '0',
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() =>
                      Container(
                        height: 132,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            barGroups: cashflowController.cashInPercentages
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
                                      'Office',
                                      'Travel',
                                      'Other',
                                      'Salaries',
                                      'Marketing',
                                      'Utilities',
                                      'Office',
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
                                              fontSize: 5,
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
                  ),

                  ///only design
                  // Container(
                  //   height: 200,
                  //   child: LineChart(
                  //     LineChartData(
                  //       extraLinesData: ExtraLinesData(
                  //         extraLinesOnTop: true,
                  //         verticalLines: [
                  //           VerticalLine(
                  //             x: cashflowController.dividerPosition.value,
                  //             color: Colors.green,
                  //             strokeWidth: 2,
                  //             dashArray: [4, 2],
                  //             label: VerticalLineLabel(
                  //               show: true,
                  //               alignment: Alignment.topRight,
                  //               style: const TextStyle(
                  //                 color: Colors.green,
                  //                 fontSize: 12,
                  //               ),
                  //               labelResolver: (line) {
                  //                 return '${cashflowController.dividerPosition.value.toStringAsFixed(1)}';
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
                  // ),
                  ///perfect
                  // Obx(() {
                  //   if (cashflowController.creditorSpots.isEmpty ||
                  //       cashflowController.debtorSpots.isEmpty) {
                  //     return Center(child: CircularProgressIndicator());
                  //   }
                  //
                  //   // Create separate lists for creditor and debtor dates
                  //   List<String> creditorDates =
                  //       List.from(cashflowController.dates);
                  //   List<String> debtorDates =
                  //       List.from(cashflowController.debtordates);
                  //
                  //   return Container(
                  //     height: 300, // Increased height for better visualization
                  //     child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: SizedBox(
                  //         width: (creditorDates.length + debtorDates.length) *
                  //             50.0, // Adjust width based on the number of dates
                  //         child: LineChart(
                  //           LineChartData(
                  //
                  //             extraLinesData: ExtraLinesData(
                  //               extraLinesOnTop: true,
                  //               verticalLines: [
                  //                 VerticalLine(
                  //                   x: cashflowController.dividerPosition.value,
                  //                   color: Colors.green,
                  //                   strokeWidth: 2,
                  //                   dashArray: [4, 2],
                  //                   label: VerticalLineLabel(
                  //                     show: true,
                  //                     alignment: Alignment.topRight,
                  //                     style: const TextStyle(
                  //                       color: Colors.green,
                  //                       fontSize: 12,
                  //                     ),
                  //                     labelResolver: (line) {
                  //                       return '${cashflowController.crBalance.value.toStringAsFixed(1)}'; // Show balance
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
                  //                   reservedSize:
                  //                       40, // Adjust reserved size to make space for titles
                  //                   interval: 1, // Show every date
                  //                   getTitlesWidget: (value, meta) {
                  //                     int index = value.toInt();
                  //                     if (index < 0 ||
                  //                         index >=
                  //                             cashflowController.dates.length) {
                  //                       return const SizedBox
                  //                           .shrink(); // Return an empty widget for out-of-bounds index
                  //                     }
                  //                     if (index < 0 ||
                  //                         index >=
                  //                             cashflowController.debtordates.length) {
                  //                       return const SizedBox
                  //                           .shrink(); // Return an empty widget for out-of-bounds index
                  //                     }
                  //
                  //                     String debtorDates =
                  //                         cashflowController.debtordates[index];
                  //                     String creditorDates =
                  //                         cashflowController.dates[index];
                  //                     return SideTitleWidget(
                  //                       space: 0, // Adjust space for better separation
                  //                       axisSide: meta.axisSide,
                  //                       child: Column(
                  //                         children: [
                  //                           Text(
                  //                             debtorDates, // Show date only for debtors
                  //                             style: TextStyle(
                  //                               fontSize: 8,
                  //                               fontWeight: FontWeight.bold,
                  //                               color: Colors
                  //                                   .red, // Color for debtor dates
                  //                             ),
                  //                             textAlign: TextAlign
                  //                                 .center, // Align the text to center for better appearance
                  //                           ),
                  //                           SizedBox(
                  //                               height:
                  //                                   5), // Space between dates
                  //                           Text(
                  //                             creditorDates, // Show date only for creditors
                  //                             style: TextStyle(
                  //                               fontSize: 8,
                  //                               fontWeight: FontWeight.bold,
                  //                               color: Colors
                  //                                   .green, // Color for creditor dates
                  //                             ),
                  //                             textAlign: TextAlign
                  //                                 .center, // Align the text to center for better appearance
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //               leftTitles: AxisTitles(
                  //                 sideTitles: SideTitles(
                  //                   showTitles: false,
                  //                 ),
                  //               ),
                  //               rightTitles: AxisTitles(
                  //                 sideTitles: SideTitles(showTitles: false),
                  //               ),
                  //               topTitles: AxisTitles(
                  //                 sideTitles: SideTitles(showTitles: false),
                  //               ),
                  //             ),
                  //             lineBarsData: [
                  //               LineChartBarData(
                  //                 spots: cashflowController.creditorSpots,
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
                  //                 spots: cashflowController.debtorSpots,
                  //                 isCurved: true,
                  //                 color: Colors.red,
                  //                 barWidth: 2,
                  //                 isStrokeCapRound: true,
                  //                 dotData: const FlDotData(show: false),
                  //                 belowBarData: BarAreaData(
                  //                   show: true,
                  //                   color: Colors.red.withOpacity(0.3),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }),
                  // Obx(() {
                  //   if (
                  //   cashflowController.creditorSpots.isEmpty ||
                  //       cashflowController.debtorSpots.isEmpty) {
                  //     return const Center(child: CircularProgressIndicator());
                  //   }
                  //
                  //   // Create separate lists for creditor and debtor dates
                  //   List<String> creditorDates = List.from(cashflowController.dates);
                  //   List<String> debtorDates = List.from(cashflowController.debtordates);
                  //
                  //   return Container(
                  //     height: 300, // Increased height for better visualization
                  //     child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: SizedBox(
                  //         width: (creditorDates.length + debtorDates.length) * 50.0, // Adjust width based on the number of dates
                  //         child: LineChart(
                  //           LineChartData(
                  //             extraLinesData: ExtraLinesData(
                  //               extraLinesOnTop: true,
                  //               verticalLines: [
                  //                 VerticalLine(
                  //                   x: cashflowController.dividerPosition.value,
                  //                   color: Colors.green,
                  //                   strokeWidth: 2,
                  //                   dashArray: [4, 2],
                  //                   label: VerticalLineLabel(
                  //                     show: true,
                  //                     alignment: Alignment.topRight,
                  //                     style: const TextStyle(
                  //                       color: Colors.green,
                  //                       fontSize: 12,
                  //                     ),
                  //                     labelResolver: (line) {
                  //                       // Calculate the closest amount based on the vertical line position
                  //                       double closestAmount = 0.0;
                  //                       int index = line.x.toInt();
                  //
                  //                       if (index >= 0 && index < cashflowController.creditorSpots.length) {
                  //                         closestAmount = cashflowController.creditorSpots[index].y;
                  //                       } else if (index >= 0 && index < cashflowController.debtorSpots.length) {
                  //                         closestAmount = cashflowController.debtorSpots[index].y;
                  //                       }
                  //
                  //                       return '${closestAmount.toStringAsFixed(1)}'; // Show the closest balance
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
                  //                   reservedSize: 40, // Adjust reserved size to make space for titles
                  //                   interval: 1, // Show every date
                  //                   getTitlesWidget: (value, meta) {
                  //                     int index = value.toInt();
                  //                     if (index < 0 || index >= cashflowController.dates.length) {
                  //                       return const SizedBox.shrink(); // Return an empty widget for out-of-bounds index
                  //                     }
                  //
                  //                     String debtorDate = cashflowController.debtordates[index];
                  //                     String creditorDate = cashflowController.dates[index];
                  //                     return SideTitleWidget(
                  //                       space: 0, // Adjust space for better separation
                  //                       axisSide: meta.axisSide,
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.only(left: 50),
                  //                         child: Column(
                  //                           children: [
                  //                             Text(
                  //                               debtorDate, // Show date only for debtors
                  //                               style: const TextStyle(
                  //                                 fontSize: 8,
                  //                                 fontWeight: FontWeight.bold,
                  //                                 color: Colors.red, // Color for debtor dates
                  //                               ),
                  //                               textAlign: TextAlign.center, // Align the text to center for better appearance
                  //                             ),
                  //                             const SizedBox(height: 5), // Space between dates
                  //                             Text(
                  //                               creditorDate, // Show date only for creditors
                  //                               style: const TextStyle(
                  //                                 fontSize: 8,
                  //                                 fontWeight: FontWeight.bold,
                  //                                 color: Colors.green, // Color for creditor dates
                  //                               ),
                  //                               textAlign: TextAlign.center, // Align the text to center for better appearance
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //               leftTitles: const AxisTitles(
                  //                 sideTitles: SideTitles(
                  //                   showTitles: false,
                  //                 ),
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
                  //                 spots: cashflowController.creditorSpots,
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
                  //                 spots: cashflowController.debtorSpots,
                  //                 isCurved: true,
                  //                 color: Colors.red,
                  //                 barWidth: 2,
                  //                 isStrokeCapRound: true,
                  //                 dotData: const FlDotData(show: false),
                  //                 belowBarData: BarAreaData(
                  //                   show: true,
                  //                   color: Colors.red.withOpacity(0.3),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonButton(
                      text: 'View',
                      color: AppColor.primaryColor,
                      textcolor: Colors.white,
                      ontap: (){
                        Get.toNamed(Routes.CASHFLOWSTATEMENT);
                        // Get.toNamed(Routes.TRENDS);
                      },
                      height: 45,
                      width: MediaQuery.of(context).size.width
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  cashflowController.creditorsList.isEmpty?
                  const Text(''):
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              // onTap: () => cashflowController.selectValue("AR"),
                              onTap: () {
                                cashflowController.selectValue("AR");
                                cashflowController.isViewingCreditors.value =
                                    true;
                              },
                              child: Container(
                                width: 160,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: cashflowController
                                                .selectedValue.value ==
                                            "AR"
                                        ? AppColor.primaryColor
                                        : AppColor.whiteColor),
                                child: Center(
                                  child: Text(
                                    "AR",
                                    style: TextStyle(
                                        color: cashflowController
                                                    .selectedValue.value ==
                                                "AR"
                                            ? AppColor.whiteColor
                                            : AppColor.fontColor,
                                        fontSize: 16,
                                        fontWeight: cashflowController
                                                    .selectedValue.value ==
                                                "AR"
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              // onTap: () => cashflowController.selectValue("AP"),
                              onTap: () {
                                cashflowController.selectValue("AP");
                                cashflowController.isViewingCreditors.value =
                                    false;
                              },
                              child: Container(
                                width: 160,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: cashflowController
                                                .selectedValue.value ==
                                            "AP"
                                        ? AppColor.primaryColor
                                        : AppColor.whiteColor),
                                child: Center(
                                  child: Text(
                                    "AP",
                                    style: TextStyle(
                                        color: cashflowController
                                                    .selectedValue.value ==
                                                "AP"
                                            ? AppColor.whiteColor
                                            : AppColor.fontColor,
                                        fontSize: 16,
                                        fontWeight: cashflowController
                                                    .selectedValue.value ==
                                                "AP"
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        cashflowController.creditorsList.isEmpty?
                            const Text(''):
                        Obx(() {
                          final isViewingCreditors =
                              cashflowController.isViewingCreditors.value;
                          final data = isViewingCreditors
                              ? cashflowController.creditorsList
                              : cashflowController.debtorsList;
                          final amountData = isViewingCreditors
                              ? cashflowController.creditorsAmountList
                              : cashflowController.debtorsAmountList;
                          final dueDate = isViewingCreditors
                              ? cashflowController.creditorsdueDateList
                              : cashflowController.debtordueDateList;
                          final lastpaymentDate = isViewingCreditors
                              ? cashflowController.creditorslastPaymentDate
                              : cashflowController.debtorlastPaymentDate;
                          final invoiceIds = isViewingCreditors
                              ? cashflowController.creditorInvoiceIds
                              : cashflowController.debtorInvoiceIds;
                          final allCreditorDebtor = isViewingCreditors
                              ? cashflowController.allCreditor
                              : cashflowController.allDebtor;
                          return ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              // print('allCreditorDebtor: ${allCreditorDebtor[index]}');
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 16),
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(Routes.INVOICE_DETAILS,
                                    //     arguments: {
                                    //       'userName': data[index],
                                    //       'crBalance': amountData[index],
                                    //       'paymentDate':
                                    //           '01-06-2024', // Replace with actual date if available
                                    //       'whichDetail': isViewingCreditors
                                    //           ? 'Creditor Details'
                                    //           : 'Debtor Details',
                                    //     });
                                    Get.toNamed(Routes.INVOICE_DETAILS,
                                        arguments: {
                                          'userName': data[index],
                                          'crBalance': amountData[index],
                                          'paymentDate': lastpaymentDate[index], // Replace with actual date if available
                                          'whichDetail': isViewingCreditors
                                              ? 'Creditor Details'
                                              : 'Debtor Details',
                                          'due_date': dueDate[index],
                                          'invoiceId': invoiceIds[index],
                                          "creditor": allCreditorDebtor[index],
                                        });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (index % 4 == 0)
                                        Image.asset(
                                          ProjectImages.a_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index % 4 == 1)
                                        Image.asset(
                                          ProjectImages.b_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index % 4 == 2)
                                        Image.asset(
                                          ProjectImages.c_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index % 4 == 3)
                                        Image.asset(
                                          ProjectImages.a_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      Text(
                                        data[index],
                                        style: TextStyle(
                                          color: AppColor.fontColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Urbanist',
                                        ),
                                      ),
                                      Text(
                                        amountData[index],
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Urbanist',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                        // ListView.builder(
                        //   itemCount: cashflowController.Debitors$credtors.length,
                        //   shrinkWrap: true,
                        //   padding: EdgeInsets.zero,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index) {
                        //     return Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 18.0, vertical: 16),
                        //       child: InkWell(
                        //         onTap: () {
                        //           // Get.toNamed(Routes.INVOICE_DETAILS,
                        //           //     arguments: {
                        //           //       'userName': cashflowController
                        //           //           .Debitors$credtors[index],
                        //           //       'crBalance': cashflowController
                        //           //           .DebitorscredtorsAmount[index],
                        //           //       'paymentDate': '01-06-2024',
                        //           //       'whichDetail': cashflowController
                        //           //                   .selectedValue.value ==
                        //           //               'AR'
                        //           //           ? 'Debtor Details'
                        //           //           : 'Creditor Details',
                        //           //     });
                        //         },
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             if (index == 0)
                        //               Image.asset(
                        //                 ProjectImages.a_category,
                        //                 height: 25,
                        //                 width: 25,
                        //               ),
                        //             if (index == 1)
                        //               Image.asset(
                        //                 ProjectImages.b_category,
                        //                 height: 25,
                        //                 width: 25,
                        //               ),
                        //             if (index == 2)
                        //               Image.asset(
                        //                 ProjectImages.c_category,
                        //                 height: 25,
                        //                 width: 25,
                        //               ),
                        //             if (index == 3)
                        //               Image.asset(
                        //                 ProjectImages.a_category,
                        //                 height: 25,
                        //                 width: 25,
                        //               ),
                        //             Text(
                        //               "${cashflowController.Debitors$credtors[index]}",
                        //               style: TextStyle(
                        //                   color: AppColor.fontColor,
                        //                   fontSize: 16,
                        //                   fontWeight: FontWeight.w400,
                        //                   fontFamily: 'Urbanist'),
                        //             ),
                        //             Text(
                        //               "${cashflowController.DebitorscredtorsAmount[index]}",
                        //               style: TextStyle(
                        //                   color: AppColor.blackColor,
                        //                   fontSize: 15,
                        //                   fontWeight: FontWeight.w500,
                        //                   fontFamily: 'Urbanist'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        const SizedBox(
                          height: 12,
                        ),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: InkWell(
                        //     onTap: () {
                        //       cashflowController.selectedValue.value == 'AP'
                        //           ? Get.toNamed(Routes.ALL_CREDITOR,
                        //               arguments: {'whichUser': 'All Creditors'})
                        //           : Get.toNamed(Routes.ALL_CREDITOR,
                        //               arguments: {'whichUser': 'All Debitors'});
                        //       // Get.toNamed(Routes.TOP_DEBTORS_CREDITORS);
                        //     },
                        //     child: const Text(
                        //       "View All",
                        //       style: TextStyle(
                        //           color: Color(0xFF7E8CA0),
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w600,
                        //           fontFamily: 'Urbanist'),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 12,
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Anticipated Fund Flow",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColor.boxblueColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist',
                              color: AppColor.blackColor),
                        ),
                        Text(
                          'Expected Inflow',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist',
                              color: AppColor.blackColor),
                        ),
                        Text(
                          'Expected Outflow',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist',
                              color: AppColor.blackColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '01-08-2024',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        // "₹2,0000                   ",
                        "${cashflowController.creditors_amount.value}                  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        "${cashflowController.debtors_amount.value}              ",
                        // '₹15,0000      ',
                        style:  const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budgeted Cashflow",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      CommonTextField(
                        ontap: () {
                          cashflowController.pickDateRange(context);
                        },
                        preShow: 'Not',
                        width: MediaQuery.of(context).size.width * 0.40,
                        lableText: 'Select Date',
                        controllers: cashflowController.dateRangeController,
                        keyboardTypes: TextInputType.name,
                        prefixIcon: ProjectImages.mail,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextField(
                    ontap: () {},
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width,
                    lableText: 'No of Days Receipt',
                    controllers: cashflowController.numberofdaysReceiptController,
                    keyboardTypes: TextInputType.number,
                    prefixIcon: ProjectImages.mail,
                  ),
                  // const Text(
                  //   "No of Days Receipt",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       fontFamily: 'Urbanist',
                  //       color: Colors.grey),
                  // ),
                  // const Divider(
                  //   color: Color(0xffd1d1d1),
                  //   thickness: 1,
                  // ),
                  CommonTextField(
                    ontap: () {},
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width,
                    lableText: 'No of Days Payment',
                    controllers:
                        cashflowController.numberofdaysPaymentController,
                    keyboardTypes: TextInputType.number,
                    prefixIcon: ProjectImages.mail,
                  ),
                  // const Text(
                  //   "No of Days Payment",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       fontFamily: 'Urbanist',
                  //       color: Colors.grey),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Budgeted Cashflow",
                                style: TextStyle(
                                    color: AppColor.fontColor,
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Urbanist'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF48BD69)),
                                  ),
                                  Text(
                                    "Cash In",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Urbanist'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF139939)),
                                  ),
                                  Text(
                                    "Cash Out",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Urbanist'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF008224)),
                                  ),
                                  Text(
                                    "Net Cash",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CashFlowChart(
                            cashIn: cashflowController.cashIn,
                            cashOut: cashflowController.cashOut,
                            highestAmount: cashflowController.highestAmount.value,
                            lowestAmount: cashflowController.lowestAmount.value,
                            // cashIn: [100000,
                            //   120000,
                            //   90000,
                            //   150000,
                            //   600000,
                            //   140000,
                            //   130000,
                            //   170000,
                            //   180000,
                            //   200000,
                            //   190000,
                            //   210000],
                            // cashOut:[
                            //     -50000,
                            //     -70000,
                            //     -40000,
                            //     -80000,
                            //     -90000,
                            //     -60000,
                            //     -70000,
                            //     -90000,
                            //     -10000,
                            //     -120000,
                            //     -110000,
                            //     -130000
                            // ],
                          ),
                        ],
                      )),
                    const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Trend Analysis",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (cashflowController.creditorSpots.isEmpty || cashflowController.debtorSpots.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Create separate lists for creditor and debtor dates
                    List<String> creditorDates = List.from(cashflowController.dates);
                    List<String> debtorDates = List.from(cashflowController.debtordates);

                    return Container(
                      height: 300, // Increased height for better visualization
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: (creditorDates.length + debtorDates.length) * 50.0, // Adjust width based on the number of dates
                          child: LineChart(
                            LineChartData(
                              extraLinesData: ExtraLinesData(
                                extraLinesOnTop: true,
                                verticalLines: [
                                  VerticalLine(
                                    x: cashflowController.dividerPosition.value,
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
                                        // Calculate the closest amount based on the vertical line position
                                        double closestAmount = 0.0;
                                        int index = line.x.toInt();

                                        if (index >= 0 && index < cashflowController.creditorSpots.length) {
                                          closestAmount = cashflowController.creditorSpots[index].y;
                                        } else if (index >= 0 && index < cashflowController.debtorSpots.length) {
                                          closestAmount = cashflowController.debtorSpots[index].y;
                                        }

                                        return '${closestAmount.toStringAsFixed(1)}'; // Show the closest balance
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40, // Adjust reserved size to make space for titles
                                    interval: 1, // Show every date
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();
                                      if (index < 0 || index >= cashflowController.dates.length) {
                                        return const SizedBox.shrink(); // Return an empty widget for out-of-bounds index
                                      }

                                      String debtorDate = cashflowController.debtordates[index];
                                      String creditorDate = cashflowController.dates[index];
                                      return SideTitleWidget(
                                        space: 0, // Adjust space for better separation
                                        axisSide: meta.axisSide,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 50),
                                          child: Column(
                                            children: [
                                              Text(
                                                debtorDate, // Show date only for debtors
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red, // Color for debtor dates
                                                ),
                                                textAlign: TextAlign.center, // Align the text to center for better appearance
                                              ),
                                              const SizedBox(height: 5), // Space between dates
                                              Text(
                                                creditorDate, // Show date only for creditors
                                                style:const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green, // Color for creditor dates
                                                ),
                                                textAlign: TextAlign.center, // Align the text to center for better appearance
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                rightTitles:const  AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: cashflowController.creditorSpots,
                                  isCurved: true,
                                  color: Colors.green,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.green.withOpacity(0.3),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: cashflowController.debtorSpots,
                                  isCurved: true,
                                  color: Colors.red,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.red.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fixed Payment and Receipts",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Rent",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      const Text(
                        '₹2,000/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Salary",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      const Text(
                        '₹5,000/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Utility Bills",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      const Text(
                        '₹5,00/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Bank Interest",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                                color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      const Text(
                        '₹2,00/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../components/chart.dart';
// import '../../../../components/common_app_bar.dart';
// import '../../../../components/dropdown_field.dart';
// import '../../../../utils/colors.dart';
// import '../../../../utils/images.dart';
// import '../controller/expense_variace_controller.dart';
//
// class ExpenseVariancesView extends StatelessWidget {
//
//
//
//   final List<double> cashIn = [
//     108942,
//     76620,
//     13096,
//     30000,
//     40389,
//     55692,
//   ];
//
//   ExpenseVarianceController expenseVarianceController = Get.put(ExpenseVarianceController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: 'Expense Variances',
//         automaticallyImplyLeading: false,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Image.asset(
//             ProjectImages.arrow_left,
//             height: 25,
//             width: 25,
//           ),
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         color: AppColor.backgroundColors,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Expense Variances',
//                   style: TextStyle(
//                     color: AppColor.blackColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//                 DropDownField(
//                   onChanged: (String? newValue) {
//                     expenseVarianceController.showday.value = newValue!;
//                   },
//                   selectValue: expenseVarianceController.showday.value,
//                   hintName: 'show',
//                   width: MediaQuery.of(context).size.width * 0.40,
//                   height: 45,
//                   selectPriceInstallment:
//                   expenseVarianceController.dayList,
//                   controller: expenseVarianceController.daysController,
//                   showBorder: '0',
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Text(
//                   'Total Budgeted Expenses: ',
//                   style: TextStyle(
//                     color: AppColor.blackColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//                 Text(
//                   '₹500,000',
//                   style: TextStyle(
//                     color: AppColor.primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Text(
//                   'Total Actual Expenses: ',
//                   style: TextStyle(
//                     color: AppColor.blackColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//                 Text(
//                   '₹550,000',
//                   style: TextStyle(
//                     color: AppColor.primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Text(
//                   'Total Variance: ',
//                   style: TextStyle(
//                     color: AppColor.blackColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//                 Text(
//                   '₹50,000',
//                   style: TextStyle(
//                     color: AppColor.primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     fontFamily: 'Urbanist',
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Container(
//               height: 132,
//               child: BarChart(
//                 BarChartData(
//                   alignment: BarChartAlignment.spaceAround,
//                   barGroups: cashIn
//                       .asMap()
//                       .entries
//                       .map(
//                         (e) => BarChartGroupData(
//                       groupVertically: true,
//                       x: e.key,
//                       barRods: [
//                         BarChartRodData(
//                           borderRadius: BorderRadius.circular(3),
//                           toY: e.value,
//                           color: Color(0xFF48BD69),
//                           width: 11,
//                         ),
//                       ],
//                     ),
//                   ).toList(),
//                   titlesData: FlTitlesData(
//                     rightTitles:
//                     AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: false,
//                       ),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 30,
//                         interval: 65000,
//                         getTitlesWidget: (value, meta) {
//                           return Text(
//                             "₹${value.toInt().toString()}",
//                             style: TextStyle(
//                                 color: AppColor.fontColor,
//                                 fontSize: 7,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Urbanist'),
//                           );
//                         },
//                       ),
//                       drawBelowEverything: true,
//                     ),
//                     bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           getTitlesWidget: (value, meta) {
//                             final months = [
//                               'Salaries',
//                               'Marketing',
//                               'Utilities',
//                               'Office Supplies',
//                               'Travel',
//                               'Other',
//                             ];
//                             return Column(
//                               children: [
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   months[value.toInt() % 12],
//                                   style: TextStyle(
//                                       color: Color(0xFF808D9E),
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.w500,
//                                       fontFamily: 'Urbanist'),
//                                 ),
//                               ],
//                             );
//                           },
//                         )),
//                   ),
//                   baselineY: 0.5,
//                   maxY:130000,
//                   gridData: FlGridData(
//                     show: true,
//                     verticalInterval: 65000,
//                     horizontalInterval: 65000,
//                     getDrawingHorizontalLine: (value) {
//                       return FlLine(
//                           color: Color(0xFFB1B1B1),
//                           strokeWidth: 0.5
//                       );
//                     },
//                     drawVerticalLine: false,
//                   ),
//                   borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(
//                         color: Colors.transparent,
//                       )
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
//       _createBarChartGroupData(0, -15000, 'Salaries'),
//       _createBarChartGroupData(1, -20000, 'Marketing'),
//       _createBarChartGroupData(2, 5000, 'Utilities'),
//       _createBarChartGroupData(3, 2000, 'Office Supplies'),
//       _createBarChartGroupData(4, -10000, 'Travel'),
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class ExpenseVariancesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Cash Flow Statement',
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
              // CFO Section
              _buildSection(
                title: 'Cash Flow From Operations (CFO)',
                icon: Icons.business,
                color: Colors.green,
                items: [
                  'Accounts Receivable',
                  'Accounts Payable',
                  'Income Taxes Payable',
                ],
              ),
              SizedBox(height: 20),
              // CFI Section
              _buildSection(
                title: 'Cash Flow From Investing (CFI)',
                icon: Icons.trending_up,
                color: Colors.blue,
                items: [
                  'Capital Expenditures',
                  'Sale of Long-term Investments',
                ],
              ),
              SizedBox(height: 20),
              // CFF Section
              _buildSection(
                title: 'Cash Flow From Financing (CFF)',
                icon: Icons.monetization_on,
                color: Colors.orange,
                items: [
                  'Payment of Dividends',
                  'Repurchase of Stocks',
                  'Taking out a Loan',
                ],
              ),
              SizedBox(height: 20),
              // Summary
              _buildSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required IconData icon, required Color color, required List<String> items}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,),
            child: Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ],
            ),
          ),
          ...items.map((item) => ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0), // Adjust the horizontal and vertical padding
            dense: true, // Makes the ListTile more compact

            title: Text(item,
              style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
            trailing: Text('₹0.00', style: TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'Urbanist',


            )),
          )),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: TextStyle( color: AppColor.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Urbanist',),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Inflows', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',)),
                Text('₹0.00', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Urbanist',)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Outflows', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',)),
                Text('₹0.00', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Urbanist',)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Net Cash Flow', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Urbanist',)),
                Text('₹0.00', style: TextStyle(color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Urbanist',)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

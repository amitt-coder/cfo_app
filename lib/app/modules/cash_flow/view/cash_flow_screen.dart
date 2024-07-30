import 'package:cfo_app/utils/colors.dart';
import 'package:cfo_app/utils/images.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/chart.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/style.dart';
import '../controllers/cash_flow_controller.dart';

class CashFlowScreen extends StatefulWidget {
  const CashFlowScreen({super.key});

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen> {


  final CashflowController cashflowController = Get.put(CashflowController());

  Widget _buildBottomTitle(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 10:
        text = Text('Nov 10', style: style);
        break;
      case 15:
        text = Text('Nov 15', style: style);
        break;
      case 20:
        text = Text('Nov 20', style: style);
        break;
      case 25:
        text = Text('Nov 25', style: style);
        break;
      case 30:
        text = Text('Nov 30', style: style);
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        },
                        color: cashflowController.buttonColor1.value,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(width: 1, color: AppColor.txtSecondaryColor,),
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
                        },
                        color: cashflowController.buttonColor2.value,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(width: 1, color: AppColor.txtSecondaryColor,),
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
                      MaterialButton(
                        onPressed: () {
                          cashflowController.toggleColor(3);
                        },
                        color: cashflowController.buttonColor3.value,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(width: 1, color: AppColor.txtSecondaryColor,),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Custom',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                color:
                                    cashflowController.buttonSelect.value == 3
                                        ? AppColor.whiteColor
                                        : AppColor.txtSecondaryColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: cashflowController.buttonSelect.value == 3
                                  ? AppColor.whiteColor
                                  : AppColor.txtSecondaryColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Summary",
                    style: TextHeader,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 125,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Inflow/Outflow",
                    style: TextHeader,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColor.primaryColor, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
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
                                Text(
                                  "₹15,000",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          child: VerticalDivider(
                            color: Color(0xffd1d1d1),
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
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
                                Text(
                                  "₹15,000",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Past Trend Analysis",
                        style: TextHeader,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                            // color: Color(0xFFEEEEEE),
                            color: AppColor.boxblueColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Last week",
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                              color: AppColor.blackColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                                labelResolver: (line) {
                                  return '${cashflowController.dividerPosition.value.toStringAsFixed(1)}';
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
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
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
                  SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  SizedBox(
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
                        "₹2,0000                   ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: AppColor.blackColor),
                      ),
                      Text(
                        '₹15,0000      ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Budgeted Cashflow",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No of Days Receipt",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Urbanist',
                        color: Colors.grey),
                  ),
                  Divider(
                    color: Color(0xffd1d1d1),
                    thickness: 1,
                  ),
                  Text(
                    "No of Days Payment",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Urbanist',
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                                    decoration: BoxDecoration(
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
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
                          SizedBox(
                            height: 15,
                          ),
                          CashFlowChart(),
                        ],
                      )),
                  SizedBox(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                                labelResolver: (line) {
                                  return '${cashflowController.dividerPosition.value.toStringAsFixed(1)}';
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
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
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
                  SizedBox(
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
                  SizedBox(
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          SizedBox(
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
                      Text(
                        '₹2,000/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          SizedBox(
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
                      Text(
                        '₹5,000/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          SizedBox(
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
                      Text(
                        '₹5,00/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe1e9f8)),
                          ),
                          SizedBox(
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
                      Text(
                        '₹2,00/month',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

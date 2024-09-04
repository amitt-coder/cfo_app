import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class CashFlowStatementView extends StatelessWidget {
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              // Summary
              _buildSummary(),
            ],

          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required IconData icon,
    required Color color, required List<String> items}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,),
            child: Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 10),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0), // Adjust the horizontal and vertical padding
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
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
            const SizedBox(height: 10),
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
            const Divider(),
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
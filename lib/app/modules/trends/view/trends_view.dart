import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../components/dropdown_field.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';
import '../controller/trends_controller.dart';

class TrendsView extends StatelessWidget {
  // const TrendsView({super.key});
  TrendsController trendsController = Get.put(TrendsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Trend',
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
                    'Trends as Off',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  DropDownField(
                    onChanged: (String? newValue) {
                      trendsController.showday.value = newValue!;
                      // Split the string by spaces and get the second element
                      List<String> splitParts = trendsController.showday.value.split(' ');

                      // Check if the splitParts has at least two elements to avoid index out of range error
                      if (splitParts.length >= 2) {
                        String daysValue = splitParts[1]; // This will be "30" for 'Above 30 days'
                        print('Days: $daysValue'); // Output: Days: 30
                        // arWithCreditBalanceController.filterbyDay(daysValue);
                      } else {
                        print('Invalid day format');
                      }
                    },
                    selectValue: trendsController.showday.value,
                    hintName: 'show',
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 45,
                    selectPriceInstallment: trendsController.dayList,
                    controller: trendsController.daysController,
                    showBorder: '0',
                  ),
                  // CommonTextField(
                  //   ontap: () {
                  //     trendsController.calendarOpen(context);
                  //   },
                  //   preShow: 'Not',
                  //   width: MediaQuery.of(context).size.width * 0.40,
                  //   lableText: 'Select Date',
                  //   controllers: trendsController.dateController,
                  //   keyboardTypes: TextInputType.name,
                  //   prefixIcon: ProjectImages.mail,
                  // ),
                ],
              ),
              SizedBox(height: 15,),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                              Text(
                                'Mohit',
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.CASHFLOWSTATEMENT);
                            },
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trends: ',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                          Text(
                            'One month ago',
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Urbanist',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

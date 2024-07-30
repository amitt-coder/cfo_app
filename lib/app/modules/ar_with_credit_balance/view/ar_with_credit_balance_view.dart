import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class ArWithCreditBalanceView extends StatefulWidget {
  const ArWithCreditBalanceView({super.key});

  @override
  State<ArWithCreditBalanceView> createState() => _ArWithCreditBalanceViewState();
}

class _ArWithCreditBalanceViewState extends State<ArWithCreditBalanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'AR with Credit Balance',
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
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: AppColor.backgroundColors,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Receivables',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1,color: AppColor.txtSecondaryColor)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Next Year',
                          style: TextStyle(
                            color: AppColor.txtSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_sharp,
                          size: 30,color:AppColor.txtSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Text('AR Summary',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Urbanist',
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Total Debit Balance: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('₹50,000',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Number of Creditors: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('10',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text('Debtors List',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily:'Urbanist',
                          color: AppColor.blackColor
                      ),
                    ),
                    Text('Cr.Bal',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily:'Urbanist',
                          color: AppColor.blackColor
                      ),
                    ),Text('L.T Date',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily:'Urbanist',
                          color: AppColor.blackColor
                      ),
                    ),Text('C.info',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily:'Urbanist',
                          color: AppColor.blackColor
                      ),
                    ),

                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(5)
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5)
                          )

                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Debtor 1',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                              Text('₹50,000',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                              Text('01-01-2024',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                              Text('123-4..',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColor.txtSecondaryColor,
                            thickness: 1,
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 15,),
              Text('Debtors Detail',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('Debtor 1',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Total Credit Balance: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('₹5,000',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Last Payment Date: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('01-01-2024',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Due Date: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                        Text('01-31-2024',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Outstanding Invoices: ',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- Invoice #12345: is ₹2,000',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- Due: 01-10-2024',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- Invoice #123456: ₹3,000',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- Due: 01-20-2024',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- Contact info: 123-456-7890',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    Text('- debtor1@gmail.com',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist'
                      ),
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

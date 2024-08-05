import 'package:cfo_app/app/modules/account_payables/controller/account_payables_controller.dart';
import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../components/dropdown_field.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class AccountPayablesView extends StatefulWidget {
  const AccountPayablesView({super.key});

  @override
  State<AccountPayablesView> createState() => _AccountPayablesViewState();
}

class _AccountPayablesViewState extends State<AccountPayablesView> {

  AccountPayablesController accountPayablesController = Get.put(AccountPayablesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Account Payables',
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
                    'Account Payables',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  DropDownField(
                    onChanged: (String? newValue) {
                      accountPayablesController.showday.value = newValue!;
                    },
                    selectValue: accountPayablesController.showday.value,
                    hintName: 'show',
                    width: MediaQuery.of(context).size.width*0.40,
                    height: 45,
                    selectPriceInstallment: accountPayablesController.dayList,
                    controller: accountPayablesController.daysController,
                    showBorder: '0',
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(5),
                  //       border: Border.all(
                  //           width: 1, color: AppColor.txtSecondaryColor)),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Last 30 Days',
                  //         style: TextStyle(
                  //           color: AppColor.txtSecondaryColor,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 16,
                  //           fontFamily: 'Urbanist',
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_drop_down_sharp,
                  //         size: 30,
                  //         color: AppColor.txtSecondaryColor,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'AP Summary',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Credit Balance: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                        Text(
                          '₹40,000',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Number of Creditors: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                        Text(
                          '08',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Creditors List',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  CommonTextField(
                    ontap: (){
                      accountPayablesController.calendarOpen(context);
                    },
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width*0.40,
                    lableText: 'Select Date',
                    controllers:
                    accountPayablesController.dateController,
                    keyboardTypes: TextInputType.name,
                    prefixIcon: ProjectImages.mail,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cat.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'Db.Bal',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'L.P Date',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'C.info',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: accountPayablesController.ItemList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    accountPayablesController.debitor();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // if(index==0)
                                      //   Image.asset(ProjectImages.a_category,
                                      //     height: 25,width: 25,
                                      //   ),
                                      // if(index==1)
                                      //   Image.asset(ProjectImages.b_category,
                                      //     height: 25,width: 25,
                                      //   ),
                                      // if(index==2)
                                      //   Image.asset(ProjectImages.c_category,
                                      //     height: 25,width: 25,
                                      //   ),
                                      // if(index==3 || index==4)
                                        Image.asset(accountPayablesController.ItemList[index].image,
                                          height: 25,width: 25,
                                        ),
                                      Text(
                                        accountPayablesController.ItemList[index].Name,
                                        style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        accountPayablesController.ItemList[index].Db,
                                        style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        accountPayablesController.ItemList[index].LP,
                                        style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        accountPayablesController.ItemList[index].CINFO,
                                        style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: AppColor.txtSecondaryColor,
                                  thickness: 1,
                                ),

                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ALL_CREDITOR, arguments: {'whichUser': 'All Creditors'});
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              color: Color(0xFF7E8CA0),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() =>
              Visibility(
                visible: accountPayablesController.creditorShow.value,
                child: Text(
                  'Creditor Detail',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                  ),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Obx(() =>
              Visibility(
                visible: accountPayablesController.creditorShow.value,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                          Text(
                            'Mohit',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Debit Balance: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                          Text(
                            '₹5,000',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Last Payment Date: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                          Text(
                            '01-01-2024',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Due Date: ',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist'),
                          ),
                          Text(
                            '01-01-2024',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Outstanding Invoices: ',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- Invoice #12345: is ₹2,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- Due: 01-10-2024',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- Invoice #123456: ₹3,000',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- Due: 01-20-2024',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- Contact info: 123-456-7890',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      Text(
                        '- creditor1@gmail.com',
                        style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Urbanist'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

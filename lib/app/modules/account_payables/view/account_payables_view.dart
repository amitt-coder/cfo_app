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

                      // Split the string by spaces and get the second element
                      List<String> splitParts =
                          accountPayablesController.showday.value.split(' ');

                      // Check if the splitParts has at least two elements to avoid index out of range error
                      if (splitParts.length >= 2) {
                        String daysValue = splitParts[
                            1]; // This will be "30" for 'Above 30 days'
                        print('Days: $daysValue'); // Output: Days: 30
                        accountPayablesController.filterbyDay(daysValue);
                      } else {
                        print('Invalid day format');
                      }
                    },
                    selectValue: accountPayablesController.showday.value,
                    hintName: 'show',
                    width: MediaQuery.of(context).size.width * 0.40,
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
                          // 'Total Credit Balance: ',
                          'Total Debit Balance: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                        Obx(() => Text(
                              // '₹40,000',
                              '₹${accountPayablesController.totalDebitBalance.value}',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Urbanist'),
                            )),
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
                        Obx(() => Text(
                              // accountPayablesController.creditors.length.toString(),
                              accountPayablesController.filteredCreditors.length
                                  .toString(),
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Urbanist'),
                            )),
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
                    'Creditors List as Off',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  CommonTextField(
                    ontap: () {
                      accountPayablesController.showCategory.value = 'Category A';
                      accountPayablesController.calendarOpen(context);
                    },
                    preShow: 'Not',
                    width: MediaQuery.of(context).size.width * 0.40,
                    lableText: 'Select Date',
                    controllers: accountPayablesController.dateController,
                    keyboardTypes: TextInputType.name,
                    prefixIcon: ProjectImages.mail,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    ProjectImages.information_icon,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // DropDownField(
                  //   selectValue: accountPayablesController.showCategory.value,
                  //   hintName: 'Select Category',
                  //   width: MediaQuery.of(context).size.width * 0.35,
                  //   height: 40,
                  //   selectPriceInstallment: accountPayablesController.showCategoryList,
                  //   controller: accountPayablesController.categoryController,
                  //   showBorder: '1',
                  //   onChanged: (value) {
                  //     accountPayablesController.showCategory.value = value!;
                  //     // Split the string by spaces and get the second element
                  //     List<String> splitParts = accountPayablesController
                  //         .showCategory.value
                  //         .split(' ');
                  //
                  //     // Check if the splitParts has at least two elements to avoid index out of range error
                  //     if (splitParts.length >= 2) {
                  //       String categoryValue = splitParts[1];
                  //       print('categoryValue: $categoryValue');
                  //       accountPayablesController.filteredCreditors.clear();
                  //       accountPayablesController.showCategory.value = categoryValue;
                  //       accountPayablesController.filterByCategory();
                  //     } else {
                  //       print('Invalid category');
                  //     }
                  //   },
                  // ),
                  ///
                  DropDownField(
                    selectValue: accountPayablesController.showCategory.value, // Match the exact value from the list
                    hintName: 'Select Category',
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40,
                    selectPriceInstallment: accountPayablesController.showCategoryList, // Ensure these values are ['A', 'B', 'C', etc.]
                    controller: accountPayablesController.categoryController,
                    showBorder: '1',
                    onChanged: (value) {
                      // Ensure 'value' is non-null and exists in the list
                      if (value != null && accountPayablesController.showCategoryList.contains(value)) {
                        accountPayablesController.showCategory.value = value; // Ensure this is only 'A', 'B', or 'C'
                        accountPayablesController.filterByCategory();
                      } else {
                        print('Category not found');
                      }
                    },
                  )



                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (accountPayablesController.filteredCreditors.isEmpty) {
                  return const SizedBox();
                } else {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                  );
                }
              }),
              Obx(() {
                if (accountPayablesController.filteredCreditors.isEmpty) {
                  return const Center(
                    child: Text("Data Not Found",
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.red)),
                  );
                } else {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accountPayablesController.filteredCreditors.length,
                          itemBuilder: (context, index) {
                            var creditor = accountPayablesController.filteredCreditors[index];
                            String category = creditor['category']['category'];
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.INVOICE_DETAILS,
                                          arguments: {
                                            'userName':
                                                accountPayablesController
                                                    .creditors[index]['name'],
                                            'crBalance':
                                                accountPayablesController
                                                        .creditors[index]
                                                    ['total_balance'],
                                            'paymentDate':
                                                accountPayablesController
                                                        .creditors[index]
                                                    ['last_payment_date'],
                                            'due_date':
                                                accountPayablesController
                                                        .creditors[index]
                                                    ['due_date'],
                                            'whichDetail': 'Creditor Details',
                                            "creditor": creditor,
                                            'invoiceId':
                                                accountPayablesController
                                                    .creditors[index]['id']
                                                    .toString(),
                                          });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          accountPayablesController.getImageForCategory(category),
                                          height: 25,
                                          width: 25,
                                        ),
                                        Container(
                                          width: 41,
                                          child: Text(
                                            creditor['name'],
                                            style: TextStyle(
                                                color: AppColor.blackColor,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 45,
                                          child: Text(
                                            creditor['total_balance'],
                                            style: TextStyle(
                                                color: AppColor.blackColor,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          creditor['last_payment_date'],
                                          style: TextStyle(
                                              color: AppColor.blackColor,
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        Container(
                                          width: 40,
                                          child: Text(
                                            creditor['contact_no'],
                                            style: TextStyle(
                                                color: AppColor.blackColor,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ALL_CREDITOR,
                                  arguments: {'whichUser': 'All Creditors'});
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
                  );
                }
              }),

              // Obx(() {
              //   if(accountPayablesController.filteredCreditors.isEmpty){
              //     return SizedBox();
              //   }else{
              //     return Container(
              //       decoration: const BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.only(
              //               bottomRight: Radius.circular(5),
              //               bottomLeft: Radius.circular(5))),
              //       child: Column(
              //         children: [
              //           ListView.builder(
              //             // itemCount: accountPayablesController.ItemList.length,
              //               itemCount: accountPayablesController.creditors.length,
              //               shrinkWrap: true,
              //               padding: EdgeInsets.zero,
              //               physics: const NeverScrollableScrollPhysics(),
              //               itemBuilder: (context, index) {
              //                 var creditor = accountPayablesController.creditors[index];
              //                 String category = creditor['category']['category'];
              //                 print('category: $category');
              //                 return Container(
              //                   padding: const EdgeInsets.symmetric(horizontal: 10),
              //                   child: Column(
              //                     children: [
              //                       const SizedBox(
              //                         height: 5,
              //                       ),
              //                       InkWell(
              //                         onTap: () {
              //                           Get.toNamed(Routes.INVOICE_DETAILS,
              //                               arguments: {
              //                                 'userName':
              //                                 accountPayablesController
              //                                     .creditors[index]['name'],
              //                                 'crBalance':
              //                                 accountPayablesController
              //                                     .creditors[index]
              //                                 ['total_balance'],
              //                                 'paymentDate':
              //                                 accountPayablesController
              //                                     .creditors[index]
              //                                 ['last_payment_date'],
              //                                 'due_date':
              //                                 accountPayablesController
              //                                     .creditors[index]
              //                                 ['due_date'],
              //                                 'whichDetail': 'Creditor Details',
              //                                 "creditor": creditor,
              //                                 'invoiceId':
              //                                 accountPayablesController
              //                                     .creditors[index]['id']
              //                                     .toString(),
              //                               });
              //                         },
              //                         child: Row(
              //                           mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Image.asset(
              //                               accountPayablesController.getImageForCategory(category),
              //                               height: 25,
              //                               width: 25,),
              //                             // if (index % 4 == 0)
              //                             //   Image.asset(
              //                             //     ProjectImages.a_category,
              //                             //     height: 25,
              //                             //     width: 25,
              //                             //   ),
              //                             // if (index % 4 == 1)
              //                             //   Image.asset(
              //                             //     ProjectImages.b_category,
              //                             //     height: 25,
              //                             //     width: 25,
              //                             //   ),
              //                             // if (index % 4 == 2)
              //                             //   Image.asset(
              //                             //     ProjectImages.c_category,
              //                             //     height: 25,
              //                             //     width: 25,
              //                             //   ),
              //                             // if (index % 4 == 3)
              //                             //   Image.asset(
              //                             //     ProjectImages.a_category,
              //                             //     height: 25,
              //                             //     width: 25,
              //                             //   ),
              //                             Container(
              //                               width: 41,
              //                               child: Text(
              //                                 // accountPayablesController.ItemList[index].Name,
              //                                 accountPayablesController.creditors[index]['name'],
              //                                 style: TextStyle(
              //                                     color: AppColor.blackColor,
              //                                     fontFamily: 'Urbanist',
              //                                     fontWeight: FontWeight.w500,
              //                                     fontSize: 15),
              //                                 overflow: TextOverflow.ellipsis,
              //                               ),
              //                             ),
              //                             Container(
              //                               width: 45,
              //                               child: Text(
              //                                 // accountPayablesController.ItemList[index].Db,
              //                                 accountPayablesController.creditors[index]['total_balance'],
              //                                 style: TextStyle(
              //                                     color: AppColor.blackColor,
              //                                     fontFamily: 'Urbanist',
              //                                     fontWeight: FontWeight.w500,
              //                                     fontSize: 15),
              //                                 overflow: TextOverflow.ellipsis,
              //                               ),
              //                             ),
              //                             Text(
              //                               // accountPayablesController.ItemList[index].LP,
              //                               accountPayablesController.creditors[index]['last_payment_date'],
              //                               style: TextStyle(
              //                                   color: AppColor.blackColor,
              //                                   fontFamily: 'Urbanist',
              //                                   fontWeight: FontWeight.w500,
              //                                   fontSize: 15),
              //                             ),
              //                             Container(
              //                               width: 40,
              //                               child: Text(
              //                                 accountPayablesController
              //                                     .creditors[index]
              //                                 ['contact_no'],
              //                                 // accountPayablesController.ItemList[index].CINFO,
              //                                 style: TextStyle(
              //                                     color: AppColor.blackColor,
              //                                     fontFamily: 'Urbanist',
              //                                     fontWeight: FontWeight.w500,
              //                                     fontSize: 15),
              //                                 overflow: TextOverflow.ellipsis,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Divider(
              //                         color: AppColor.txtSecondaryColor,
              //                         thickness: 1,
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               }),
              //           const SizedBox(
              //             height: 5,
              //           ),
              //           Align(
              //             alignment: Alignment.bottomCenter,
              //             child: GestureDetector(
              //               onTap: () {
              //                 Get.toNamed(Routes.ALL_CREDITOR,
              //                     arguments: {'whichUser': 'All Creditors'});
              //               },
              //               child: const Text(
              //                 "View All",
              //                 style: TextStyle(
              //                     color: Color(0xFF7E8CA0),
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w600,
              //                     fontFamily: 'Urbanist'),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             height: 10,
              //           )
              //         ],
              //       ),
              //     );
              //   }
              // } ),
              const SizedBox(
                height: 15,
              ),
              // Obx(() => Visibility(
              //       visible: accountPayablesController.creditorShow.value,
              //       child: Text(
              //         'Creditor Detail',
              //         style: TextStyle(
              //           color: AppColor.blackColor,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 16,
              //           fontFamily: 'Urbanist',
              //         ),
              //       ),
              //     )),
              // const SizedBox(
              //   height: 10,
              // ),
              // Obx(() => Visibility(
              //       visible: accountPayablesController.creditorShow.value,
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 10),
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(5)),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               children: [
              //                 Text(
              //                   'Name: ',
              //                   style: TextStyle(
              //                       color: AppColor.primaryColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w600,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //                 Text(
              //                   'Mohit',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w400,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   'Total Debit Balance: ',
              //                   style: TextStyle(
              //                       color: AppColor.primaryColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w600,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //                 Text(
              //                   '₹5,000',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w400,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   'Last Payment Date: ',
              //                   style: TextStyle(
              //                       color: AppColor.primaryColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w600,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //                 Text(
              //                   '01-01-2024',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w400,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   'Due Date: ',
              //                   style: TextStyle(
              //                       color: AppColor.primaryColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w600,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //                 Text(
              //                   '01-01-2024',
              //                   style: TextStyle(
              //                       color: AppColor.blackColor,
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w400,
              //                       fontFamily: 'Urbanist'),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Outstanding Invoices: ',
              //               style: TextStyle(
              //                   color: AppColor.primaryColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w600,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- Invoice #12345: is ₹2,000',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- Due: 01-10-2024',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- Invoice #123456: ₹3,000',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- Due: 01-20-2024',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- Contact info: 123-456-7890',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             Text(
              //               '- creditor1@gmail.com',
              //               style: TextStyle(
              //                   color: AppColor.blackColor,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   fontFamily: 'Urbanist'),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, Items item) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor: AppColor.backgroundColors,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
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
                    item.Name,
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                  )
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
                    item.Db,
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                  )
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
                    item.LP,
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'C.info: ',
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                  ),
                  Text(
                    item.CINFO,
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist'),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

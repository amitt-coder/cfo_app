import 'package:cfo_app/app/modules/invoice_details/controller/invoice_detail_controller.dart';
import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class InvoiceDetailView extends StatefulWidget {
  String userName = '';
  String crBalance = '';
  String paymentDate = '';
  String whichDetail = '';
  InvoiceDetailView({super.key,
    this.userName = '',
    this.crBalance = '',
    this.paymentDate = '',
    this.whichDetail = '',
  });

  @override
  State<InvoiceDetailView> createState() => _InvoiceDetailViewState();
}

class _InvoiceDetailViewState extends State<InvoiceDetailView> {
  InvoiceDetailController invoiceDetailController =
      Get.put(InvoiceDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Invoice Details',
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
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: 10, horizontal: 10),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           Text(
              //             'Name: ',
              //             style: TextStyle(
              //                 color: AppColor.primaryColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //           Text(
              //             'Vishal',
              //             style: TextStyle(
              //                 color: AppColor.blackColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Total Credit Balance: ',
              //             style: TextStyle(
              //                 color: AppColor.primaryColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //           Text(
              //             '₹50,000',
              //             style: TextStyle(
              //                 color: AppColor.blackColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Last Payment Date: ',
              //             style: TextStyle(
              //                 color: AppColor.primaryColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //           Text(
              //             '01-01-2024',
              //             style: TextStyle(
              //                 color: AppColor.blackColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Due Date: ',
              //             style: TextStyle(
              //                 color: AppColor.primaryColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //           Text(
              //             '01-31-2024',
              //             style: TextStyle(
              //                 color: AppColor.blackColor,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w400,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Text(
              //         'Outstanding Invoices: ',
              //         style: TextStyle(
              //             color: AppColor.primaryColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Invoice #12345: is ₹10,000',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       Text(
              //         '- Due: 01-10-2024',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Invoice #123456: ₹10,000',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       Text(
              //         '- Due: 01-20-2024',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Invoice #123456: ₹10,000',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       Text(
              //         '- Due: 01-22-2024',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Invoice #123456: ₹10,000',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       Text(
              //         '- Due: 01-25-2024',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Invoice #123456: ₹10,000',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       Text(
              //         '- Due: 01-27-2024',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       SizedBox(height: 10,),
              //       Text(
              //         '- Contact info: 123-456-7890',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //
              //       Text(
              //         '- debtor1@gmail.com',
              //         style: TextStyle(
              //             color: AppColor.blackColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             fontFamily: 'Urbanist'),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),

                ],
              ),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoiceDetailController.whichDetail.value,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 15),
                    buildDetailRow(
                        'Name:', invoiceDetailController.userName.value),
                    const SizedBox(height: 10),
                    buildDetailRow(
                        invoiceDetailController.whichDetail.value ==
                                'Creditor Detail'
                            ? 'Total Credit Balance:'
                            : 'Total Debit Balance:',
                        invoiceDetailController.crBalance.value),
                    const SizedBox(height: 10),
                    buildDetailRow('Last Payment Date:',
                        invoiceDetailController.paymentDate.value),
                    const SizedBox(height: 10),
                    buildDetailRow('Due Date:', '01-31-2024'),
                    const SizedBox(height: 15),
                    Text(
                      'Outstanding Invoices:',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildInvoiceList(),
                    const SizedBox(height: 15),
                    buildContactInfo(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Text(
                'Discount',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount Offer',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Row(
                          children: [
                            CommonTextField(
                              onFieldSubmit: (value) {
                                invoiceDetailController.calculateRemainingPrice();
                              },
                              preShow: 'Not',
                              width: MediaQuery.of(context).size.width * 0.20,
                              lableText: 'Offer',
                              controllers: invoiceDetailController.offerController,
                              keyboardTypes: TextInputType.number,
                              prefixIcon: ProjectImages.mail,
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                color: AppColor.txtSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Due',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        invoiceDetailController.amountShow.value == ''
                            ? Text(
                                invoiceDetailController.crBalance.value,
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Urbanist',
                                ),
                              )
                            : Text(
                                invoiceDetailController.amountShow.value,
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                      ],
                    ),
                    // buildDetailRow('Total Due:', "1,000"),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Due Date',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        CommonTextField(
                          ontap: () {
                            invoiceDetailController.calendarOpen(context);
                          },
                          preShow: 'Not',
                          width: MediaQuery.of(context).size.width * 0.40,
                          lableText: 'Select Date',
                          controllers: invoiceDetailController.dateController,
                          keyboardTypes: TextInputType.name,
                          prefixIcon: ProjectImages.mail,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Comment',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLines: 4,
                textInputAction: TextInputAction.done,
                inputFormatters: [LengthLimitingTextInputFormatter(170)],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF191A26),
                ),
                keyboardType: TextInputType.name,
                cursorColor: const Color(0xFF242B42),
                cursorWidth: 1.5,
                decoration: InputDecoration(
                  hintText: 'Comment...',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7E8CA0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.txtSecondaryColor, width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.primaryColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.primaryColor, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.primaryColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.txtSecondaryColor, width: 1),
                  ),
                ),
              ),
             const SizedBox(
                height: 30,
              ),
              CommonButton(
                color: AppColor.primaryColor,
                ontap: () {
                  Get.offAllNamed(Routes.DASH_BOARD);
                },
                height: 45,
                width: double.infinity,
                textcolor: AppColor.whiteColor,
                text: 'Submit',
              ),
              SizedBox(height: 15,),
              CommonButton(
                  text: 'Download Invoice',
                  color:Colors.white,
                  textcolor: AppColor.primaryColor,
                  ontap: () {
                    invoiceDetailController.savePdfToSdCard('Invoice Details');
                  },
                  height: 45,
                  width: MediaQuery.of(context).size.width),
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Urbanist',
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Urbanist',
          ),
        ),
      ],
    );
  }

  Widget buildInvoiceList() {
    final invoices = invoiceDetailController.crBalance.value == '-40,000' ||
            invoiceDetailController.crBalance.value == '+40,000'
        ? [
            {'number': '#12345', 'amount': '₹10,000', 'dueDate': '01-10-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-20-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-22-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-25-2024'},
          ]
        : [
            {'number': '#12345', 'amount': '₹10,000', 'dueDate': '01-10-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-20-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-22-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-25-2024'},
            {'number': '#123456', 'amount': '₹10,000', 'dueDate': '01-27-2024'},
          ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: invoices.map((invoice) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '- Invoice ${invoice['number']}: ${invoice['amount']}',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                ),
              ),
              Text(
                '- Due: ${invoice['dueDate']}',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- Contact info: 123-456-7890',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Urbanist',
          ),
        ),
        Text(
          '- ${invoiceDetailController.userName.value}@gmail.com',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Urbanist',
          ),
        ),
      ],
    );
  }
}

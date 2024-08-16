import 'dart:math';
import 'package:cfo_app/app/routes/app_pages.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_button.dart';
import '../../../../components/common_textformfield.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../controller/financial_projection_controller.dart';

class FinancialProjectionView extends StatefulWidget {
  const FinancialProjectionView({super.key});

  @override
  State<FinancialProjectionView> createState() =>
      _FinancialProjectionViewState();
}

class _FinancialProjectionViewState extends State<FinancialProjectionView> {
  FinancialProjectionController financialProjectionController =
      Get.put(FinancialProjectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Financial Projection',
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
            child: financialProjectionController.thirdCheck.value == false
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        financialProjectionController.firstCheck.value == false
                            ? Row(
                                children: [
                                  Image.asset(
                                    ProjectImages.round,
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                      height: 11,
                                      width: 50,
                                      child: Divider(
                                        color: AppColor.txtSecondaryColor,
                                        thickness: 1,
                                        height: 5,
                                      )),
                                  Image.asset(
                                    ProjectImages.circle_grey,
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                      height: 11,
                                      width: 50,
                                      child: Divider(
                                        color: AppColor.txtSecondaryColor,
                                        thickness: 1,
                                        height: 5,
                                      )),
                                  Image.asset(
                                    ProjectImages.circle_grey,
                                    height: 25,
                                    width: 25,
                                  ),
                                  Container(
                                      height: 11,
                                      width: 50,
                                      child: Divider(
                                        color: AppColor.txtSecondaryColor,
                                        thickness: 1,
                                        height: 5,
                                      )),
                                ],
                              )
                            : financialProjectionController.secondCheck.value ==
                                    true
                                ? Row(
                                    children: [
                                      Image.asset(
                                        ProjectImages.checklist,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                      Image.asset(
                                        ProjectImages.checklist,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                      Image.asset(
                                        ProjectImages.round,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Image.asset(
                                        ProjectImages.checklist,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                      Image.asset(
                                        ProjectImages.round,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                      Image.asset(
                                        ProjectImages.circle_grey,
                                        height: 25,
                                        width: 25,
                                      ),
                                      Container(
                                          height: 11,
                                          width: 50,
                                          child: Divider(
                                            color: AppColor.txtSecondaryColor,
                                            thickness: 1,
                                            height: 5,
                                          )),
                                    ],
                                  ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            financialProjectionController.firstCheck.value ==
                                    false
                                ? Text(
                                    'Fixed Cost',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: 'Urbanist',
                                    ),
                                  )
                                : financialProjectionController
                                            .secondCheck.value ==
                                        true
                                    ? Text(
                                        'Fixed Assest Schedule',
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: 'Urbanist',
                                        ),
                                      )
                                    : Text(
                                        'Variable Cost',
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: 'Urbanist',
                                        ),
                                      ),
                            financialProjectionController.firstCheck.value ==
                                    false
                                ? CommonTextField(
                                    ontap: () {
                                      financialProjectionController
                                          .calendarOpen(
                                        context,
                                      );
                                    },
                                    preShow: 'Not',
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    lableText: 'Select Date',
                                    controllers: financialProjectionController
                                        .dateController,
                                    keyboardTypes: TextInputType.name,
                                    prefixIcon: ProjectImages.mail,
                                  )
                                // Container(
                                //         decoration: BoxDecoration(
                                //             // color: Colors.white,
                                //             borderRadius: BorderRadius.circular(5),
                                //             border: Border.all(
                                //                 width: 1,
                                //                 color: AppColor.txtSecondaryColor)),
                                //         padding: const EdgeInsets.symmetric(
                                //             horizontal: 5, vertical: 3),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.center,
                                //           children: [
                                //             Text(
                                //               'Next Year',
                                //               style: TextStyle(
                                //                 color: AppColor.txtSecondaryColor,
                                //                 fontWeight: FontWeight.w500,
                                //                 fontSize: 16,
                                //                 fontFamily: 'Urbanist',
                                //               ),
                                //             ),
                                //             Icon(
                                //               Icons.arrow_drop_down_sharp,
                                //               size: 30,
                                //               color: AppColor.txtSecondaryColor,
                                //             )
                                //           ],
                                //         ),
                                //       )
                                : const Text('')
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        financialProjectionController.secondCheck.value == true
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.boxblueColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Assets',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                    Text(
                                      'P.Date',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                    Text(
                                      'Cost',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                    Text(
                                      'D/R         ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: AppColor.boxblueColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Item',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                    Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Urbanist',
                                          color: AppColor.blackColor),
                                    ),
                                  ],
                                ),
                              ),
                        financialProjectionController.firstCheck.value == false
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: financialProjectionController
                                            .items.length,
                                        itemBuilder: (context, index) {
                                          String itemName =
                                              financialProjectionController
                                                  .items.keys
                                                  .elementAt(index);
                                          String itemPrice =
                                              financialProjectionController
                                                  .items[itemName]!;
                                          return Container(
                                            padding: EdgeInsets.zero,
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  itemName,
                                                  style: TextStyle(
                                                      color:
                                                          AppColor.blackColor,
                                                      fontFamily: 'Urbanist',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\₹${itemPrice}",
                                                      // '₹2,000/month',
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        print('dailog open');
                                                        _showEditDialog(
                                                            itemName, 'Fixed');
                                                      },
                                                      child: Icon(
                                                        Icons.edit,
                                                        size: 22,
                                                        color: AppColor
                                                            .txtSecondaryColor,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        print('deleteItem');
                                                        financialProjectionController
                                                            .deleteItem(
                                                                itemName);
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: 25,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                    financialProjectionController.items.isEmpty
                                        ? SizedBox(
                                            height: 5,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    financialProjectionController.items.isEmpty
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Rent',
                                                style: TextStyle(
                                                    color: AppColor.blackColor,
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹2,000/month',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    size: 25,
                                                    color: AppColor
                                                        .txtSecondaryColor,
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : Text(''),
                                    financialProjectionController.items.isEmpty
                                        ? SizedBox(
                                            height: 5,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    financialProjectionController.items.isEmpty
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Salaries',
                                                style: TextStyle(
                                                    color: AppColor.blackColor,
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹10,000/month',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    size: 25,
                                                    color: AppColor
                                                        .txtSecondaryColor,
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : Text(''),
                                    financialProjectionController.items.isEmpty
                                        ? SizedBox(
                                            height: 10,
                                          )
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    InkWell(
                                      onTap: () {
                                        financialProjectionController
                                            .addItems();
                                        print('txtformfield add');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ProjectImages.add,
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Add Item',
                                            style: TextStyle(
                                              color: AppColor.blackColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Urbanist',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    financialProjectionController
                                                .addItem.value ==
                                            true
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonTextField(
                                                ontap: () {},
                                                preShow: 'Not',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.40,
                                                lableText: 'Name',
                                                controllers:
                                                    financialProjectionController
                                                        .itemNameController,
                                                keyboardTypes:
                                                    TextInputType.name,
                                                prefixIcon: ProjectImages.mail,
                                              ),
                                              CommonTextField(
                                                onFieldSubmit: (value) {
                                                  financialProjectionController
                                                      .addItemAmount(
                                                          financialProjectionController
                                                              .itemNameController
                                                              .text,
                                                          value);
                                                  // financialProjectionController
                                                  //     .itemNameController
                                                  //     .clear();
                                                  // financialProjectionController
                                                  //     .itemPriceController.clear();

                                                  financialProjectionController
                                                      .addItems();
                                                },
                                                ontap: () {},
                                                preShow: 'Not',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.40,
                                                lableText: 'Amount',
                                                controllers:
                                                    financialProjectionController
                                                        .itemPriceController,
                                                keyboardTypes:
                                                    TextInputType.number,
                                                prefixIcon: ProjectImages.mail,
                                              ),
                                            ],
                                          )
                                        : Text(''),
                                  ],
                                ),
                              )
                            : financialProjectionController.secondCheck.value ==
                                    true
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                            itemCount:
                                                financialProjectionController
                                                    .fixedassetSchedule.length,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              String assetName =
                                                  financialProjectionController
                                                      .fixedassetSchedule.keys
                                                      .elementAt(index);
                                              Map<String, String> assetDetails =
                                                  financialProjectionController
                                                          .fixedassetSchedule[
                                                      assetName]!;
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      assetName,
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      assetDetails['P.Date']!,
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "₹${assetDetails['Cost']!}",
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "${assetDetails['DR']!}%",
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    Icon(
                                                      Icons.more_vert,
                                                      size: 20,
                                                      color: AppColor
                                                          .txtSecondaryColor,
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                        financialProjectionController
                                                .fixedassetSchedule.isEmpty
                                            ? SizedBox(
                                                height: 5,
                                              )
                                            : SizedBox(),
                                        financialProjectionController
                                                .fixedassetSchedule.isEmpty
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Equipment',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '01-01-2024',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '₹50,000',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '10%',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    size: 20,
                                                    color: AppColor
                                                        .txtSecondaryColor,
                                                  )
                                                ],
                                              )
                                            : Text(''),
                                        financialProjectionController
                                                .fixedassetSchedule.isEmpty
                                            ? SizedBox(
                                                height: 5,
                                              )
                                            : SizedBox(),
                                        financialProjectionController
                                                .fixedassetSchedule.isEmpty
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Vehicle      ',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '01-02-2024',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '₹20,000',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '15%',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    size: 20,
                                                    color: AppColor
                                                        .txtSecondaryColor,
                                                  )
                                                ],
                                              )
                                            : Text(''),
                                        financialProjectionController
                                                .fixedassetSchedule.isEmpty
                                            ? SizedBox(
                                                height: 10,
                                              )
                                            : SizedBox(),
                                        InkWell(
                                          onTap: () {
                                            print('FixedAssetSchedule');
                                            financialProjectionController
                                                .addItems();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ProjectImages.add,
                                                height: 25,
                                                width: 25,
                                                fit: BoxFit.fill,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                'Add Item',
                                                style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'Urbanist',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        financialProjectionController
                                                    .addItem.value ==
                                                true
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CommonTextField(
                                                        ontap: () {},
                                                        preShow: 'Not',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                        lableText: 'Assets',
                                                        controllers:
                                                            financialProjectionController
                                                                .assetsNameController,
                                                        keyboardTypes:
                                                            TextInputType.name,
                                                        prefixIcon:
                                                            ProjectImages.mail,
                                                      ),
                                                      CommonTextField(
                                                        onFieldSubmit:
                                                            (value) {},
                                                        ontap: () {
                                                          financialProjectionController
                                                              .FixedAssestcalendarOpen(
                                                                  context);
                                                        },
                                                        preShow: 'Not',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                        lableText:
                                                            'Select Date',
                                                        controllers:
                                                            financialProjectionController
                                                                .assetDateController,
                                                        keyboardTypes:
                                                            TextInputType
                                                                .number,
                                                        prefixIcon:
                                                            ProjectImages.mail,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CommonTextField(
                                                        ontap: () {},
                                                        preShow: 'Not',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                        lableText: 'Cost',
                                                        controllers:
                                                            financialProjectionController
                                                                .assetsCostController,
                                                        keyboardTypes:
                                                            TextInputType.name,
                                                        prefixIcon:
                                                            ProjectImages.mail,
                                                      ),
                                                      CommonTextField(
                                                        onFieldSubmit: (value) {
                                                          financialProjectionController
                                                              .fixedAssetsItem(
                                                            financialProjectionController
                                                                .assetsNameController
                                                                .text,
                                                            financialProjectionController
                                                                .assetDateController
                                                                .text,
                                                            financialProjectionController
                                                                .assetsCostController
                                                                .text,
                                                            financialProjectionController
                                                                .assetsdrController
                                                                .text,
                                                          );
                                                          financialProjectionController.assetsNameController.clear();
                                                          financialProjectionController.assetDateController.clear();
                                                          financialProjectionController.assetsCostController.clear();
                                                          financialProjectionController.assetsdrController.clear();

                                                          financialProjectionController
                                                              .addItems();
                                                        },
                                                        ontap: () {},
                                                        preShow: 'Not',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                        lableText: 'D/R',
                                                        controllers:
                                                            financialProjectionController
                                                                .assetsdrController,
                                                        keyboardTypes:
                                                            TextInputType
                                                                .number,
                                                        prefixIcon:
                                                            ProjectImages.mail,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Text(''),
                                      ],
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount:
                                                financialProjectionController
                                                    .variableCostItems.length,
                                            itemBuilder: (context, index) {
                                              String itemName =
                                                  financialProjectionController
                                                      .variableCostItems.keys
                                                      .elementAt(index);
                                              String itemPrice =
                                                  financialProjectionController
                                                          .variableCostItems[
                                                      itemName]!;
                                              return Container(
                                                padding: EdgeInsets.zero,
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      itemName,
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "\₹${itemPrice}",
                                                          // '₹2,000/month',
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .blackColor,
                                                              fontFamily:
                                                                  'Urbanist',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            print(
                                                                'dailog open ${itemName}');
                                                            _showEditDialog(
                                                                itemName,
                                                                'Variable');
                                                          },
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: 22,
                                                            color: AppColor
                                                                .txtSecondaryColor,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            print('deleteItem');
                                                            financialProjectionController
                                                                .deletevariableCostItems(
                                                                    itemName);
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: 25,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                        financialProjectionController
                                                .variableCostItems.isEmpty
                                            ? SizedBox(
                                                height: 5,
                                              )
                                            : SizedBox(
                                                height: 0,
                                              ),
                                        financialProjectionController
                                                .variableCostItems.isEmpty
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Materials',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '₹5,000/month',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .blackColor,
                                                            fontFamily:
                                                                'Urbanist',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                      Icon(
                                                        Icons.more_vert,
                                                        size: 25,
                                                        color: AppColor
                                                            .txtSecondaryColor,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Text(''),
                                        financialProjectionController
                                                .variableCostItems.isEmpty
                                            ? SizedBox(
                                                height: 5,
                                              )
                                            : SizedBox(
                                                height: 0,
                                              ),
                                        financialProjectionController
                                                .variableCostItems.isEmpty
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Utilities',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '4,000/month',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .blackColor,
                                                            fontFamily:
                                                                'Urbanist',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                      Icon(
                                                        Icons.more_vert,
                                                        size: 25,
                                                        color: AppColor
                                                            .txtSecondaryColor,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Text(''),
                                        financialProjectionController
                                                .variableCostItems.isEmpty
                                            ? SizedBox(
                                                height: 10,
                                              )
                                            : SizedBox(
                                                height: 0,
                                              ),
                                        InkWell(
                                          onTap: () {
                                            print('variableCost');
                                            financialProjectionController
                                                .addItems();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ProjectImages.add,
                                                height: 25,
                                                width: 25,
                                                fit: BoxFit.fill,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                'Add Item',
                                                style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontFamily: 'Urbanist',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        financialProjectionController
                                                    .addItem.value ==
                                                true
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonTextField(
                                                    ontap: () {},
                                                    preShow: 'Not',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                    lableText: 'Name',
                                                    controllers:
                                                        financialProjectionController
                                                            .variableCostNameController,
                                                    keyboardTypes:
                                                        TextInputType.name,
                                                    prefixIcon:
                                                        ProjectImages.mail,
                                                  ),
                                                  CommonTextField(
                                                    onFieldSubmit: (value) {
                                                      financialProjectionController
                                                          .addvariableCostItems(
                                                              financialProjectionController
                                                                  .variableCostNameController
                                                                  .text,
                                                              value);
                                                      financialProjectionController
                                                          .variableCostNameController
                                                          .clear();
                                                      financialProjectionController
                                                          .variableCostmPriceController
                                                          .clear();

                                                      financialProjectionController
                                                          .addItems();
                                                    },
                                                    ontap: () {},
                                                    preShow: 'Not',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                    lableText: 'Amount',
                                                    controllers:
                                                        financialProjectionController
                                                            .variableCostmPriceController,
                                                    keyboardTypes:
                                                        TextInputType.number,
                                                    prefixIcon:
                                                        ProjectImages.mail,
                                                  ),
                                                ],
                                              )
                                            : Text(''),
                                      ],
                                    ),
                                  ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonButton(
                              color: const Color(0xffd9d9d9),
                              ontap: () {
                                Get.back();
                              },
                              height: 45,
                              width: 150,
                              textcolor: AppColor.whiteColor,
                              text: 'Back',
                            ),
                            CommonButton(
                              color: AppColor.primaryColor,
                              ontap: () {
                                financialProjectionController.checkCondition();
                              },
                              height: 45,
                              width: 150,
                              textcolor: AppColor.whiteColor,
                              text: 'Next',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ProjectImages.checklist,
                              height: 25,
                              width: 25,
                            ),
                            Container(
                                height: 11,
                                width: 50,
                                child: Divider(
                                  color: AppColor.txtSecondaryColor,
                                  thickness: 1,
                                  height: 5,
                                )),
                            Image.asset(
                              ProjectImages.checklist,
                              height: 25,
                              width: 25,
                            ),
                            Container(
                                height: 11,
                                width: 50,
                                child: Divider(
                                  color: AppColor.txtSecondaryColor,
                                  thickness: 1,
                                  height: 5,
                                )),
                            Image.asset(
                              ProjectImages.checklist,
                              height: 25,
                              width: 25,
                            ),
                            Container(
                                height: 11,
                                width: 50,
                                child: Divider(
                                  color: AppColor.txtSecondaryColor,
                                  thickness: 1,
                                  height: 5,
                                )),
                            Image.asset(
                              ProjectImages.round,
                              height: 25,
                              width: 25,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Discounting Factor',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discounting Rates',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            CommonTextField(
                              preShow: 'Not',
                              width: 100,
                              lableText: '',
                              controllers:
                                  financialProjectionController.discountRate,
                              keyboardTypes: TextInputType.name,
                              prefixIcon: ProjectImages.mail,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Projection Calculation',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Urbanist'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Revenue Projection',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Growth Rate',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            CommonTextField(
                              preShow: 'Not',
                              width: 100,
                              lableText: '',
                              controllers:
                                  financialProjectionController.growthRate,
                              keyboardTypes: TextInputType.name,
                              prefixIcon: ProjectImages.mail,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 400, // Adjusted height
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height:
                                      200, // Adjusted height for PieChart container
                                  child: PieChart(
                                    PieChartData(
                                      sectionsSpace: 0,
                                      sections: [
                                        PieChartSectionData(
                                          color: Colors.green,
                                          value: 60,
                                          title: '60%',
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Urbanist'),
                                        ),
                                        PieChartSectionData(
                                          color: Colors.blue,
                                          value: 20,
                                          title: '20%',
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Urbanist'),
                                        ),
                                        PieChartSectionData(
                                          color: Colors.red,
                                          value: 20,
                                          title: '20%',
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Urbanist'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              CustomPaint(
                                painter: DottedLinePainter(
                                    const Offset(120, 120),
                                    const Offset(100, 80)),
                                child: Container(),
                              ),
                              Positioned(
                                top: 40,
                                left: 0,
                                child: buildIndicator(
                                    'Revenue Projection', 20, Colors.blue),
                              ),
                              CustomPaint(
                                painter: DottedLinePainter(
                                    const Offset(180, 290),
                                    const Offset(180, 350)),
                                child: Container(),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 100,
                                child: buildIndicator(
                                    'Cost Projection', 60, Colors.green),
                              ),
                              CustomPaint(
                                painter: DottedLinePainter(
                                    const Offset(230, 130),
                                    const Offset(290, 100)),
                                child: Container(),
                              ),
                              Positioned(
                                top: 60,
                                right: 0,
                                child: buildIndicator(
                                    'Asset Depreciation', 20, Colors.red),
                              ),
                            ],
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Container(
                        //     height: 200,
                        //     child:PieChart(
                        //       PieChartData(
                        //         sections: [
                        //           PieChartSectionData(
                        //             color: Colors.green,
                        //             value: 60,
                        //             title: '60%',
                        //             showTitle: true,
                        //             radius: 50,
                        //             titleStyle: TextStyle(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w500,
                        //               color: Colors.white,
                        //               fontFamily: 'Urbanist'
                        //             ),
                        //           ),
                        //           PieChartSectionData(
                        //             showTitle: true,
                        //             color: Colors.blue,
                        //             value: 20,
                        //             title: '20%',
                        //             radius: 50,
                        //             titleStyle:TextStyle(
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w500,
                        //                 color: Colors.white,
                        //                 fontFamily: 'Urbanist'
                        //             ),
                        //           ),
                        //           PieChartSectionData(
                        //             showTitle: true,
                        //             color: Colors.red,
                        //             value: 25,
                        //             title: '20%',
                        //             radius: 50,
                        //             titleStyle: TextStyle(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.w500,
                        //                 color: Colors.white,
                        //                 fontFamily: 'Urbanist'
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 15,),
                        // Indicator(color: Colors.green, text: '60% Cost Projection'),
                        // Indicator(color: Colors.blue, text: '20% Revenue Projection'),
                        // Indicator(color: Colors.red, text: '20% Asset Depreciation'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonButton(
                              color: const Color(0xffd9d9d9),
                              ontap: () {
                                Get.back();
                              },
                              height: 45,
                              width: 150,
                              textcolor: AppColor.whiteColor,
                              text: 'Back',
                            ),
                            CommonButton(
                              color: AppColor.primaryColor,
                              ontap: () {
                                // financialProjectionController.checkCondition();
                                // Get.offAllNamed(Routes.DASH_BOARD);
                                Get.offNamed(
                                    Routes.FINACIAL_PROJECTION_SUMMARY);
                              },
                              height: 45,
                              width: 150,
                              textcolor: AppColor.whiteColor,
                              text: 'Next',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          )),
    );
  }

  Widget buildIndicator(String title, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$percentage%',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
              fontFamily: 'Urbanist'),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist'),
        ),
      ],
    );
  }

  void _showEditDialog(String oldName, String whichCost) {
    print('whichCost ${whichCost}');
    print('oldName ${oldName}');
    print('oldName ${financialProjectionController.itemNameController.text}');
    print('oldName ${financialProjectionController.itemPriceController.text}');
    whichCost == 'Fixed'
        ? financialProjectionController.itemNameController.text
        : financialProjectionController.variableCostNameController.text =
            oldName;
    whichCost == 'Fixed'
        ? financialProjectionController.itemPriceController.text
        : financialProjectionController.variableCostmPriceController.text =
            whichCost == 'Fixed'
                ? financialProjectionController.items[oldName]!
                : financialProjectionController.variableCostItems[oldName]!;

    Get.defaultDialog(
      barrierDismissible: false,
      title: "Edit Item",
      titleStyle: TextStyle(
          color: AppColor.blackColor,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          fontSize: 22),
      content: Column(
        children: [
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Name',
            controllers: whichCost == 'Fixed'
                ? financialProjectionController.itemNameController
                : financialProjectionController.variableCostNameController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            onFieldSubmit: (value) {
              whichCost == 'Fixed'
                  ? financialProjectionController.addItemAmount(
                      financialProjectionController.itemNameController.text,
                      value)
                  : financialProjectionController.addvariableCostItems(
                      financialProjectionController.itemNameController.text,
                      value);

              whichCost == 'Fixed'
                  ? financialProjectionController.itemNameController.clear()
                  : financialProjectionController.variableCostNameController
                      .clear();
              whichCost == 'Fixed'
                  ? financialProjectionController.itemPriceController.clear()
                  : financialProjectionController.variableCostmPriceController
                      .clear();
            },
            ontap: () {},
            preShow: 'Not',
            lableText: 'Amount',
            controllers: whichCost == 'Fixed'
                ? financialProjectionController.itemPriceController
                : financialProjectionController.variableCostmPriceController,
            keyboardTypes: TextInputType.number,
            prefixIcon: ProjectImages.mail,
          ),
        ],
      ),
      confirmTextColor: Colors.white,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommonButton(
              color: const Color(0xffd9d9d9),
              ontap: () {
                whichCost == 'Fixed'
                    ? financialProjectionController.itemNameController.clear()
                    : financialProjectionController.variableCostNameController
                        .clear();
                whichCost == 'Fixed'
                    ? financialProjectionController.itemPriceController.clear()
                    : financialProjectionController.variableCostmPriceController
                        .clear();
                Get.back();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Cancel',
            ),
            CommonButton(
              color: AppColor.primaryColor,
              ontap: () {
                whichCost == 'Fixed'
                    ? financialProjectionController.editItem(
                        oldName,
                        financialProjectionController.itemNameController.text,
                        financialProjectionController.itemPriceController.text)
                    : financialProjectionController.editvariableCostItems(
                        oldName,
                        financialProjectionController
                            .variableCostNameController.text,
                        financialProjectionController
                            .variableCostmPriceController.text);
                whichCost == 'Fixed'
                    ? financialProjectionController.itemNameController.clear()
                    : financialProjectionController.variableCostNameController
                        .clear();
                whichCost == 'Fixed'
                    ? financialProjectionController.itemPriceController.clear()
                    : financialProjectionController.variableCostmPriceController
                        .clear();
                Get.back();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Save',
            ),
          ],
        )
      ],
      // cancelTextColor: AppColor.txtSecondaryColor,
      // textConfirm: "Save",
      // textCancel: "Cancel",
      // buttonColor: AppColor.primaryColor,
      // radius: 10,
      // onConfirm: () {
      //   financialProjectionController.editItem(oldName,
      //       financialProjectionController.itemNameController.text,
      //       financialProjectionController.itemPriceController.text);
      //   financialProjectionController.itemNameController.clear();
      //   financialProjectionController.itemPriceController.clear();
      //   Get.back();
      // },
      // onCancel: () {
      //   financialProjectionController.itemNameController.clear();
      //   financialProjectionController.itemPriceController.clear();
      // },
    );
  }

  void _showEditDialogFixedAsset(String oldName) {
    final asset = financialProjectionController.fixedassetSchedule[oldName];
    financialProjectionController.assetsNameController.text = oldName;
    financialProjectionController.assetDateController.text = asset?['P.Date'] ?? '';
    financialProjectionController.assetsCostController.text = asset?['Cost'] ?? '';
    financialProjectionController.assetsdrController.text = asset?['DR'] ?? '';

    Get.defaultDialog(
      barrierDismissible: false,
      title: "Edit Fixed Assest",
      titleStyle: TextStyle(
          color: AppColor.blackColor,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          fontSize: 22),
      content: Column(
        children: [
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Name',
            controllers: financialProjectionController.assetsNameController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Name',
            controllers: financialProjectionController.assetDateController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Name',
            controllers: financialProjectionController.assetsCostController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
          CommonTextField(
            ontap: () {},
            preShow: 'Not',
            lableText: 'Name',
            controllers: financialProjectionController.assetsdrController,
            keyboardTypes: TextInputType.name,
            prefixIcon: ProjectImages.mail,
          ),
        ],
      ),
      textConfirm: "Save",
      textCancel: "Cancel",
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommonButton(
              color: const Color(0xffd9d9d9),
              ontap: () {
                financialProjectionController.assetsNameController.clear();
                financialProjectionController.assetDateController.clear();
                financialProjectionController.assetsCostController.clear();
                financialProjectionController.assetsdrController.clear();
                Get.back();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Cancel',
            ),
            CommonButton(
              color: AppColor.primaryColor,
              ontap: () {
                financialProjectionController.editAsset(
                  oldName,
                  financialProjectionController.assetsNameController.text,
                  financialProjectionController.assetDateController.text,
                  financialProjectionController.assetsCostController.text,
                  financialProjectionController.assetsdrController.text,
                );
                financialProjectionController.assetsNameController.clear();
                financialProjectionController.assetDateController.clear();
                financialProjectionController.assetsCostController.clear();
                financialProjectionController.assetsdrController.clear();
                Get.back();
              },
              height: 35,
              width: 80,
              textcolor: AppColor.whiteColor,
              text: 'Save',
            ),
          ],
        )
      ],
    );
  }
}

// class Indicator extends StatelessWidget {
//   final Color color;
//   final String text;
//
//   Indicator({required this.color, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 20,
//           height: 20,
//           color: color,
//         ),
//         SizedBox(width: 8),
//         Text(text, style: TextStyle(fontSize: 16)),
//       ],
//     );
//   }
// }

class DottedLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;

  DottedLinePainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 5;
    double distance = (end - start).distance;
    double dx = end.dx - start.dx;
    double dy = end.dy - start.dy;
    double angle = atan2(dy, dx);
    double x = start.dx, y = start.dy;
    while (distance >= 0) {
      canvas.drawLine(
        Offset(x, y),
        Offset(x + cos(angle) * dashWidth, y + sin(angle) * dashWidth),
        paint,
      );
      x += cos(angle) * (dashWidth + dashSpace);
      y += sin(angle) * (dashWidth + dashSpace);
      distance -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

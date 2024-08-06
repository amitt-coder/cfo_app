import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../controller/top_debtors_creditors_controller.dart';

class TopDebtorsCreditorsView extends StatefulWidget {
  const TopDebtorsCreditorsView({super.key});

  @override
  State<TopDebtorsCreditorsView> createState() =>
      _TopDebtorsCreditorsViewState();
}

class _TopDebtorsCreditorsViewState extends State<TopDebtorsCreditorsView> {
  TopDebtorsCreditorsController topDebtorsCreditorsController =
      Get.put(TopDebtorsCreditorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Top 10 Debtors/Creditors',
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
              Obx(
                () => Row(
                  children: [
                    InkWell(
                      onTap: () => topDebtorsCreditorsController
                          .selectValue("Top 10 Debitors"),
                      child: Container(
                        width: 160,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: topDebtorsCreditorsController
                                            .selectedValue.value ==
                                        "Top 10 Debitors"
                                    ? AppColor.primaryColor
                                    : Colors.transparent,
                                width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top 10 Debitors",
                              style: TextStyle(
                                  color: topDebtorsCreditorsController
                                              .selectedValue.value ==
                                          "Top 10 Debitors"
                                      ? AppColor.blackColor
                                      : AppColor.fontColor,
                                  fontSize: 16,
                                  fontWeight: topDebtorsCreditorsController
                                              .selectedValue.value ==
                                          "Top 10 Debitors"
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            SvgPicture.asset(
                              ProjectImages.arrowtilleddown,
                              color: Colors.green,
                              // color: topDebtorsCreditorsController
                              //     .selectedValue.value ==
                              //     "Top 10 Debitors"
                              //     ? AppColor.whiteColor
                              //     : Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => topDebtorsCreditorsController
                          .selectValue("Top 10 Creditors"),
                      child: Container(
                        width: 160,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: topDebtorsCreditorsController
                                            .selectedValue.value ==
                                        "Top 10 Creditors"
                                    ? AppColor.primaryColor
                                    : Colors.transparent,
                                width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top 10 Creditors",
                              style: TextStyle(
                                  color: topDebtorsCreditorsController
                                              .selectedValue.value ==
                                          "Top 10 Creditors"
                                      ? AppColor.blackColor
                                      : AppColor.fontColor,
                                  fontSize: 16,
                                  fontWeight: topDebtorsCreditorsController
                                              .selectedValue.value ==
                                          "Top 10 Creditors"
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontFamily: 'Urbanist'),
                            ),
                            SvgPicture.asset(
                              ProjectImages.arrowtilledup,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Obx(
              //   () => Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () =>
              //             topDebtorsCreditorsController.selectmonth("Weekly"),
              //         child: Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              //           decoration: BoxDecoration(
              //               color: topDebtorsCreditorsController
              //                           .selectPrice.value ==
              //                       "Weekly"
              //                   ? AppColor.primaryColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(5),
              //               border: Border.all(
              //                   color: topDebtorsCreditorsController
              //                               .selectPrice.value ==
              //                           "Weekly"
              //                       ? Colors.transparent
              //                       : AppColor.txtSecondaryColor,
              //                   width: 1)),
              //           child: Text(
              //             "Weekly",
              //             style: TextStyle(
              //                 color: topDebtorsCreditorsController
              //                             .selectPrice.value ==
              //                         "Weekly"
              //                     ? AppColor.whiteColor
              //                     : AppColor.txtSecondaryColor,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w500,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () =>
              //             topDebtorsCreditorsController.selectmonth("Quartely"),
              //         child: Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              //           decoration: BoxDecoration(
              //               color: topDebtorsCreditorsController
              //                           .selectPrice.value ==
              //                       "Quartely"
              //                   ? AppColor.primaryColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(5),
              //               border: Border.all(
              //                   color: topDebtorsCreditorsController
              //                               .selectPrice.value ==
              //                           "Quartely"
              //                       ? Colors.transparent
              //                       : AppColor.txtSecondaryColor,
              //                   width: 1)),
              //           child: Text(
              //             "Quartely",
              //             style: TextStyle(
              //                 color: topDebtorsCreditorsController
              //                             .selectPrice.value ==
              //                         "Quartely"
              //                     ? AppColor.whiteColor
              //                     : AppColor.txtSecondaryColor,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w500,
              //                 fontFamily: 'Urbanist'),
              //           ),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () =>
              //             topDebtorsCreditorsController.selectmonth("Custom"),
              //         child: Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              //           decoration: BoxDecoration(
              //               color: topDebtorsCreditorsController
              //                           .selectPrice.value ==
              //                       "Custom"
              //                   ? AppColor.primaryColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(5),
              //               border: Border.all(
              //                   color: topDebtorsCreditorsController
              //                               .selectPrice.value ==
              //                           "Custom"
              //                       ? Colors.transparent
              //                       : AppColor.txtSecondaryColor,
              //                   width: 1)),
              //           child: Row(
              //             children: [
              //               Text(
              //                 "Custom",
              //                 style: TextStyle(
              //                     color: topDebtorsCreditorsController
              //                                 .selectPrice.value ==
              //                             "Custom"
              //                         ? AppColor.whiteColor
              //                         : AppColor.txtSecondaryColor,
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w500,
              //                     fontFamily: 'Urbanist'),
              //               ),
              //               Icon(
              //                 Icons.arrow_drop_down_sharp,
              //                 size: 25,
              //                 color: topDebtorsCreditorsController
              //                             .selectPrice.value ==
              //                         "Custom"
              //                     ? AppColor.whiteColor
              //                     : AppColor.txtSecondaryColor,
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),

              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   decoration: BoxDecoration(
              //       color: Color(0xFFE3F2FD),
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Name',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //       Text(
              //         'OSA Amount',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //       Text(
              //         'Due Date',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             fontFamily: 'Urbanist',
              //             color: AppColor.blackColor),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      'Weekly',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'Monthly',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'Quarterly',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: topDebtorsCreditorsController.ItemList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return
                            Container(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [

                                      Image.asset(topDebtorsCreditorsController.ItemList[index].image,
                                        height: 25,width: 25,
                                      ),
                                      Text(
                                          topDebtorsCreditorsController.ItemList[index].Name,
                                        style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                       Text(
                                          topDebtorsCreditorsController.ItemList[index].weekly,
                                        style: const TextStyle(
                                            color: Color(0xFF43A047),
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                       Text(
                                           topDebtorsCreditorsController.ItemList[index].monthly,
                                        style: const TextStyle(
                                            color: Color(0xFF43A047),
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                       Text(
                                           topDebtorsCreditorsController.ItemList[index].quarterly,
                                        style: const TextStyle(
                                            color: Color(0xFF43A047),
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
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
                          //   Container(
                          //   child: Column(
                          //     children: [
                          //       const SizedBox(
                          //         height: 5,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(
                          //             'Aadtiya Kolasa',
                          //             style: TextStyle(
                          //                 color: AppColor.blackColor,
                          //                 fontFamily: 'Urbanist',
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 15),
                          //           ),
                          //           const Text(
                          //             '₹15,000',
                          //             style: TextStyle(
                          //                 color: Color(0xFF43A047),
                          //                 fontFamily: 'Urbanist',
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 15),
                          //           ),
                          //           Text(
                          //             '01-01-2024',
                          //             style: TextStyle(
                          //                 color: AppColor.blackColor,
                          //                 fontFamily: 'Urbanist',
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 15),
                          //           ),
                          //         ],
                          //       ),
                          //       Divider(
                          //         color: AppColor.txtSecondaryColor,
                          //         thickness: 1,
                          //       )
                          //     ],
                          //   ),
                          // );
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: Color(0xFF7d8c9f),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Urbanist'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Summary and Analysis',
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        border: Border.all(
                            color: AppColor.primaryColor,
                            width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  'Total Receivables',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist'),
                                ),
                                const Text(
                                  '₹15,000',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Urbanist'),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: AppColor.txtSecondaryColor,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_upward_sharp,
                              size: 35,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Payables',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist'),
                                ),
                                const Text(
                                  '₹10,000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Urbanist'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Net Position:',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        Row(
                          children: [
                            Text(
                              '₹5,000',
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '25.2%',
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

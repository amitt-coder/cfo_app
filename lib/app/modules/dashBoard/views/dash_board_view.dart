import 'package:carousel_slider/carousel_slider.dart';
import 'package:cfo_app/app/modules/drawer/view/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../components/chart.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dash_board_controller.dart';

class DashBoardView extends GetView<DashBoardController> {
  DashBoardView({Key? key}) : super(key: key);
  DashBoardController dashBoardController = DashBoardController();
  @override
  Widget build(BuildContext context) {
    double maxSpeed = 100;
    double speed = 74;
    double angle;
    if (speed <= 100 || speed >= 90) {
      angle = ((speed) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 50) {
      angle = ((speed - 1) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 10) {
      angle = ((speed) / maxSpeed) * 1.5 * 3.141592653589793;
    } else if (speed == 0) {
      angle = ((speed - 10) / maxSpeed) * 1.5 * 3.141592653589793;
    } else {
      angle = ((speed - 2) / maxSpeed) * 1.5 * 3.141592653589793;
    }
    // double angle = ((100-2) / maxSpeed) * 1.5*3.141592653589793;
    return Scaffold(
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.80,
          child: const DrawerView(),
        ),
        appBar: CommonAppBar(
          title: 'CFO DASHBOARD',
          automaticallyImplyLeading: false,
          leading: Builder(
              builder: (context) => InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SvgPicture.asset(
                        ProjectImages.list,
                        height: 26,
                        width: 24,
                      ),
                    ),
                  )),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    child: SvgPicture.asset(
                      ProjectImages.notification,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Positioned(
                      top: -0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 11.5,
                        width: 11.5,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFF3737), shape: BoxShape.circle),
                        child: const Text(
                          '12',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 0.1,
                              color: Colors.white,
                              fontSize: 6,
                              fontWeight: FontWeight.w900),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
        body: Obx(() => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColor.backgroundColors,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider.builder(
                        itemCount: dashBoardController.banner.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                controller.banner[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enlargeFactor: 0.0,
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          height: 151,
                          enlargeCenterPage: true,
                          viewportFraction: 0.98,
                          onPageChanged: (index, reason) {
                            dashBoardController.activeSlide.value = index;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() => Center(
                            child: SmoothPageIndicator(
                              controller: PageController(
                                initialPage:
                                    dashBoardController.activeSlide.value,
                                // onAttach: (position) {
                                //   dashBoardController.activeSlide.value;
                                // },
                              ),
                              count: dashBoardController.banner.length,
                              effect: ExpandingDotsEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  dotColor: const Color(0xFF808D9E),
                                  activeDotColor: AppColor.primaryColor,
                                  strokeWidth: 24),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            ProjectImages.thunder,
                            height: 22,
                            width: 22,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Quick Access",
                            style: TextHeader,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.toNamed(Routes.AR_WITH_CREDIT_BALANCE);
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 15),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         boxShadow: const [
                      //           BoxShadow(
                      //               color: Colors.black12,
                      //               offset: Offset(5, 3),
                      //               blurRadius: 7)
                      //         ],
                      //         borderRadius: BorderRadius.circular(5)),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Text('AR Exception',
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //                 fontSize: 18,
                      //                 fontFamily: 'Urbanist',
                      //                 fontWeight: FontWeight.w500,
                      //                 color: AppColor.fontColor,
                      //                 letterSpacing: 0.1)),
                      //         SvgPicture.asset(
                      //           ProjectImages.ar,
                      //           height: 30,
                      //           width: 30,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.toNamed(Routes.ACCOUNT_PAYABLES);
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 15),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         boxShadow: const [
                      //           BoxShadow(
                      //               color: Colors.black12,
                      //               offset: Offset(5, 3),
                      //               blurRadius: 7)
                      //         ],
                      //         borderRadius: BorderRadius.circular(5)),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Text('AP Exception',
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //                 fontSize: 18,
                      //                 fontFamily: 'Urbanist',
                      //                 fontWeight: FontWeight.w500,
                      //                 color: AppColor.fontColor,
                      //                 letterSpacing: 0.1)),
                      //         SvgPicture.asset(
                      //           ProjectImages.ap,
                      //           height: 30,
                      //           width: 30,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),

                      ///
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dashBoardController.ItemList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 12,
                                // childAspectRatio: 0.9,
                                childAspectRatio: 0.7,
                                mainAxisSpacing: 0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // if (index == 1) {
                              //   Get.toNamed(Routes.ALL_CREDITOR);
                              // }
                              // if (index == 2) {
                              //   // Get.toNamed(Routes.ACCOUNT_PAYABLES);
                              // }
                              // if (index == 3) {
                              //   Get.toNamed(Routes.KEY_RATIO_ANALYSIS);
                              // }
                              // if (index == 4) {
                              //   Get.toNamed(Routes.AR_WITH_CREDIT_BALANCE);
                              // }
                              // if (index == 5) {
                              //   Get.toNamed(Routes.ACCOUNT_PAYABLES);
                              //   // Get.toNamed(Routes.TOP_DEBTORS_CREDITORS);
                              // }
                              if (index == 0) {
                                Get.toNamed(Routes.EXCEPTION_REPORT);
                              }
                              if (index == 1) {
                                Get.toNamed(Routes.FINACIAL_PROJECTION);
                              }
                              if (index == 2) {
                                Get.toNamed(Routes.CASH_FLOW);
                              }
                              if (index == 3) {
                                Get.toNamed(Routes.PURCHASE_ORDER);
                              }
                              if (index == 4) {
                                Get.toNamed(Routes.PURCHASE_ORDER_LIST);
                              }
                              if (index == 5) {
                                Get.toNamed(Routes.ACCOUNT_RECLASSIFICATION);
                              }
                              if (index == 6) {
                                Get.toNamed(Routes.VARIANCE_ANALYSIS);
                              }
                              if (index == 7) {
                                Get.toNamed(Routes.TDS_CHECK);
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    // margin: EdgeInsets.only(top: 2),
                                    padding: const EdgeInsets.all(15),
                                    child: SvgPicture.asset(
                                      dashBoardController.ItemList[index].image,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dashBoardController.ItemList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextSubHeader,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => dashBoardController
                                      .selectValue("Top 10 Debitors"),
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: dashBoardController
                                                    .selectedValue.value ==
                                                "Top 10 Debitors"
                                            ? AppColor.primaryColor
                                            : AppColor.whiteColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Top 10 Debitors",
                                          style: TextStyle(
                                              color: dashBoardController
                                                          .selectedValue
                                                          .value ==
                                                      "Top 10 Debitors"
                                                  ? AppColor.whiteColor
                                                  : AppColor.fontColor,
                                              fontSize: 16,
                                              fontWeight: dashBoardController
                                                          .selectedValue
                                                          .value ==
                                                      "Top 10 Debitors"
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              fontFamily: 'Urbanist'),
                                        ),
                                        SvgPicture.asset(
                                          ProjectImages.arrowtilleddown,
                                          color: dashBoardController
                                                      .selectedValue.value ==
                                                  "Top 10 Debitors"
                                              ? AppColor.whiteColor
                                              : Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => dashBoardController
                                      .selectValue("Top 10 Creditors"),
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: dashBoardController
                                                    .selectedValue.value ==
                                                "Top 10 Creditors"
                                            ? AppColor.primaryColor
                                            : AppColor.whiteColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Top 10 Creditors",
                                          style: TextStyle(
                                              color: dashBoardController
                                                          .selectedValue
                                                          .value ==
                                                      "Top 10 Creditors"
                                                  ? AppColor.whiteColor
                                                  : AppColor.fontColor,
                                              fontSize: 16,
                                              fontWeight: dashBoardController
                                                          .selectedValue
                                                          .value ==
                                                      "Top 10 Creditors"
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              fontFamily: 'Urbanist'),
                                        ),
                                        SvgPicture.asset(
                                          ProjectImages.arrowtilledup,
                                          color: dashBoardController
                                                      .selectedValue.value ==
                                                  "Top 10 Creditors"
                                              ? AppColor.whiteColor
                                              : Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.builder(
                              itemCount:
                                  dashBoardController.Debitors$credtors.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (index == 0)
                                        Image.asset(
                                          ProjectImages.a_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index == 1)
                                        Image.asset(
                                          ProjectImages.b_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index == 2)
                                        Image.asset(
                                          ProjectImages.c_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      if (index == 3)
                                        Image.asset(
                                          ProjectImages.a_category,
                                          height: 25,
                                          width: 25,
                                        ),
                                      Text(
                                        "${dashBoardController.Debitors$credtors[index]}",
                                        style: TextStyle(
                                            color: AppColor.fontColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Urbanist'),
                                      ),
                                      Text(
                                        "${dashBoardController.DebitorscredtorsAmount[index]}",
                                        style: const TextStyle(
                                            color: Color(0xFF48BD69),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Urbanist'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.TOP_DEBTORS_CREDITORS);
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
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Forecasted Cashflow", style: TextHeader),
                          const Text(
                            "View More",
                            style: TextStyle(
                                color: Color(0xFF1D1E25),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        decoration: const BoxDecoration(
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
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
                              const SizedBox(
                                height: 15,
                              ),
                              CashFlowChart(),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Cost Center Wise P & L",
                            style: TextHeader,
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "₹123,692",
                              style: TextStyle(
                                  color: Color(0xFF48BD69),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Urbanist'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF48BD69)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "CC001",
                                  style: TextStyle(
                                      color: AppColor.fontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFED2828)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "CC002",
                                  style: TextStyle(
                                      color: AppColor.fontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFED2828)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "CC003",
                                  style: TextStyle(
                                      color: AppColor.fontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist'),
                                ),
                              ],
                            ),
                            CashChartPL(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Summary",
                            style: TextHeader,
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dashBoardController.summary.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                                // height: 125,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.primaryColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dashBoardController.summary[index]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Urbanist'),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "₹17,123",
                                              style: TextStyle(
                                                  color: AppColor.whiteColor,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Urbanist'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: 74,
                                            width: 131,
                                            child: EbitdaGraph()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Change from last month",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Urbanist'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(ProjectImages.trendUp),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "25.2%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Urbanist'),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        },
                        shrinkWrap: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Daily Bill Outstanding",
                        style: TextHeader,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF1061FF)),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Paid",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFED2828)),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Unpaid",
                                    style: TextStyle(
                                        color: AppColor.fontColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 170,
                            width: 180,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: KdGaugeView(
                                minSpeed: 0,
                                maxSpeed: 100,
                                speed: speed,
                                speedTextStyle:
                                    const TextStyle(color: Colors.transparent),
                                minMaxTextStyle: const TextStyle(
                                  color: Colors.transparent,
                                ),
                                animate: true,
                                gaugeWidth: 11,
                                duration: const Duration(seconds: 3),
                                unitOfMeasurement: "",
                                subDivisionCircleColors: Colors.transparent,
                                activeGaugeColor: AppColor.primaryColor,
                                divisionCircleColors: Colors.transparent,
                                // innerCirclePadding: 20,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 140,
                                      margin: const EdgeInsets.all(5),
                                    ),
                                    Positioned(
                                      top: 18,
                                      right: 9,
                                      child: Transform.scale(
                                        scaleY: 1.09,
                                        child: SvgPicture.asset(
                                          height: 100,
                                          width: 100,
                                          ProjectImages
                                              .circle, // Replace with your pin image path
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                      right: 45,
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationZ(
                                            angle), // Rotate around the center
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent),
                                            ),
                                            Positioned(
                                              top: 25,
                                              right: 20,
                                              child: SvgPicture.asset(
                                                ProjectImages
                                                    .point, // Replace with your pointer image
                                                width: 10,
                                                height: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 40,
                                      child: Center(
                                        child: Text(
                                          "${speed.toStringAsFixed(0)}%",
                                          style: TextStyle(
                                              color: AppColor.fontColor,
                                              fontSize: 36,
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Urbanist'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // PointerRotationExample(),
                    ],
                  ),
                ),
              ),
            )));
  }
}

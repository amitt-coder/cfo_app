import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../controller/all_creditor_controller.dart';

class AllCreditorView extends StatefulWidget {
  String whichUser = '';
  AllCreditorView({this.whichUser = ''});

  @override
  State<AllCreditorView> createState() => _AllCreditorViewState();
}

class _AllCreditorViewState extends State<AllCreditorView> {
  AllCreditorController allCreditorController =
      Get.put(AllCreditorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          // title: 'All Debitors',
          title: allCreditorController.whichUser.value,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                ProjectImages.arrow_left,
                height: 26,
                width: 26,
              ),
            ),
          ),
        ),
        body:
            ///old code for all creditor screen
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   color: AppColor.backgroundColors,
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         Obx(() => Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 MaterialButton(
            //                   onPressed: () {
            //                     allCreditorController.toggleColor(1);
            //                   },
            //                   color: allCreditorController.buttonColor1.value,
            //                   elevation: 0,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(5),
            //                     side: BorderSide(
            //                         width: 1, color: AppColor.txtSecondaryColor),
            //                   ),
            //                   child: Text(
            //                     'Weekly',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontFamily: 'Urbanist',
            //                         fontWeight: FontWeight.w500,
            //                         color:
            //                             allCreditorController.buttonSelect.value == 1
            //                                 ? AppColor.whiteColor
            //                                 : AppColor.txtSecondaryColor),
            //                   ),
            //                 ),
            //                 MaterialButton(
            //                   onPressed: () {
            //                     allCreditorController.toggleColor(2);
            //                   },
            //                   color: allCreditorController.buttonColor2.value,
            //                   elevation: 0,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(5),
            //                     side: BorderSide(
            //                         width: 1, color: AppColor.txtSecondaryColor),
            //                   ),
            //                   child: Text(
            //                     'Quartely',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontFamily: 'Urbanist',
            //                         fontWeight: FontWeight.w500,
            //                         color:
            //                             allCreditorController.buttonSelect.value == 2
            //                                 ? AppColor.whiteColor
            //                                 : AppColor.txtSecondaryColor),
            //                   ),
            //                 ),
            //                 MaterialButton(
            //                   onPressed: () {
            //                     allCreditorController.toggleColor(3);
            //                   },
            //                   color: allCreditorController.buttonColor3.value,
            //                   elevation: 0,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(5),
            //                     side: BorderSide(
            //                         width: 1, color: AppColor.txtSecondaryColor),
            //                   ),
            //                   child: Row(
            //                     children: [
            //                       Text(
            //                         'Custom',
            //                         style: TextStyle(
            //                             fontSize: 14,
            //                             fontFamily: 'Urbanist',
            //                             fontWeight: FontWeight.w500,
            //                             color: allCreditorController
            //                                         .buttonSelect.value ==
            //                                     3
            //                                 ? AppColor.whiteColor
            //                                 : AppColor.txtSecondaryColor),
            //                       ),
            //                       Icon(
            //                         Icons.arrow_drop_down_sharp,
            //                         color:
            //                             allCreditorController.buttonSelect.value == 3
            //                                 ? AppColor.whiteColor
            //                                 : AppColor.txtSecondaryColor,
            //                         size: 30,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             )),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Image.asset(
            //                   ProjectImages.information_icon,
            //                   height: 24,
            //                   width: 24,
            //                 ),
            //                 const SizedBox(
            //                   width: 5,
            //                 ),
            //                 DropDownField(
            //                   selectValue: allCreditorController.showCategory.value,
            //                   hintName: 'show',
            //                   width: MediaQuery.of(context).size.width * 0.35,
            //                   height: 40,
            //                   selectPriceInstallment:
            //                       allCreditorController.showCategoryList,
            //                   controller: allCreditorController.categoryController,
            //                   showBorder: '1',
            //                 ),
            //               ],
            //             ),
            //             ///
            //             // Text('Cateogory A',
            //             // style: TextStyle(
            //             //   fontWeight: FontWeight.w500,
            //             //   fontSize: 15,
            //             //   fontFamily: 'Urbanist',
            //             //   color: AppColor.txtSecondaryColor
            //             // ),
            //             // ),
            //             // Icon(Icons.arrow_drop_down_sharp,
            //             // size: 30,
            //             //   color:AppColor.txtSecondaryColor
            //             // )
            //             CommonButton(
            //                 text: 'Download',
            //                 color: AppColor.primaryColor,
            //                 textcolor: Colors.white,
            //                 ontap: () {
            //                   allCreditorController.savePdfToSdCard(allCreditorController.whichUser.value);
            //                 },
            //                 height: 40,
            //                 width: 100)
            //           ],
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           padding:
            //               const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //           decoration: BoxDecoration(
            //               color: AppColor.boxblueColor,
            //               borderRadius: BorderRadius.circular(5)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Row(
            //                 children: [
            //                   Text(
            //                     'Cat.',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w600,
            //                         fontFamily: 'Urbanist',
            //                         color: AppColor.blackColor),
            //                   ),
            //                   const SizedBox(
            //                     width: 15,
            //                   ),
            //                   Text(
            //                     'Name',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w600,
            //                         fontFamily: 'Urbanist',
            //                         color: AppColor.blackColor),
            //                   ),
            //                 ],
            //               ),
            //               Row(
            //                 children: [
            //                   Text(
            //                     'OSA Amount',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w600,
            //                         fontFamily: 'Urbanist',
            //                         color: AppColor.blackColor),
            //                   ),
            //                   const SizedBox(
            //                     width: 20,
            //                   ),
            //                   Text(
            //                     'Due Date',
            //                     style: TextStyle(
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w600,
            //                         fontFamily: 'Urbanist',
            //                         color: AppColor.blackColor),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         ListView.builder(
            //             itemCount: 10,
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             padding: EdgeInsets.zero,
            //             itemBuilder: (context, index) {
            //               return Column(
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Row(
            //                         children: [
            //                           if (index == 0 ||
            //                               index == 3 ||
            //                               index == 6 ||
            //                               index == 9)
            //                             Image.asset(
            //                               ProjectImages.a_category,
            //                               height: 25,
            //                               width: 25,
            //                             ),
            //                           if (index == 1 || index == 4 || index == 7)
            //                             Image.asset(
            //                               ProjectImages.b_category,
            //                               height: 25,
            //                               width: 25,
            //                             ),
            //                           if (index == 2 || index == 5 || index == 8)
            //                             Image.asset(
            //                               ProjectImages.c_category,
            //                               height: 25,
            //                               width: 25,
            //                             ),
            //                           // Container(
            //                           //   height: 25,
            //                           //   width: 25,
            //                           //   decoration: const BoxDecoration(
            //                           //       shape: BoxShape.circle,
            //                           //       color: Color(0xffe1e9f8)
            //                           //   ),
            //                           // ),
            //                           const SizedBox(
            //                             width: 15,
            //                           ),
            //                           Text(
            //                             'Aadtiya Kolasa',
            //                             style: TextStyle(
            //                               color: AppColor.blackColor,
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.w500,
            //                               fontFamily: 'Urbanist',
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         children: [
            //                           const Text(
            //                             '₹1,500',
            //                             style: TextStyle(
            //                               color: Colors.red,
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.w500,
            //                               fontFamily: 'Urbanist',
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           Text(
            //                             '07/05/2024',
            //                             style: TextStyle(
            //                               color: AppColor.blackColor,
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.w500,
            //                               fontFamily: 'Urbanist',
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   Divider(
            //                     color: AppColor.txtSecondaryColor,
            //                     thickness: 1,
            //                   )
            //                 ],
            //               );
            //             }),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: AppColor.backgroundColors,
          child: Column(
            children: [
              // SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.boxblueColor, width: 1)),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  controller: allCreditorController.tabController,
                  unselectedLabelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 14),
                  labelStyle: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Tab(text:
                        allCreditorController.whichUser.value=='All Debitors'?
                        'Customer':'Vendor')),
                    Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        // decoration: Themes.tabDecoration,
                        child: Tab(
                          text:
                          allCreditorController.whichUser.value=='All Debitors'?
                          'Debtor':'Creditor',
                        )),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: allCreditorController.tabController,
                  children: allCreditorController.listingScreens,
                ),
              ),
            ],
          ),
        ));
  }
}

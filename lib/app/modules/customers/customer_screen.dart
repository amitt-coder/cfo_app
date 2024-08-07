import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/common_button.dart';
import '../../../utils/colors.dart';
import 'customer_controller.dart';

class CustomerScreen extends StatefulWidget {
  String whichUser;
  CustomerScreen({required this.whichUser});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {

  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.backgroundColors,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                CommonButton(
                    text: 'Download',
                    color: AppColor.primaryColor,
                    textcolor: Colors.white,
                    ontap: () {
                      customerController.savePdfToSdCard(widget.whichUser);
                    },
                    height: 40,
                    width: 100),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
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
                    'Cr.Bal',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: AppColor.blackColor),
                  ),
                  Text(
                    'L.T Date',
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
            Obx(() => Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: widget.whichUser == 'All Creditors'
                              ? customerController.ItemList2.length
                              : customerController.ItemList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      widget.whichUser == 'All Creditors'
                                          ? Image.asset(
                                              customerController
                                                  .ItemList2[index].image,
                                              height: 25,
                                              width: 25,
                                            )
                                          : Image.asset(
                                              customerController
                                                  .ItemList[index].image,
                                              height: 25,
                                              width: 25,
                                            ),

                                      widget.whichUser == 'All Creditors'
                                          ? Text(
                                              customerController
                                                  .ItemList2[index].Name,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )
                                          : Text(
                                              customerController
                                                  .ItemList[index].Name,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                      widget.whichUser == 'All Creditors'
                                          ? Text(
                                              customerController
                                                  .ItemList2[index].Db,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )
                                          : Text(
                                              customerController
                                                  .ItemList[index].Db,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                      widget.whichUser == 'All Creditors'
                                          ? Text(
                                              customerController
                                                  .ItemList2[index].LP,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )
                                          : Text(
                                              customerController
                                                  .ItemList[index].LP,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),

                                      widget.whichUser == 'All Creditors'
                                          ? Text(
                                              customerController
                                                  .ItemList2[index].CINFO,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )
                                          : Text(
                                              customerController
                                                  .ItemList[index].CINFO,
                                              style: TextStyle(
                                                  color: AppColor.blackColor,
                                                  fontFamily: 'Urbanist',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                    ],
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
                        height: 10,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

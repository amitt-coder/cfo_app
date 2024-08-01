import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../components/common_button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class AccountReclassificationView extends StatefulWidget {
  const AccountReclassificationView({super.key});

  @override
  State<AccountReclassificationView> createState() =>
      _AccountReclassificationViewState();
}

class _AccountReclassificationViewState
    extends State<AccountReclassificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        // title: 'Account Reclassification',
        title: 'Account Regrouping',
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.DASH_BOARD);
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
        decoration: BoxDecoration(
          color: AppColor.backgroundColors,
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: AppColor.txtSecondaryColor)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last 30 Days',
                          style: TextStyle(
                            color: AppColor.txtSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: AppColor.txtSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sofware',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: AppColor.txtSecondaryColor)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tally',
                          style: TextStyle(
                            color: AppColor.txtSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: AppColor.txtSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: 30,
                    child: TextFormField(
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
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E8CA0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.txtSecondaryColor, width: 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.txtSecondaryColor, width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: AppColor.txtSecondaryColor)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All Types',
                          style: TextStyle(
                            color: AppColor.txtSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                          color: AppColor.txtSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Account List',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(
                height: 15,
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
                      'Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      '           Current Cla',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                    Text(
                      'New Managem',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Urbanist',
                          color: AppColor.blackColor),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Account 1',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                'Expense',
                                style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                '[input Field]',
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
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Account Details',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(
                height: 10,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        Text(
                          'Account 1',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Current Clasification: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        Text(
                          'Expense',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Transaction History: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        Text(
                          '[View Transaction]',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Proposed New Classification: ',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        Text(
                          '[Input Field]',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1,
                                    color: AppColor.txtSecondaryColor)),
                            child: Center(
                              child: Text(
                                'Reclassify',
                                style: TextStyle(
                                  color: AppColor.txtSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1,
                                    color: AppColor.txtSecondaryColor)),
                            child: Center(
                              child: Text(
                                'Save Draft',
                                style: TextStyle(
                                  color: AppColor.txtSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                            ),
                          ),
                        ),
                        CommonButton(
                          color: Colors.red,
                          ontap: () {},
                          height: 40,
                          width: 80,
                          textcolor: AppColor.whiteColor,
                          text: 'Cancel',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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

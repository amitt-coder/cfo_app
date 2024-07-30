import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';
import '../controllers/account_verfiy_controller.dart';

class AccountVerfiyView extends GetView<AccountVerfiyController> {
  const AccountVerfiyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColor.primaryColor
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              SvgPicture.asset(ProjectImages.verify,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30,),
              Text("Account Verified",
                  textScaler: TextScaler.linear(1.0),
                  style:TextStyle(fontSize: 20,
                    fontFamily:'Urbanist' ,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w700,
                    color: AppColor.whiteColor,
                  )
              ),
              SizedBox(height: 8,),
              Text("Your account has been verified successfully,\nnow let’s enjoy CFO features!".tr,
                  textScaler: TextScaler.linear(1.0),
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 13.5,
                    fontFamily:'Urbanist' ,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                  )
              ),
              SizedBox(height: 40,),

            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
        child: Container(
          width: 388,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: FloatingActionButton.extended(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColor.whiteColor)
            ),
            onPressed: () {
               Get.offAllNamed(Routes.DASH_BOARD);
            },
            backgroundColor: AppColor.whiteColor, label: Text("Get Started",textScaler: TextScaler.linear(1.0),
              style:TextStyle(fontSize: 12.5,
                fontFamily:'Urbanist' ,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor,
              )
          ),
          ),
        ),
      ),
    );
  }
}

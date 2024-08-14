import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../components/common_app_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';
import '../../../routes/app_pages.dart';
import '../controller/exception_report_controller.dart';

class ExceptionReportView extends StatefulWidget {
  const ExceptionReportView({super.key});

  @override
  State<ExceptionReportView> createState() => _ExceptionReportViewState();
}

class _ExceptionReportViewState extends State<ExceptionReportView> {

  ExceptionReportController exceptionReportController = Get.put(ExceptionReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Exception Report',
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.backgroundColors,
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exceptionReportController.ItemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.99,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    if(index==0){
                      Get.toNamed(Routes.AR_WITH_CREDIT_BALANCE);
                    }
                    if(index == 1){
                      Get.toNamed(Routes.ACCOUNT_PAYABLES);
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
                            exceptionReportController.ItemList[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        exceptionReportController.ItemList[index].title,
                        textAlign: TextAlign.center,
                        style: TextSubHeader,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

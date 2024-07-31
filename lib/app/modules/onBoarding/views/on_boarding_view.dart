import 'package:cfo_app/app/modules/signIn/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  OnBoardingView({Key? key}) : super(key: key);
  OnBoardingController onBoardingController = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: onBoardingController.OnBoardingData.length,
            onPageChanged: onBoardingController.onPageChanged,
            itemBuilder: (BuildContext context, int index) {
              Map<String, String> page =
                  onBoardingController.OnBoardingData[index];
              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: index == 0
                            ? MediaQuery.of(context).size.height * 0.07
                            : MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        height: index == 0
                            ? MediaQuery.of(context).size.height * 0.55
                            : MediaQuery.of(context).size.height * 0.57,
                        alignment: Alignment.center,
                        color: AppColor.whiteColor,
                        child: SvgPicture.asset(
                          page['images']!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.38,
                          decoration:const BoxDecoration(
                            color: Color(0xFF1061FF),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(page['title']!,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.urbanist(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          page['description']!,
                                          style: GoogleFonts.urbanist(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              );
            },
          ),
          Positioned(
              left: 20,
              bottom: MediaQuery.of(context).size.height * 0.08,
              child: Obx(() => Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: PageController(
                                initialPage: controller.currentIndex.value,

                                // onAttach: (position) {
                                //   controller.currentIndex.value;
                                // },
                              ),
                              count: onBoardingController.OnBoardingData.length,
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                dotColor: AppColor.whiteColor.withOpacity(0.5),
                                activeDotColor: AppColor.whiteColor,
                              ),
                            ),
                          ]),
                    ],
                  ))),
          Positioned(
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.048,
            child: InkWell(
              onTap: () {
                Get.offAllNamed(Routes.SIGN_IN);
              },
              child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.whiteColor),
                  child:const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Color(0xFF1061FF),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

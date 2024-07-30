import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/common_app_bar.dart';
import '../../../../utils/images.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Notification',
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
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: AppColor.backgroundColors,
        child:Column(
          children: [
            ListView.builder(
              itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(ProjectImages.profile,
                        height: 40,width: 40,fit: BoxFit.fill,
                      ),
                       const  SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Notification 1',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),
                          ),
                          Text('Lorem Ipsum is simply dummy text',
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Urbanist'
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
            }),
          ],
        )
      ),
    );
  }
}

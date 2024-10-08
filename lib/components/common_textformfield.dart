import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class CommonTextField extends StatelessWidget {

  String lableText;
  TextEditingController controllers;
  String prefixIcon;
  TextInputType keyboardTypes;
  double? width;
  final preShow;
  final linesShow;
  Function()? ontap;
   Function(String)? onFieldSubmit;
  final String? Function(String?)? validator;
  final bool? enabled;

   CommonTextField({
     required this.lableText,
     required this.controllers,
     required this.keyboardTypes,
     required this.prefixIcon,
      this.width,
      this.preShow,
      this.ontap,
      this.linesShow,
      this.onFieldSubmit,
      this.validator,
      this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // decoration: BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(
      //             color: Color(0xFFE9ECF2),
      //             width: 1
      //         )
      //     )
      // ),
      child:TextFormField(
        enabled: enabled,
        onFieldSubmitted: onFieldSubmit,
        validator: validator,
        maxLines: linesShow,
        onTap:ontap,
        style:const  TextStyle(fontSize: 14,
          fontFamily:'Urbanist' ,
          fontWeight: FontWeight.w700,
          color: Color(0xFF191A26),
        ),
        textInputAction: TextInputAction.done,
        controller: controllers,
        keyboardType:keyboardTypes,
        cursorColor:const Color(0xFF242B42),
        cursorWidth: 1.5,
        decoration: InputDecoration(
          labelText:lableText,
          labelStyle: const TextStyle(fontSize: 14,
            fontFamily:'Urbanist' ,
            letterSpacing:0.5,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7E8CA0),
          ),
          floatingLabelStyle:const TextStyle(
            fontSize: 15,
            fontFamily:'Urbanist' ,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7E8CA0),
          ),
          hintStyle:const TextStyle(fontSize: 14,
            fontFamily:'Urbanist' ,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7E8CA0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon:preShow=='show'?
          Padding(
            padding: const  EdgeInsets.only(left: 10.0,right: 10),
            child: SvgPicture.asset(prefixIcon,
              height: 20,
              width: 20,
            ),
          ):
          SvgPicture.asset(prefixIcon,
            height: 5,
            width: 5,color: Colors.transparent,
          ),
          prefixIconConstraints: preShow=='show'?
          const BoxConstraints(maxHeight: 20,
          ):
          const BoxConstraints(),
          border: InputBorder.none,
          focusedErrorBorder:UnderlineInputBorder(
            borderSide:
            BorderSide(color: AppColor.txtSecondaryColor, width: 1),
          ),
          disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:AppColor.txtSecondaryColor,width: 1),
         ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
          ),
          errorBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color:AppColor.primaryColor,width: 1),
          ),
          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color:AppColor.txtSecondaryColor,width: 1),
          ),
        ),
      ),
    );
  }
}

import 'package:cfo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownField extends StatefulWidget {

  String selectValue;
  String hintName;
  List<String> selectPriceInstallment;
  double width;
  double height;
  String showBorder;
  dynamic controller;
  ValueChanged<String?>? onChanged;
  Function()? ontap;


  DropDownField({
    required this.selectValue,
    required this.hintName,
    required this.width,
    required this.height,
    required this.selectPriceInstallment,
    required this.controller,
    required this.showBorder,
     this.onChanged,
     this.ontap,
  });
  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.zero,
        onTap: widget.ontap,
        icon: Icon(Icons.arrow_drop_down_sharp,),
        iconSize: 20,
        iconEnabledColor: AppColor.blackColor,
        value: widget.selectValue,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: AppColor.blackColor,
            fontFamily: 'Urbanist'),
        items: widget.selectPriceInstallment.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColor.blackColor,
                  fontFamily: 'Urbanist'),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // setState(() {
          //   widget.controller.updateValue(newValue);
          // });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        decoration: InputDecoration(
          // filled: true,
          // fillColor: Colors.white,
          hintText: widget.hintName,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.blackColor,
              fontFamily: 'Urbanist'),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: widget.showBorder == '1'
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      BorderSide(color: AppColor.txtSecondaryColor, width: 1)),
          enabledBorder: widget.showBorder == '1'
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.txtSecondaryColor, width: 1)),
          focusedBorder: widget.showBorder == '1'
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.txtSecondaryColor, width: 1)),
          errorBorder: widget.showBorder == '1'
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.txtSecondaryColor, width: 1)),
          disabledBorder: widget.showBorder == '1'
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.txtSecondaryColor, width: 1)),
        ),
      ),
    );
  }
}

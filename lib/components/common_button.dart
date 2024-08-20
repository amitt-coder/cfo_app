import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  String text;
  Color color;
  Color textcolor;
  Function()? ontap;
  double height;
  double width;

  CommonButton({
    required this.text,
    required this.color,
    required this.textcolor,
    required this.ontap,
    required this.height,
    required this.width,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: color,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed:ontap,
        height: height,
        minWidth:width,
        child: Text(text,
            textScaler: TextScaler.linear(1.0),
            style:TextStyle(
              fontSize: 14,
              fontFamily:'Urbanist' ,
              fontWeight: FontWeight.w700,
              color: textcolor,
            )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Color bgColor = "#FFFFFF".toColor();
Color lighrtGrayColor = "#EFEFEF".toColor();
Color radiusColor = "#DDE0E0".toColor();
Color darkgray = "#707070".toColor();
Color pacificBlue = "#2FA2B9".toColor();
Color hintColor = "#565858".toColor();
Color borderColor = "#DFDFDF".toColor();
Color errorColor = "#FF6565".toColor();
Color shadowColor = "#24819498".toColor();
Color lightPacific = "#D8F0F4".toColor();
Color regularBlack = "#000000".toColor();
Color regularWhite = "#FFFFFF".toColor();
Color tabbarBackground = "#F6F6F6".toColor();
Color selectTabColor = "#819498".toColor();
Color dividerColor = "#F1F1F1".toColor();
Color buttonColor = "#023B47".toColor();
Color lightbuttonColor = "#45708D".toColor();
Color mediumGrayColor = "#9D9E97".toColor();
Color yellowColor = "#DEA92E".toColor();


lightGrayContainer({radius,color,widget,width}) {
  return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??16.h), color: color??lighrtGrayColor,),
      child:widget

  ).paddingSymmetric(horizontal: 20.h);
}


extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
  ));
}

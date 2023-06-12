import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'color_category.dart';
import 'constant.dart';

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    // ignore: deprecated_member_use
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight,List<FontFeature>? fontFeatures}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight,
    fontFeatures:  fontFeatures),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getButton(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.w500,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight??55.h,
      decoration: getButtonDecoration(
        buttonColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon)
              ? getSvgImage(image!, width: 24.h, height: 24.h)
              : getHorSpace(0),
          (isIcon) ? getHorSpace(12.h) : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

BoxDecoration getButtonDecoration(Color bgColor,
    {BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

Widget getDivider(
    {double dividerHeight = 0,
    Color setColor = Colors.grey,
    double endIndent = 0,
    double indent = 0,
    double thickness = 1}) {
  return Divider(
    height: dividerHeight.h,
    color: setColor,
    endIndent: endIndent.w,
    indent: indent.w,
    thickness: thickness,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget defaultTextField(
    BuildContext context, TextEditingController controller, String hint,
    {bool isPass = false,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool isEnable = true,
    bool isReadonly = false,
    bool prefix = false,
    String? prefixImage,
    bool suffix = false,
    String? suffixImage,
    ValueChanged<String>? onChanged,double? suffixwidth,double? suffixheight}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    enabled: isEnable,
    readOnly: isReadonly,
    validator: validator,
    obscureText: isPass,
    controller: controller,
    cursorColor: pacificBlue,
    onChanged: onChanged,
    style: TextStyle(
        color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(width: 1.h, color: borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(width: 1.h, color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(width: 1.h, color: pacificBlue)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(width: 1.h, color: errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(width: 1.h, color: errorColor)),
        errorStyle: TextStyle(
            color: errorColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
        prefixIcon: prefix
            ? getSvgImage(prefixImage!, width: 24.h, height: 24.h)
                .paddingSymmetric(horizontal: 16.h)
            : getHorSpace(16.h),
        suffixIcon: suffix
            ? getSvgImage(suffixImage!, width:suffixwidth?? 24.h, height: suffixheight??24.h)
                .paddingSymmetric(horizontal: 16.h)
            : getHorSpace(16.h),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 60.h),
        suffixIconConstraints: suffix
            ? BoxConstraints(maxHeight: 24.h, maxWidth: 60.h)
            : BoxConstraints(maxWidth: 0),
        filled: true,
        fillColor: "#F1F1F1".toColor()),
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}



Widget getAppBar(String title, GestureTapCallback? function) {
  return Row(
    children: [
      GestureDetector(
          onTap: function,
          child: getSvgImage("back.svg", width: 20.h, height: 20.h)),
      getHorSpace(12.h),
      getCustomFont(title, 20.sp, Colors.black, 1, fontWeight: FontWeight.w700,txtHeight: 1.5.h)
    ],
  );
}

Widget getHomeAppBar(String image,String title,{Widget? widget,Function? function,Function? suffixfunction,double? titlefontsize}){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          GestureDetector(onTap:(){
            function!();
  },child: getSvgImage(image)),
          getHorSpace(15.13.w),
          getCustomFont(title,titlefontsize?? 18.sp,  Colors.black, 1,fontWeight: FontWeight.w600)
        ],
      ),
      GestureDetector(
        onTap: (){
          suffixfunction!();
        },
        child: widget??Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset:Offset(-4, 5),
                  blurRadius: 11,
                  color: Color(0XFF819498).withOpacity(0.14)

              )
            ],
            color: Colors.white,
          ),
          child:widget

        ),
      )
    ],
  );
}

Widget getSearchField(String? text,
    {Function? function,
      Color? hinttextcolor,
      double? hinttextsize,
      FontWeight? fontweight,
      String? prefixiconimage,
      double? prefixiconimageheight,
      double? prefixiconimagewidth,
      double? suffixiconimageheight,
      double? suffixiconimagewidth,
      String? suffixiconimage,
      Function? suffixfunction}) {
  return TextFormField(
      onTap: () {
        function!();
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: pacificBlue, width: 1.w),
              borderRadius: BorderRadius.circular(16.h)),
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: const Color(0XFFDCDCDC), width: 1.w),
              borderRadius: BorderRadius.circular(16.h)),
          filled: true,
          fillColor: Color(0XFFF1F1F1),
          hintText: text,
          hintStyle: TextStyle(
              color: hinttextcolor ?? Color(0XFFA5A4AA),
              fontSize: hinttextsize ?? 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: fontweight ?? FontWeight.w400),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 16.h),
            child: SvgPicture.asset("${Constant.assetImagePath}${prefixiconimage}",height: 24.h,width: 24.w,),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              suffixfunction!();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 16.h),
              child: SizedBox(
                height: suffixiconimageheight ?? 24.h,
                width: suffixiconimagewidth ?? 24.w,
                child:SvgPicture.asset("${Constant.assetImagePath}${suffixiconimage}",height: 24.h,width: 24.w,)
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.h))));
}

Widget getDetailFacelity(String iconImage,String text,{double? containerHeight, double? containerWidth,bool superScript=false}){
  return  Container(
    height:containerHeight?? 40.h,
    width: containerWidth??61.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Color(0XFFFFFFFF),
        boxShadow: [
          BoxShadow(offset: Offset(-4, 5),
              color: Color(0XFF819498).withOpacity(0.14),
              blurRadius: 11)
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getSvgImage(iconImage,height: 14.67.h,width: 16.w),
       Row(
         children: [
           getCustomFont(text, 14.sp, regularBlack, 1,fontWeight: FontWeight.w400),
           superScript? getCustomFont("2", 14.sp, regularBlack, 1,fontWeight: FontWeight.w400,fontFeatures: [FontFeature.superscripts()]):SizedBox(),
         ],
       )
      ],
    ).paddingSymmetric(horizontal: 12.w),
  );
}

Widget getTabBar(TabController tabcontroller, PageController pagecontroller,
    List<Widget> tabs) {
  return Container(
    height: 60.h,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h), color: tabbarBackground),
    child: Padding(
      padding: EdgeInsets.only(left: 2.h, right: 2.h),
      child: TabBar(
        unselectedLabelColor:hintColor,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        labelStyle: TextStyle(
            color: Color(0XFF2FA2B9),
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            fontFamily: 'Gilroy'),
        labelColor: pacificBlue,
        unselectedLabelStyle: TextStyle(
            color: hintColor,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            fontFamily: 'Gilroy'),
        indicator: ShapeDecoration(
            color: regularWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.h),),
        shadows: [
          BoxShadow(offset: Offset(-4, 5),
          blurRadius: 11,
          color: selectTabColor.withOpacity(0.14))
        ]),
        controller: tabcontroller,
        tabs: tabs,
        onTap: (value) {
          pagecontroller.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    ),
  );
}

Widget getSendMessegeContainer(String messege,{double? height,double? width}){
  return  Align(
    alignment: Alignment.centerRight,
    child: Container(
      height: height??74.h,
      width: width??326.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.h),
            topRight: Radius.circular(16.h),
            bottomLeft: Radius.circular(16.h),
          ),
          color: lightPacific),
      child: Center(
          child: getMultilineCustomFont(
             messege,
              14.sp,
              regularBlack,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              txtHeight: 1.5.h))
          .paddingSymmetric(horizontal: 12.h),
    ),
  );
}

Widget getReciveMessege(String messege,{double? height,double? width}){
  return  Align(
    alignment: Alignment.centerLeft,
    child: Container(
      height:height?? 45.h,
      width: width??208.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: selectTabColor.withOpacity(0.14),
                offset: const Offset(-4, 5),
                blurRadius: 11),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
            bottomLeft: Radius.circular(16.h),
          ),
          color: regularWhite),
      child: Center(
        child: getMultilineCustomFont(
           messege,
            14.sp,
            regularBlack,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left,
            txtHeight: 1.5.h).paddingAll(12.h),
      ),
    ),
  );
}

Widget getSettingsOptionFormate(String icon,String name,Function function){
  return GestureDetector(
    onTap: (){
      function();
    },
    child: SizedBox(
      height: 44.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getSvgImage(icon,height: 44.h,width: 44.h),
              getHorSpace(12.w),
              getCustomFont(name, 16.sp, regularBlack, 1,fontWeight: FontWeight.w400,txtHeight: 1.5.h)
            ],
          ),
          getSvgImage("arrow_right.svg",height: 16.h,width: 16.h)
        ],
      ).paddingSymmetric(horizontal: 20.h),
    ),
  );
}

Widget getEditProfileOptionFormate({String? iconImage,String? hint,String? userdetail,TextEditingController? controller}) {
  return TextFormField(
controller: controller,
    initialValue: userdetail,
    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,color: regularBlack,height: 1.5.h),
    decoration: InputDecoration(
      filled: true,
      fillColor: dividerColor,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(16.h),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:pacificBlue)),
    ),
  );
}

Widget getRichtext(
    {Function? function,
      Color? firsttextcolor,
      Color? secondtextcolor,
      Color? thirdtextcolor,
      double? firsttextSize,
      double? secondtextSize,
      double? thirdtextSize,
      FontWeight? firstTextwidth,
      FontWeight? secondTextwidth,
      FontWeight?thirdTextwidth,
      String? firsttext, String? secondtext,String? thirdtext,}) {
  return Center(
    child: RichText(
        text: TextSpan(
            text: firsttext,
            style: TextStyle(
                color: firsttextcolor ??hintColor,
                fontSize: firsttextSize ?? 12.sp,
                fontFamily: 'Gilroy',
                fontWeight: firstTextwidth ?? FontWeight.w400,
                height: 1.5.h),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    function!();
                  },
                text: secondtext,
                style: TextStyle(
                    color: secondtextcolor ?? regularBlack,
                    fontSize: firsttextSize ?? 12.sp,
                    fontWeight: firstTextwidth ?? FontWeight.w400,
                    fontFamily: 'Gilroy',
                height: 1.5.h),

              ),
              TextSpan(
                text: thirdtext,
                style: TextStyle(
                    color: thirdtextcolor ?? hintColor,
                    fontSize: thirdtextSize ?? 12.sp,
                    fontWeight: thirdTextwidth ?? FontWeight.w400,
                    fontFamily: 'Gilroy',
                    height: 1.5.h),

              ),

            ])),
  );
}
Widget getNotificationDataFormat (String userimage,String userName,String time,{String? firstText,String? secondText, String? thirdText,}){
  return Container(height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.h),
          color: tabbarBackground),
      child: Row(
        children: [
          getAssetImage(userimage,height:60.h ,width: 60.h),
          getHorSpace(12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getMultilineCustomFont(userName,  14.sp, regularBlack,fontWeight: FontWeight.w600,txtHeight: 1.5.h),
                    getCustomFont(time, 12.sp, hintColor, 1,fontWeight: FontWeight.w400,txtHeight: 1.5.h)
                  ],
                ),
                getVerSpace(3.h),
                getRichtext(firsttext: firstText,secondtext: " ${secondText}",thirdtext: " ${thirdText}"),

              ],
            ),
          )
        ],
      ).paddingAll(20.h));
}

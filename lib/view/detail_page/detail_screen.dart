import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_collection/util/color_category.dart';
import 'package:furniture_collection/util/constant.dart';
import 'package:furniture_collection/util/constant_widget.dart';
import 'package:furniture_collection/view/home_screen/controller/home_screen_controller.dart';
import 'package:furniture_collection/view/home_screen/model/category_model.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../util/icons.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    PopulerItem item = homeScreenController.item!;
    return // Figma Flutter Generator DetailspageWidget - FRAME
        WillPopScope(
      onWillPop: () async {
        Constant.backToPrev(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => Stack(
            children: [
              ListView(
                children: [
                  Container(
                      width: double.infinity,
                      height: 447.h,
                      color: lighrtGrayColor,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: pageController,
                            onPageChanged: (value) {
                              homeScreenController.setCurrentPage(value);
                            },
                            itemCount: item.image!.length,
                            itemBuilder: (context, index) {
                              return getAssetImage(item.image![index]);
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:
                                    List.generate(item.image!.length, (index) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: 8.h,
                                    width: 8.h,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.h, vertical: 30.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.h),
                                        color: (index == controller.currentPage)
                                            ? buttonColor
                                            : buttonColor.withOpacity(0.3)),
                                  );
                                })),
                          )
                        ],
                      )),
                  getVerSpace(24.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont(item.name!, 26.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w500),
                              getCustomFont(item.subtitle!, 18.sp, darkgray, 1,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          getCustomFont(item.price!, 26.sp, buttonColor, 1,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      getVerSpace(24.h),
                      getCustomFont(S.of(context).color, 24.sp, regularBlack, 1,
                          fontWeight: FontWeight.w500),
                      getVerSpace(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              color_container(lightbuttonColor, 1),
                              getHorSpace(16.h),
                              color_container(mediumGrayColor, 2),
                              getHorSpace(16.h),
                              color_container(yellowColor, 3),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.removeQuentity();
                                },
                                child: Container(
                                  height: 34.h,
                                  width: 34.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lighrtGrayColor),
                                  child: getSvgImage(GetIcons.negationIcon)
                                      .paddingSymmetric(
                                          horizontal: 10.h, vertical: 16.h),
                                ),
                              ),
                              getHorSpace(12.h),
                              getCustomFont(controller.currentQty.toString(),
                                  20.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w400),
                              getHorSpace(12.h),
                              GestureDetector(
                                onTap: () {
                                  controller.addQuentity();
                                },
                                child: Container(
                                  height: 34.h,
                                  width: 34.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lighrtGrayColor),
                                  child: getSvgImage(GetIcons.addIcon)
                                      .paddingAll(5.h),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      getVerSpace(24.h),
                      getCustomFont(
                          S.of(context).productDescription, 24.sp, regularBlack, 1,
                          fontWeight: FontWeight.w500),
                      getVerSpace(16.h),
                      getMultilineCustomFont(item.discription!, 20.sp, darkgray,
                          fontWeight: FontWeight.w400, txtHeight: 1.5.h)
                    ],
                  ).paddingSymmetric(horizontal: 20.h),
                  getVerSpace(110.h),
                ],
              ),
              SafeArea(
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getAppBarButton(() {
                      Constant.backToPrev(context);
                    }, GetIcons.backArrowIcon),
                    getCustomFont("Details", 20.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getAppBarButton(() {
                      controller.setLikePosition(item);
                    }, item.like! ? GetIcons.likeIcon : GetIcons.unlikeIcon),
                  ],
                ).paddingSymmetric(horizontal: 20.h,vertical: 8.h),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
decoration: BoxDecoration(boxShadow: [
  BoxShadow(offset: Offset(0, 0),
  blurRadius: 11,
  color: regularBlack.withOpacity(0.08),
   )
],
  color: regularWhite,),

                  child: getButton(context, buttonColor, S.of(context).buyNow,
                      regularWhite, () {}, 18.sp,
                      weight: FontWeight.w500,
                      borderRadius: BorderRadius.circular(16.h))
                      .paddingSymmetric(horizontal: 20.h, vertical: 24.h),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget color_container(color, id) {
    return GestureDetector(
      onTap: () {
        homeScreenController.setColorId(id);
      },
      child: Container(
        height: 34.h,
        width: 34.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
                color: homeScreenController.colorId == id
                    ? regularBlack
                    : regularWhite)),
      ),
    );
  }

  Widget getAppBarButton(function, icon) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 64.h,
        width: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h), color: regularWhite),
        child: getSvgImage(icon)
            .paddingSymmetric(vertical: 20.h, horizontal: 13.h),
      ),
    );
  }
}

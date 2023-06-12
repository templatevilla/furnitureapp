import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_collection/util/constant.dart';
import 'package:furniture_collection/util/constant_widget.dart';
import 'package:furniture_collection/util/icons.dart';
import 'package:furniture_collection/view/home_screen/controller/home_screen_controller.dart';
import 'package:furniture_collection/view/home_screen/model_data/category_data.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/images.dart';
import 'model/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> getCategory = CategoryData.getCategoryData();
  List<PopulerItem> getPopulerData = CategoryData.getPopulerItemData();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getVerSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 86.h,
                width: 288.h,
                child: getMultilineCustomFont(
                    S.of(context).exploreFurnitureCollection,
                    34.sp,
                    regularBlack,
                    fontWeight: FontWeight.w500)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.h),
                color: lighrtGrayColor,
              ),
              child: getSvgImage(GetIcons.serchIcon)
                  .paddingSymmetric(vertical: 20.h, horizontal: 13.h),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.h),
        Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: lightGrayContainer(
                        width: double.infinity,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomFont(
                                S.of(context).off10, 28.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(4.h),
                            getCustomFont(S.of(context).untilNovember23, 18.sp,
                                darkgray, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(22.h),
                            getButton(context, bgColor, S.of(context).getNow,
                                regularWhite, () {}, 16.sp,
                                weight: FontWeight.w500,
                                buttonWidth: 109.h,
                                buttonHeight: 35.h,
                                borderRadius: BorderRadius.circular(16.h))
                          ],
                        ).paddingSymmetric(horizontal: 20.h, vertical: 16.h)),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: getAssetImage(GetImages.bannerChair,
                          height: 164.h, width: 290.h))
                ],
              ),
              getVerSpace(34.h),
              GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => Container(
                  height: 71.h,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: getCategory.length,
                    itemBuilder: (context, index) {
                      Category data = getCategory[index];
                      return GestureDetector(
                        onTap: () {
                          controller.setIndex(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    color: regularBlack.withOpacity(0.08))
                              ],
                              borderRadius: BorderRadius.circular(16.h),
                              color: controller.currentIndex == index
                                  ? buttonColor
                                  : regularWhite,
                              border: Border.all(color: radiusColor)),
                          child: index == 0
                              ? getCustomFont(
                                      S.of(context).all,
                                      16.sp,
                                      controller.currentIndex == index
                                          ? regularWhite
                                          : buttonColor,
                                      1,
                                      fontWeight: FontWeight.w500)
                                  .paddingSymmetric(
                                      horizontal: 20.h, vertical: 25.h)
                              : getSvgImage(controller.currentIndex == index
                                      ? data.selectedimage!
                                      : data.image!)
                                  .paddingSymmetric(
                                      horizontal: 18.h, vertical: 23.h),
                        ).paddingSymmetric(horizontal: 8.h),
                      );
                    },
                  ),
                ),
              ),
              getVerSpace(23.h),
              getCustomFont(S.of(context).popular, 24.sp, regularBlack, 1,
                      fontWeight: FontWeight.w500)
                  .paddingSymmetric(horizontal: 20.h),
              getVerSpace(16.h),
              GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => Container(
                    child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: getPopulerData.length,
                  itemBuilder: (BuildContext context, int index) {
                    PopulerItem data = getPopulerData[index];
                    return GestureDetector(
                      onTap: (){
                        controller.setCurrentData(data);
                        Constant.sendToNext(context, Routes.detailScreenRoute);
                      },
                      child:  Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              color: lighrtGrayColor,
                            ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  getAssetImage(data.image![0]),
                                  getCustomFont(data.name!, 16.sp, regularBlack, 1,fontWeight: FontWeight.w500),
                                  getVerSpace(4.h),
                                  getCustomFont(data.price!, 16.sp, darkgray, 1,fontWeight: FontWeight.w400)
                                ],
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setLikePosition(data);
                                      print("value is ==== ${data.like}");
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 40.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: regularWhite),
                                      child: getSvgImage(data.like!
                                          ? GetIcons.likeIcon
                                          : GetIcons.unlikeIcon)
                                          .paddingSymmetric(
                                          horizontal: 9.28.h, vertical: 10.25.h),
                                    ),
                                  )).paddingOnly(top: 8.h, right: 8.h),
                            ],
                          )),
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    return new StaggeredTile.count(2, index.isEven ? 3.2 : 2.72);
                  },
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                )

                    /* StaggeredGridView.countBuilder(

                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    primary: false,
                    shrinkWrap: true,
                    staggeredTileBuilder: (index) => index % 3 == 0.0
                        ? StaggeredTile.count(2, 3)
                        : StaggeredTile.count(1, 3),

                    // StaggeredTile.count(2, 1), // 2 blocks in width and 1 blocks in height
                    // StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 8, // vertical spacing between items
                    crossAxisSpacing: 16.h, // horizontal spacing between items
                    crossAxisCount: 3,

                    // no. of virtual columns in grid
                    itemCount: getPopulerData.length,
                    itemBuilder: (context, index) {
                      PopulerItem data = getPopulerData[index];
                      return  GetBuilder<HomeScreenController>(
                        init:HomeScreenController(),
                        builder: (controller) => Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                controller.setCurrentData(data);
                                Constant.sendToNext(context, Routes.detailScreenRoute);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.h),
                                      color: lighrtGrayColor
                                    ),
                                    child: getAssetImage(data.image![0])
                                  ),
                                  getVerSpace(8.h),
                                  getCustomFont(data.name!, 16.sp, regularBlack, 1,fontWeight: FontWeight.w500),
                                  getVerSpace(4.h),
                                  getCustomFont(data.price!, 16.sp, darkgray, 1,fontWeight: FontWeight.w400)
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap:(){
                                    controller.setLikePosition(data);
                                    print("value is ==== ${data.like}");
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 40.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: regularWhite
                                    ),
                                    child: getSvgImage(data.like!?GetIcons.likeIcon:GetIcons.unlikeIcon).paddingSymmetric(horizontal: 9.28.h,vertical: 10.25.h),
                                  ),
                                ).paddingOnly(top: 8.h,right: 8.h),
                              ),

                          ],
                        ),
                      );
                    },
                  ),*/

                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

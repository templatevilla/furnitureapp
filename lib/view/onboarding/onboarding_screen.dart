import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_collection/routes/app_routes.dart';
import 'package:furniture_collection/util/color_category.dart';
import 'package:furniture_collection/util/constant.dart';
import 'package:furniture_collection/util/constant_widget.dart';
import 'package:furniture_collection/util/icons.dart';
import 'package:furniture_collection/util/images.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../generated/l10n.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        Constant.assetImagePath + GetImages.onbordingImage),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    getSvgImage(GetIcons.dewishIcon),
                    getHorSpace(8.h),
                    getCustomFont(S.of(context).dewish, 18.sp, regularBlack, 1,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                getVerSpace(24.h),
                getMultilineCustomFont(
                    S.of(context).exploreWorldClassTopFurnitures, 40.sp, regularBlack,
                    fontWeight: FontWeight.w500),
                getVerSpace(16.h),
                getMultilineCustomFont(
                    S.of(context).loremIpsumHasBeenTheIndustrysStandardDummyTextEver,
                    17.sp,
                    darkgray,
                    fontWeight: FontWeight.w400),
                getVerSpace(40.h),
                getButton(context, buttonColor, S.of(context).getStarted, regularWhite,
                    () {

                  // Constant.sendToNext(context, Routes.homeScreenRoute);
                  Constant.sendToNext(context, Routes.homeMainScreenRoute);
                    }, 18.sp,
                    borderRadius: BorderRadius.circular(16.h)),
                getVerSpace(16.h)
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ),
      ),
      onWillPop: () async {
        Constant.backToFinish();
        return false;
      },
    );
  }
}

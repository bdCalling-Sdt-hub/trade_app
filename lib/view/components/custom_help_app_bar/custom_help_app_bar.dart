import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';


class CustomHelpAppBar extends StatelessWidget {
  const CustomHelpAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      color: AppColors.blue500,

      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          ///====================================Top Section================================
          SizedBox(
              height: 24.h,
            ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  context.pushNamed(RoutePath.homeScreen);
                },
                child: const CustomImage(
                    imageSrc: AppIcons.logo,
                    imageColor: Colors.white,
                    imageType: ImageType.svg),
              ),
              IconButton(
                icon: const CustomImage(imageSrc: AppIcons.arrowLeftAlt,imageColor: Colors.white,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

                 CustomText(
                  text: AppStrings.helpCenter.tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),

            ],
          ),
          // SizedBox(
          //   height: 30.h,
          // ),
          // ///======================How Can We Help YOu ============================
          //  CustomText(
          //   text: AppStrings.howCanWeHelpYou.tr,
          //   fontWeight: FontWeight.w600,
          //   fontSize: 20,
          //   color: AppColors.white,),
          // SizedBox(
          //   height: 16.h,
          // ),
          // ///====================================Search Section================================
          //
          // CustomTextField(
          //     fillColor: AppColors.white,
          //     onTap: () {
          //       // Get.toNamed(AppRoutes.searchScreen);
          //     },
          //     hintText: AppStrings.searchYourQuestionHere,
          //     isPrefixIcon: true,
          //   prefixIcon: const Icon(Icons.search,color: AppColors.gray700,),
          //    ),
        ],
      ),
    );
  }
}
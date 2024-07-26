import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class AccountInfoScreen extends StatelessWidget {
   AccountInfoScreen({super.key});


  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================accountInfo Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.accountInfo.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      profileController.selectImage();
                    },
                    child: profileController.image.isNotEmpty
                        ? Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(profileController.image.value),
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle),
                    )
                        : Stack(
                      children: [
                        CustomNetworkImage(
                          boxShape: BoxShape.circle,
                          imageUrl: AppConstants.userNtr,
                          height: 85.h,
                          width: 84.w,
                        ),
                         const Positioned(
                            right: 0,
                            bottom: 0,
                            child:
                            CustomImage(imageSrc: AppIcons.photoCamera))
                      ],
                    )),
              ),
              CustomText(
                text: AppStrings.general.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black500,
                bottom: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

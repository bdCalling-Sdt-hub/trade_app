import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PostEditScreen extends StatelessWidget {
  const PostEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 3),

      ///======================editAd appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.editAd.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///==========================Please Choose a Category=======
            CustomText(
              fontWeight: FontWeight.w500,
              color: AppColors.black500,
              fontSize: 18,
              text: AppStrings.pleaseChooseACategory.tr,
            ),
            SizedBox(height: 10.h),


          ],
        ),
      ),
    );
  }


}

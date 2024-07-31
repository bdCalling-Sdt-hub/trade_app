import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class PackageDetailsScreen extends StatelessWidget {
  PackageDetailsScreen({super.key});

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================ membershipPackages =======================>
      appBar: CustomAppBar(
        appBarContent: data["memberShip"],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: "1.",
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  right: 8.w,
                ),
                CustomText(
                  text: data["memberShip"],
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),

            ///<====================== package contain ============================>
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: data["color"],
              ),
              child: Column(
                children: [
                  CustomText(
                    text: data["packageName"],
                    color: AppColors.white50,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.h,
                  ),
                  CustomText(
                    text: "\$${data["price"]}",
                    color: AppColors.white50,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.h,
                    top: 16.h,
                    bottom: 16.h,
                  ),
                  CustomText(
                    text: data["limit"],
                    color: AppColors.white50,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            ///<====================== package points ============================>
            Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: data["points"],
                  fontWeight: FontWeight.w500,
                  fontSize: 16.h,
                )),

            SizedBox(
              height: 24.h,
            ),

            ///<====================== package benefits ============================>
            CustomText(
              text: "Gold Membership Benefits:",
              fontSize: 18.h,
              fontWeight: FontWeight.w500,
            ),
            Column(
              children: List.generate(4, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.checkCircle,
                        size: 24.h,
                      ),
                      CustomText(
                        text: "Can exchange products",
                        left: 8.w,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.h,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: CustomButton(
          onTap: () {
            Get.toNamed(AppRoutes.preApprovalQuestionScreen);
          },
          title: AppStrings.applyForMembership,
        ),
      ),
    );
  }
}

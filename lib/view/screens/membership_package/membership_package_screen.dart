import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class MembershipPackageScreen extends StatelessWidget {
    MembershipPackageScreen({super.key});

    List<Map<String,dynamic>> packageList=[
      {
        "packageName" : "Gold",
        "points" : "From 0-24,999 points",
        "memberShip" : "Gold Membership",
        "price" : "19.99",
        "limit" : "Per Months",
        "color" :const Color(0xffFAA316),
      },
      {
        "packageName" : "Platinum",
        "points" : "From 25,000-99,999 points",
        "memberShip" : "Platinum Membership",
        "price" : "25,000",
        "limit" : "Points need to auto upgrade",
        "color" : AppColors.gray800,
      },
      {
        "packageName" : "Diamond",
        "points" : "From 100,000+ points",
        "memberShip" : "Diamond Membership",
        "price" : "100,000",
        "limit" : "Points need to auto upgrade",
        "color" :AppColors.blue300,
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///============================ membershipPackages =======================>
      appBar: CustomAppBar(
        appBarContent: AppStrings.membershipPackages.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
        child: Column(
          children: List.generate(packageList.length, (index){
            var count=1 + index;
            var data=packageList[index];
            return Column(
              children: [
                Row(
                  children: [
                    CustomText(text: "${count.toString()}.",fontSize: 16.h,fontWeight: FontWeight.w500,right: 8.w,),
                    CustomText(text: packageList[index]["memberShip"],fontSize: 16.h,fontWeight: FontWeight.w500,),
                  ],
                ),
                SizedBox(height: 16.h,),
                ///<====================== package contain ============================>
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.packageDetailsScreen,arguments: data);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: packageList[index]["color"],
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text: packageList[index]["packageName"],
                          color: AppColors.white50,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.h,
                        ),
                        CustomText(
                          text: "\$${packageList[index]["price"]}",
                          color: AppColors.white50,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.h,
                          top: 8.h,
                          bottom: 8.h,
                        ),
                        CustomText(
                          text: packageList[index]["limit"],
                          color: AppColors.white50,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),

                CustomText(text: packageList[index]["points"],fontWeight: FontWeight.w500,fontSize: 16.h,),

                SizedBox(height: 24.h,),
              ],
            );
          }),
        ),
      ),
    );
  }
}

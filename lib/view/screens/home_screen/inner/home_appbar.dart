import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_images/app_images.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class HomeAppbar extends StatelessWidget {
    HomeAppbar({super.key, required this.coinAmount});
   final String coinAmount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///<========================== appbar ============================>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // CustomImage(imageSrc: AppImages.logo,imageType: ImageType.png,size: 105.h,),
            Image.asset(AppImages.logo,width: 125,height: 44,),

            ///<========================== coin & notification ============================>
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),
                  decoration: BoxDecoration(
                      color:AppColors.white500,
                      borderRadius: BorderRadius.circular(16.sp),
                      border: Border.all(width: 1,color: AppColors.gray300)
                  ),
                  child: Row(
                    children: [
                      ///<========================== coin number ======================>
                      CustomText(text: coinAmount,color: AppColors.black500,fontWeight: FontWeight.w600,right: 8.w,),
                      CustomImage(imageSrc: AppIcons.logo,size: 24.sp,)
                    ],
                  ),
                ),
                SizedBox(width: 8.w,),
                ///<========================== notification ============================>
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white500,
                        border: Border.all(width: 1,color: AppColors.gray300),
                        shape: BoxShape.circle
                    ),
                    child:const CustomImage(imageSrc: AppIcons.notifications,),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 16.h,),
        ///<========================== search ============================>
        CustomTextField(
          fieldBorderColor: AppColors.gray300,
          fillColor: AppColors.white200,
          onChanged: (val){},
          readOnly: true,
          hintText: AppStrings.search.tr,
          isPrefixIcon: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomImage(imageSrc: AppIcons.search,size: 24.sp,),
          ),
        )
      ],
    );
  }
}

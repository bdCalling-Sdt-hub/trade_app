import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class CustomMyProduct extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final String image;
  final String name;
  final String value;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback editOnTap;
  final bool isEdit;
  final bool isMargin;

  CustomMyProduct({
    super.key,
    required this.image,
    required this.name,
    this.backgroundColor = AppColors.white200,
    required this.onTap,
    required this.value,
    required this.editOnTap,
    this.isEdit = false,
    required this.isMargin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width *.4,
        margin: isMargin ? const EdgeInsets.all(10) : null,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
          border: Border.all(color: AppColors.gray300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: isEdit
                  ? IconButton(
                      onPressed: editOnTap,
                      icon: const CustomImage(imageSrc: AppIcons.borderColor),
                    )
                  : const SizedBox(),
            ),
            Align(
              alignment: Alignment.center,
              child: CustomNetworkImage(
                imageUrl: image,
                height: 106.h,
                width: 100.w,
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            SizedBox(height: 10.h),
            CustomText(
              textAlign: TextAlign.start,
              text: name,
              fontWeight: FontWeight.w500,
              fontSize: 14.h,
              color: AppColors.black500,
             // maxLines: 3,
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                CustomText(
                  text: AppStrings.value.tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.gray700,
                ),
                CustomText(
                  text: value,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.blue500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

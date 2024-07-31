import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/search_controller/search_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_filter/custom_filter.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchListController searchListController =
      Get.find<SearchListController>();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: 'Search'.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            ///===================Search Field=============
            Expanded(
              flex: 6,
              child: CustomTextField(
                hintText: AppStrings.whatAreYouLookingFor,
              ),
            ),
            SizedBox(width: 10.w),

            ///====================Dialog box ===========
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Get.dialog(
                    CustomFilter(
                      locationController: _locationController,
                    ),
                  );
                },

                ///===================Filter Icon===========
                child: CustomDetailContainer(
                  height: 65.h,
                  weight: 70.w,
                  color: AppColors.white200,
                  child: const CustomImage(imageSrc: AppIcons.filterList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_membership_details_card/custom_membership_details_card.dart';
import 'package:trade_app/view/components/custom_single_slider/custom_single_slider.dart';
import 'package:trade_app/view/components/custom_swap_points_row/custom_swap_points_row.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_user_tab_bar/custom_user_tab_bar.dart';

class MembershipDetailsScreen extends StatelessWidget {
  MembershipDetailsScreen({super.key});

  final MembershipController membershipController =
      Get.find<MembershipController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: 'Membership Details'.tr,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=====================Custom User Tab bar====================
              CustomUserTabBar(
                userList: membershipController.userList,
                selectedIndex: membershipController.selectedIndex,
                onTap: (index) =>
                    membershipController.selectedIndex.value = index,
              ),
              SizedBox(
                height: 15.h,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:                 membershipController.selectedIndex.value==0?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 ///========================Card this================
                 CustomMembershipDetailsCard(
                   userName: 'Mohammod Rakib',
                   points: 20000,
                   membershipLevel: AppStrings.gold.tr,
                   sliderWidget: membershipController.isLoader.value
                       ? const CustomLoader()
                       : CustomSingleSlider(
                     value:
                     membershipController.singleSliderValue.value,
                     onChanged: (newValue) {
                       membershipController.sliderValue.value = newValue;
                }, // Disable user interaction
                   ),
                   description:
                   'Keep earning points to unlock exclusive benefits and privileges.'
                       .tr,
                 ),
                    CustomText(
                      text: AppStrings.swapPointsHistory.tr,
                      color: AppColors.black500,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),

                    ///========================Swap Point History=====================
                    Column(
                      children: List.generate(4, (index) {
                        return const CustomSwapPointsRow(
                            earnedPointsText: 'Earned 25 swap points',
                            date: '12/03/24',
                            item1: 'Armani W233 Watch',
                            item2: 'OnePlus V2 Android TV');
                      }),
                    ),

                  ],
                ): membershipController.selectedIndex.value==1 ?
                const CustomDetailContainer(
                    height: 192,
                    color: AppColors.black500,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CustomImage(
                          imageSrc: AppIcons.lock,
                          size: 40,
                          imageColor: AppColors.white500,
                        ),
                        CustomText(
                          top: 20,
                          text: 'You are just 3,150 points away from upgrading to Platinum member status!',
                          color: AppColors.white50,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          maxLines: 2,
                        ),
                      ],
                    )):membershipController.selectedIndex.value==2?
                const CustomDetailContainer(
                    height: 192,
                    color: AppColors.black500,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CustomImage(
                          imageSrc: AppIcons.lock,
                          size: 40,
                          imageColor: AppColors.white500,
                        ),
                        CustomText(
                          top: 20,
                          text: 'You are just 3,150 points away from upgrading to Platinum member status!',
                          color: AppColors.white50,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          maxLines: 2,
                        ),
                      ],
                    )):const SizedBox() ,
              ),
            ],
          ),
        );
      }),
    );
  }
}

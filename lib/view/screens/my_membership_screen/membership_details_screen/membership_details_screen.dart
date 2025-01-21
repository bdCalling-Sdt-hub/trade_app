import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class MembershipDetailsScreen extends StatefulWidget {
  MembershipDetailsScreen({super.key, required this.name, required this.point, required this.userType});

  final String name;
  final String userType;
  final int point;

  @override
  State<MembershipDetailsScreen> createState() =>
      _MembershipDetailsScreenState();
}

class _MembershipDetailsScreenState extends State<MembershipDetailsScreen> {
  final MembershipController membershipController =
      Get.find<MembershipController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      membershipController.getMemberShipDetails(planType: widget.userType);
    });
    super.initState();
  }

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
                onTap: (index) {
                  membershipController.selectedIndex.value = index;
                  if (index == 0) {
                    membershipController.getMemberShipDetails(planType: "Gold");
                  } else if (index == 1) {
                    membershipController.getMemberShipDetails(
                        planType: "Platinum");
                  } else if (index == 2) {
                    membershipController.getMemberShipDetails(
                        planType: "Diamond");
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: membershipController.selectedIndex.value == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///========================Card this================
                          CustomMembershipDetailsCard(
                            userName: widget.name,
                            points: widget.point,
                            membershipLevel: AppStrings.gold.tr,
                            sliderWidget: membershipController.isLoader.value
                                ? const CustomLoader()
                                : Slider(
                              value: widget.point.toDouble(),
                              // onChanged: (double value){},
                              min: 0,
                              max: (membershipController
                                  .memberShipDetailsModel
                                  .value
                                  .data
                                  ?.pointRangeEnd ??
                                  24999)
                                  .toDouble(),
                              divisions: 1,
                              label: widget.point.toString(),
                              activeColor: Colors.blue,
                              inactiveColor: Colors.white, onChanged: (double value) {},
                            ),
                            // CustomSingleSlider(
                            //         max: (membershipController
                            //                     .memberShipDetailsModel
                            //                     .value
                            //                     .data
                            //                     ?.pointRangeEnd ??
                            //                 0)
                            //             .toDouble(),
                            //         min:1000,
                            //         // (membershipController
                            //         //             .memberShipDetailsModel
                            //         //             .value
                            //         //             .data
                            //         //             ?.pointRangeStart ??
                            //         //         0)
                            //         //     .toDouble(),
                            //         value: widget.point.toDouble(),
                            //         onChanged: (newValue) {
                            //           membershipController.sliderValue.value =
                            //               newValue;
                            //         }, // Disable user interaction
                            //       )
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
                          // membershipController.memberShipDetailsModel.value
                          //     .data?.result!.isEmpty
                          //     ? Center(child: CustomText(text: 'No Data Found',top: 100.h,))
                          //     :
                           Column(
                                  children: List.generate(
                                      membershipController
                                              .memberShipDetailsModel
                                              .value
                                              .data
                                              ?.result
                                              ?.length ??
                                          0, (index) {
                                    return CustomSwapPointsRow(
                                        earnedPointsText:
                                            'Earned ${membershipController.memberShipDetailsModel.value.data?.result?[index].myPoints ?? 0} swap points',
                                        date:DateFormat('yMMMd').format(membershipController
                                            .memberShipDetailsModel
                                            .value
                                            .data
                                            ?.result?[index].createdAt?.toLocal() ?? DateTime.now())

                                        ,
                                        item1: membershipController
                                                .memberShipDetailsModel
                                                .value
                                                .data
                                                ?.result?[index]
                                                .productFrom
                                                ?.title ??
                                            '',
                                        item2: membershipController
                                                .memberShipDetailsModel
                                                .value
                                                .data
                                                ?.result?[index]
                                                .productTo
                                                ?.title ??
                                            '');
                                  }),
                                ),
                        ],
                      )
                    : membershipController.selectedIndex.value == 1
                    ? (membershipController.memberShipDetailsModel.value.data?.userPoint ?? 0) >=
                    (membershipController.memberShipDetailsModel.value.data?.pointRangeStart?.toInt() ?? 0)
                            ? Column(
                                children: [
                                  CustomMembershipDetailsCard(
                                    userName: widget.name,
                                    points: membershipController
                                            .memberShipDetailsModel
                                            .value
                                            .data
                                            ?.userPoint ??
                                        0,
                                    membershipLevel: AppStrings.gold.tr,
                                    sliderWidget:
                                        membershipController.isLoader.value
                                            ? const CustomLoader()
                                            : CustomSingleSlider(
                                                max: (membershipController
                                                            .memberShipDetailsModel
                                                            .value
                                                            .data
                                                            ?.pointRangeEnd ??
                                                        0)
                                                    .toDouble(),
                                                min: (membershipController
                                                            .memberShipDetailsModel
                                                            .value
                                                            .data
                                                            ?.pointRangeStart ??
                                                        0)
                                                    .toDouble(),
                                                value: (membershipController
                                                            .memberShipDetailsModel
                                                            .value
                                                            .data
                                                            ?.userPoint ??
                                                        0)
                                                    .toDouble(),
                                                onChanged: (newValue) {
                                                  membershipController
                                                      .sliderValue
                                                      .value = newValue;
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
                                    children: List.generate(
                                        membershipController
                                                .memberShipDetailsModel
                                                .value
                                                .data
                                                ?.result
                                                ?.length ??
                                            0, (index) {
                                      return CustomSwapPointsRow(
                                          earnedPointsText:
                                              'Earned ${membershipController.memberShipDetailsModel.value.data?.result?[index].myPoints ?? 0} swap points',
                                          date: '12/03/24',
                                          item1: membershipController
                                                  .memberShipDetailsModel
                                                  .value
                                                  .data
                                                  ?.result?[index]
                                                  .productFrom
                                                  ?.title ??
                                              '',
                                          item2: membershipController
                                                  .memberShipDetailsModel
                                                  .value
                                                  .data
                                                  ?.result?[index]
                                                  .productTo
                                                  ?.title ??
                                              '');
                                    }),
                                  ),
                                ],
                              )
                            : CustomDetailContainer(
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
                                      text:
                                          'You are just 3,150 points away from upgrading to Platinum member status!',
                                      color: AppColors.white50,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      maxLines: 2,
                                    ),
                                  ],
                                ))
                        : membershipController.selectedIndex.value == 2
                            ? membershipController.memberShipDetailsModel.value
                                        .data!.userPoint! >=
                                    membershipController.memberShipDetailsModel
                                        .value.data!.pointRangeStart!
                                        .toInt()
                                ? Column(
                                    children: [
                                      CustomMembershipDetailsCard(
                                        userName: widget.name,
                                        points: membershipController
                                                .memberShipDetailsModel
                                                .value
                                                .data
                                                ?.userPoint ??
                                            0,
                                        membershipLevel: AppStrings.gold.tr,
                                        sliderWidget:
                                            membershipController.isLoader.value
                                                ? const CustomLoader()
                                                : CustomSingleSlider(
                                                    max: (membershipController
                                                                .memberShipDetailsModel
                                                                .value
                                                                .data
                                                                ?.pointRangeEnd ??
                                                            0)
                                                        .toDouble(),
                                                    min: (membershipController
                                                                .memberShipDetailsModel
                                                                .value
                                                                .data
                                                                ?.pointRangeStart ??
                                                            0)
                                                        .toDouble(),
                                                    value: (membershipController
                                                                .memberShipDetailsModel
                                                                .value
                                                                .data
                                                                ?.userPoint ??
                                                            0)
                                                        .toDouble(),
                                                    onChanged: (newValue) {
                                                      membershipController
                                                          .sliderValue
                                                          .value = newValue;
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
                                        children: List.generate(
                                            membershipController
                                                    .memberShipDetailsModel
                                                    .value
                                                    .data
                                                    ?.result
                                                    ?.length ??
                                                0, (index) {
                                          return CustomSwapPointsRow(
                                              earnedPointsText:
                                                  'Earned ${membershipController.memberShipDetailsModel.value.data?.result?[index].myPoints ?? 0} swap points',
                                              date: DateFormat().format(membershipController
                                                  .memberShipDetailsModel
                                                  .value
                                                  .data
                                                  ?.result?[index].createdAt ??DateTime.now()),
                                              item1: membershipController
                                                      .memberShipDetailsModel
                                                      .value
                                                      .data
                                                      ?.result?[index]
                                                      .productFrom
                                                      ?.title ??
                                                  '',
                                              item2: membershipController
                                                      .memberShipDetailsModel
                                                      .value
                                                      .data
                                                      ?.result?[index]
                                                      .productTo
                                                      ?.title ??
                                                  '');
                                        }),
                                      ),
                                    ],
                                  )
                                : const CustomDetailContainer(
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
                                          text:
                                              'You are just 3,150 points away from upgrading to Platinum member status!',
                                          color: AppColors.white50,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ))
                            : const SizedBox(),
              ),
            ],
          ),
        );
      }),
    );
  }
}

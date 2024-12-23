import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PointsEarnedScreen extends StatefulWidget {
   PointsEarnedScreen({super.key});

  @override
  State<PointsEarnedScreen> createState() => _PointsEarnedScreenState();
}

class _PointsEarnedScreenState extends State<PointsEarnedScreen> {
final MembershipController membershipController = Get.find<MembershipController>();
final ProfileController profileController = Get.find<ProfileController>();

@override
void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    membershipController.getPointsEarn(userId: profileController.profileModel.value.data?.result?.id ?? "",context: context);
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white50,
      ///========================NavBar ===========
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///========================Points Earn Appbar===========
      appBar: CustomAppBar(
        appBarContent: AppStrings.pointsEarn.tr,
      ),
      body: Obx(() {
        switch (membershipController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                membershipController.getPointsEarn(context:context,userId: profileController.profileModel.value.data?.result?.id ?? "");
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                membershipController.getPointsEarn(context:context,userId: profileController.profileModel.value.data?.result?.id ?? "");
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var data=membershipController.pointsEarnModel.value;
            return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///=======================Total points=============
                      CustomDetailContainer(
                          isBorder: true,
                          color: AppColors.white200,
                          child: Row(
                            children: [
                              CustomText(
                                text: AppStrings.totalPointsEarn.tr,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.black500,
                              ),
                              const Spacer(),
                              CustomText(
                                text: (data.data?.points ?? 0).toString(),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.blue500,
                              ),
                            ],
                          )),
                      CustomText(
                        text: '${AppStrings.pointsEarn}:'.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black500,
                        bottom: 10,
                      ),
                      Column(
                        children: List.generate(data.data!.details!.length, (index) {

                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.gray300),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: data.data?.details?[index].title ?? "",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.bySwapping,
                                      ),
                                      CustomText(
                                        text:DateFormat('yMMMd').format(data.data!.details![index].date!.toLocal()),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: AppColors.black500,
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: '${(data.data?.details?[index].point ?? 0).toString()} points',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.black500,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ));
        }
      }),
    );
  }
}

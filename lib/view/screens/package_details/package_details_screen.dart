import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class PackageDetailsScreen extends StatefulWidget {
  PackageDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  PackageController packageController = Get.find<PackageController>();

  @override
  void initState() {
    packageController.getPackageDetails(id: widget.id, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================ membershipPackages =======================>
      appBar: CustomAppBar(
        appBarContent:
            "${packageController.packageDetailsModel.value.data?.planName ?? ""} Membership",
      ),
      body: Obx(() {
        switch (packageController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                packageController.getPackageDetails(context: context, id: widget.id);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                packageController.getPackageDetails(context: context, id: widget.id);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // CustomText(
                      //   text: "1.",
                      //   fontSize: 16.h,
                      //   fontWeight: FontWeight.w500,
                      //   right: 8.w,
                      // ),
                      CustomText(
                        text:
                        "${packageController.packageDetailsModel.value.data?.planName ?? ""} Membership",
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
                      color: AppColors.blue500,
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                          "${packageController.packageDetailsModel.value.data?.planName ?? ""}",
                          color: AppColors.white50,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.h,
                        ),
                        CustomText(
                          text:
                          '\$${packageController.packageDetailsModel.value.data?.fee ?? ""}',
                          color: AppColors.white50,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.h,
                          top: 16.h,
                          bottom: 16.h,
                        ),
                        CustomText(
                          text: 'Per Month',
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
                        text:
                        'From ${packageController.packageDetailsModel.value.data?.pointRangeStart ?? ""}-${packageController.packageDetailsModel.value.data?.pointRangeEnd ?? ""} Points',
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 34.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImage(
                              imageSrc: AppIcons.checkCircle,
                              size: 24.h,
                            ),
                            CustomText(
                              text:
                              "${packageController.packageDetailsModel.value.data?.swapPoint ?? ""} points for each swap",
                              left: 8.w,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.h,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImage(
                              imageSrc: AppIcons.checkCircle,
                              size: 24.h,
                            ),
                            CustomText(
                              text:
                              "${packageController.packageDetailsModel.value.data?.positiveCommentPoint ?? ""} points for positive comments",
                              left: 8.w,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.h,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImage(
                              imageSrc: AppIcons.checkCircle,
                              size: 24.h,
                            ),
                            CustomText(
                              text: "Partner benefits",
                              left: 8.w,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.h,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
        }
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: CustomButton(
          onTap: () {
            context.pushNamed(RoutePath.preApprovalQuestionScreen);
          },
          title: AppStrings.applyForMembership,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class MembershipPackageScreen extends StatelessWidget {
  MembershipPackageScreen({super.key});
  PackageController packageController = Get.find<PackageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================ membershipPackages =======================>
      appBar: CustomAppBar(
        appBarContent: AppStrings.membershipPackages.tr,
      ),
      body: Obx(() {
        switch (packageController.packageLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                packageController.getPackage(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                packageController.getPackage(context: context);
              },
            );

          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );

          case Status.completed:
            var packageList =
                packageController.packageModel.value.data?.subscriptions;
            return packageList!.isEmpty? Center(
              child: CustomText(
                text: 'No Data Found',
                fontWeight: FontWeight.w500,
                top: 8.h,
                bottom: 8.h,
              ),
            ): SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                children: List.generate(packageList?.length ?? 0, (index) {
                  var count = 1 + index;
                  var data = packageList?[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "${count.toString()}.",
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                            right: 8.w,
                          ),
                          CustomText(
                            text: "${data?.planName ?? " "} Membership",
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      ///<====================== package contain ============================>
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutePath.packageDetailsScreen,
                              extra: data?.id ?? "");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 24.h, horizontal: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.blue,
                          ),
                          child: Column(
                            children: [
                              CustomText(
                                text: data?.planName ?? "",
                                color: AppColors.white50,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.h,
                              ),
                              CustomText(
                                text: "\$${data?.fee ?? ""}",
                                color: AppColors.white50,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.h,
                                top: 8.h,
                                bottom: 8.h,
                              ),
                              CustomText(
                                text: "Per Month",
                                color: AppColors.white50,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      CustomText(
                        text:
                            'From ${data?.pointRangeStart ?? ""}-${data?.pointRangeEnd ?? ""}',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.h,
                      ),

                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  );
                }),
              ),
            );
        }
      }),
    );
  }
}

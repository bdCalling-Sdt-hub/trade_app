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
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class Package extends StatelessWidget {
  Package({super.key});
  PackageController packageController = Get.find<PackageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          var packageList = packageController.packageModel.value.data?.subscriptions;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(packageList?.length ?? 0, (index) {
                return GestureDetector(
                  onTap: (){
                    context.pushNamed(RoutePath.packageDetailsScreen,extra: packageList?[index].id ?? "");
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: MediaQuery.of(context).size.width * .43,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.blue,
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text: packageList?[index].planName ?? "",
                          color: AppColors.white50,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: (packageList?[index].fee ?? 0).toString(),
                          color: AppColors.white50,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.h,
                          top: 4.h,
                          bottom: 4.h,
                        ),
                        CustomText(
                          maxLines: 2,
                          text: 'Per Month',
                          color: AppColors.white50,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.h,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
      }
    });
  }
}

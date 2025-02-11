import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class PopularCategory extends StatelessWidget {
    PopularCategory({super.key});
    HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.popularCategory.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(
            onTap: () {
              controller.getPopularCategory(context: context);
            },
          );
        case Status.error:
          return GeneralErrorScreen(
            onTap: () {
              controller.getPopularCategory(context: context);
            },
          );

        case Status.noDataFound:
          return Center(
            child: CustomText(text: AppStrings.noDataFound),
          );

        case Status.completed:

          return  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(controller.popularCategoryList.value.length, (index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(RoutePath.categoryScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16.w),
                    child: Column(
                      children: [
                        CustomNetworkImage(
                          imageUrl: '${ApiUrl.baseUrl}${controller.popularCategoryList.value[index].image ?? ''}',
                          height: 64.h,
                          width: 64.h,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        CustomText(
                          text: controller.popularCategoryList.value[index].name ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w,
                          top: 8.h,
                        )
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

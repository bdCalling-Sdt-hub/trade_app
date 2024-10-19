import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class JustForYou extends StatelessWidget {
    JustForYou({super.key});
    HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///============================  topProducts ===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.topProducts.tr,
      ),
      body:Obx(() {
        switch (controller.justForYouLoading.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getJustForYouProduct(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getJustForYouProduct(context: context);
              },
            );

          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );

          case Status.completed:

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 240
                  // Adjust the aspect ratio as needed
                ),
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomMyProduct(
                    isMargin: false,
                    isEdit: controller.isEdit,
                    image:
                    '${ApiUrl.baseUrl}${controller.justForYouList.value[index].images?[0]}',
                    name: controller.justForYouList.value[index].title ?? "",
                    onTap: () {
                      context.pushNamed(RoutePath.productDetailsScreen);
                    },
                    value:
                    '\$${controller.justForYouList.value[index].productValue ?? ""}',
                    editOnTap: () {},
                  );
                },
              ),
            );
        }
      })
    );
  }
}

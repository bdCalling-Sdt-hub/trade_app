import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/helper/const/const.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class BannerList extends StatelessWidget {
  BannerList({super.key});
    HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.banner.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(
            onTap: () {
              controller.getBanner(context: context);
            },
          );
        case Status.error:
          return GeneralErrorScreen(
            onTap: () {
              controller.getBanner(context: context);
            },
          );

        case Status.noDataFound:
          return Center(
            child: CustomText(text: AppStrings.noDataFound),
          );

        case Status.completed:

          return Column(
            children: [
              ///==============================Banner Image==========================>
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayCurve: Curves.ease,
                  pageSnapping: false,
                  //viewportFraction: 1,
                  onPageChanged: (int index, reason) {
                    controller.bannerIndex.value = index;

                    controller.pageController.value = PageController(
                        initialPage: controller.bannerIndex.value);
                  },
                ),
                items: controller.bannerList.value.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiUrl.baseUrl}${imagePath.image ?? ""}'),
                            )
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              ///============================ Smooth Indicator =============================>
              Align(
                alignment: Alignment.center,
                child: ConstValue.indicator(
                    controller: controller.pageController.value,
                    count: controller.bannerList.length),
              ),
            ],
          );
      }
    });
  }
}

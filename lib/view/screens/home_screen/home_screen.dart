import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/helper/const/const.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:trade_app/view/screens/home_screen/inner/home_appbar.dart';
import 'package:trade_app/view/screens/home_screen/inner/just_for_you.dart';
import 'package:trade_app/view/screens/home_screen/inner/package.dart';
import 'package:trade_app/view/screens/home_screen/inner/popular_category.dart';
import 'package:trade_app/view/screens/home_screen/inner/top_product.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find<HomeController>();
  PackageController packageController = Get.find<PackageController>();
  @override
  void initState() {
    SharePrefsHelper.getBool(AppConstants.isRememberMe);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NavBar(currentIndex: 0),
        backgroundColor: AppColors.white,
        body: Obx(() {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppbar(
                    onTap: () {
                      context.pushNamed(RoutePath.searchScreen);
                    },
                    coinAmount: '22,850'),

                SizedBox(height: 12.h,),
                ///==============================Banner Image==========================>
                CarouselSlider(
                  options: CarouselOptions(
                    height: 130.h,
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
                            borderRadius: BorderRadius.circular(8.sp),
                              image: DecorationImage(
                            image: NetworkImage(
                                '${ApiUrl.baseUrl}${imagePath.image ?? ""}',),
                                fit: BoxFit.cover
                          )),
                        );
                      },
                    );
                  }).toList(),
                ),

                SizedBox(height: 12.h,),
                ///============================ Smooth Indicator =============================>
                Align(
                  alignment: Alignment.center,
                  child: ConstValue.indicator(
                      controller: controller.pageController.value,
                      count: controller.bannerList.length),
                ),

                SizedBox(
                  height: 16.h,
                ),

                ///============================ popularCategory =============================>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.popularCategory.tr,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RoutePath.categoryScreen);
                      },
                      child: CustomText(
                        text: AppStrings.viewAll,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                PopularCategory(),

                SizedBox(
                  height: 16.h,
                ),

                ///============================ top product =============================>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.topProducts,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RoutePath.topProductsScreen);
                      },
                      child: CustomText(
                        text: AppStrings.viewAll,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),

                ///============================ top product =============================>
                TopProduct(),

                SizedBox(
                  height: 16.h,
                ),

                ///============================ membershipPackages =============================>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.membershipPackages,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RoutePath.membershipPackageScreen);
                      },
                      child: CustomText(
                        text: AppStrings.viewAll,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),

                ///============================ membershipPackages =============================>
                Package(),
                SizedBox(
                  height: 16.h,
                ),

                ///============================ just for you =============================>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.justForYou,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RoutePath.justForYou);
                      },
                      child: CustomText(
                        text: AppStrings.viewAll,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h,),

                ///============================ just for you =============================>
                JustForYou()
              ],
            ),
          );
        }));
  }
}

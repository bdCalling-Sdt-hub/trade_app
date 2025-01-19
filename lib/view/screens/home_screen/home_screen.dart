import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/general_controller/general_controller.dart';
import 'package:trade_app/global/push_notification.dart';
import 'package:trade_app/helper/const/const.dart';
import 'package:trade_app/helper/network_image/network_image.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:trade_app/view/screens/home_screen/inner/banner.dart';
import 'package:trade_app/view/screens/home_screen/inner/home_appbar.dart';
import 'package:trade_app/view/screens/home_screen/inner/just_for_you.dart';
import 'package:trade_app/view/screens/home_screen/inner/package.dart';
import 'package:trade_app/view/screens/home_screen/inner/popular_category.dart';
import 'package:trade_app/view/screens/home_screen/inner/top_product.dart';
import 'package:trade_app/view/screens/membership_package/package_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController controller = Get.find<HomeController>();
  final ProfileController profileController = Get.find<ProfileController>();


  GeneralController generalController =Get.find<GeneralController>();
  @override
  void initState() {
    PushNotificationHandle.firebaseInit();
    PushNotificationHandle.firebaseListenNotification(context: context);
    SharePrefsHelper.getBool(AppConstants.isRememberMe);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getProfile(context: context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: NavBar(currentIndex: 0),
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
                    coinAmount: (profileController.profileModel.value.data?.point ?? 0).toString()),

                SizedBox(height: 12.h,),
              /*  ///==============================Banner Image==========================>
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
                          ),
                          child: CustomNetworkImage(imageUrl: '${ApiUrl.baseUrl}${imagePath.image ?? ""}',),
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

                */
                BannerList(),

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
                JustForYou(),

                // generalController.youtubeController != null
                //     ? SizedBox(
                //   height: 100,
                //   child: YoutubePlayer(
                //     controller: generalController.youtubeController!,
                //     showVideoProgressIndicator: false,
                //
                //     bottomActions: [], // Hide all bottom actions
                //   ),
                // )
                //     : Center(
                //     child:
                //     SizedBox())
              ],
            ),
          );
        }));
  }
}

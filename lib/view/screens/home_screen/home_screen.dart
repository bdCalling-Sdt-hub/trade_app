import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/helper/const/const.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_images/app_images.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:trade_app/view/screens/home_screen/inner/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find<HomeController>();
  final List<String> bannerImage = [
    AppImages.slider,
    AppImages.slider,
    AppImages.slider,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(currentIndex: 0),
      backgroundColor: AppColors.white,
      body: Obx(() {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppbar(coinAmount: '22,850'),

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
                items: bannerImage.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: AssetImage(imagePath))),
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
                    count: bannerImage.length),
              ),

              SizedBox(
                height: 16.h,
              ),

              ///============================ popularCategory =============================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.popularCategory,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: CustomText(
                      text: AppStrings.viewAll,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index){
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right: 16.w),
                        child: Column(
                          children: [
                            CustomNetworkImage(imageUrl: AppImages.mobile, height: 64.h, width: 64.h,borderRadius: BorderRadius.circular(8.sp),),
                            CustomText(text: 'Mobile',fontWeight: FontWeight.w500,fontSize: 16.w,top: 8.h,)
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 16.h,),
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
                    onTap: (){},
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
            /*  Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                     mainAxisExtent:controller.isEdit? 240 : 190
                     // Adjust the aspect ratio as needed
                  ),
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomMyProduct(
                      isEdit: controller.isEdit,
                      image: AppConstants.electronics,
                      name: 'Samsung Galaxy s22'.tr,
                      onTap: () {
                        Get.toNamed(AppRoutes.myProductDetailsScreen);
                      },
                      value: '\$825+',
                      editOnTap: () {},
                    );
                  },
                ),
              )*/
              ///============================ top product =============================>
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: List.generate(4, (index){
                    return Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: CustomMyProduct(
                        isEdit: controller.isEdit,
                        image: AppConstants.electronics,
                        name: 'Samsung Galaxy s22'.tr,
                        onTap: () {
                          Get.toNamed(AppRoutes.myProductDetailsScreen);
                        },
                        value: '\$825+',
                        editOnTap: () {},
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

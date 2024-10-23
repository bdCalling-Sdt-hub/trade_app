import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/category_controller/category_controller.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_categories/custom_categories.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/home_screen/home_controller/home_controller.dart';

class SubCategoryScreen extends StatefulWidget {
  SubCategoryScreen({super.key, required this.cateName});
  final String cateName;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}
class _SubCategoryScreenState extends State<SubCategoryScreen> {

  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSubCategory(context: context,category: widget.cateName);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: widget.cateName,
      ),
      body: Obx(() {
        switch (controller.subCategory.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getSubCategory(context: context,category: widget.cateName);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getSubCategory(context: context,category: widget.cateName);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var subCategoryList = controller.subCategoryList.value;
            return subCategoryList.isEmpty ?  Center(
              child: CustomText(text: AppStrings.noDataFound),
            ): Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                        subCategoryList.length, (index) {
                      var data = subCategoryList[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            RoutePath.subCategoryProducts,
                            queryParameters: {
                              "catId": subCategoryList[index].id ?? "",
                              "subCatId": subCategoryList[index].category?.id ?? "",
                            },
                          );

                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: subCategoryList[index].name ?? "",
                                  color: AppColors.black500,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                                const Spacer(),
                                const CustomImage(imageSrc: AppIcons.chevronForward),
                              ],
                            ),
                            const Divider(
                              color: AppColors.black50,
                              thickness: 1,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}

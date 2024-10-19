import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_categories/custom_categories.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 3),

      ///======================Post appbar==============
      appBar: CustomAppBar(
        appBarContent: AppStrings.postAnAd.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///==========================Please Choose a Category=======
            CustomText(
              fontWeight: FontWeight.w500,
              color: AppColors.black500,
              fontSize: 18,
              text: AppStrings.pleaseChooseACategory.tr,
            ),
            SizedBox(height: 10.h),

            ///==========================GridView=======================
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10, // Adjust the item count as needed
                itemBuilder: (BuildContext context, int index) {
                  return CustomCategories(
                    image: AppConstants.electronics,
                    name: 'Electronics',
                    onTap: () {
                       context.pushNamed(RoutePath.postAddScreen);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}

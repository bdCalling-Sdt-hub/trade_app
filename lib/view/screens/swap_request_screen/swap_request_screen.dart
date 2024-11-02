import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_swap_requests/custom_swap_requests.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/swap_request_screen/inner/swap_another_request.dart';
import 'package:trade_app/view/screens/swap_request_screen/inner/swap_my_request.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class SwapRequestScreen extends StatelessWidget {
  SwapRequestScreen({super.key});
  SwapRequestController controller = Get.find<SwapRequestController>();
  List<Widget> userScreens = [SwapMyRequest(), SwapAnotherRequest()];
  List<String> swapList = [
    'my',
    'their'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================swapRequests Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.swapRequests.tr,
      ),

      body: Obx((){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  swapList.length,
                      (index) => GestureDetector(
                    onTap: () {
                      controller.selectedTabIndex.value = index;
                      controller.selectedTabIndex.refresh();
                      print(controller.selectedTabIndex);
                      // setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 8.h),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color:
                                  controller.selectedTabIndex.value == index
                                      ? AppColors.blue500
                                      : AppColors.black500,
                                  width: 2))),
                      child: CustomText(
                        text: swapList[index],
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: controller.selectedTabIndex.value == index
                            ? AppColors.blue500
                            : AppColors.black500,
                      ),
                    ),
                  ),
                ),
              ),

             SizedBox(height: 16.h,),

              Expanded(child: userScreens[controller.selectedTabIndex.value]),
            ],
          ),
        );
      })
    );
  }
}

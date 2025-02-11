import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_expended_section/custom_expended_section.dart';
import 'package:trade_app/view/components/custom_help_app_bar/custom_help_app_bar.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      body: Obx(() {
        switch (profileController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                profileController.getFaq(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                profileController.getFaq(context: context);              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var data= profileController.helpCenterModel.value;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///=======================Help Center Appbar=================
                  CustomHelpAppBar(scaffoldKey: scaffoldKey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///======================FrequentyAsk ============================
                        CustomText(
                          text: AppStrings.frequentlyAskedQuestions.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                        ),

                        ///======================Question Here=======================
                        Column(
                          children: List.generate(profileController.helpList.length, (index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                        CustomImage(
                                        imageSrc: AppIcons.help,
                                      ),
                                      SizedBox(width: 12.w,),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: CustomText(
                                                text: profileController.helpList[index]['ans'] ?? '',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.h,
                                                maxLines: 3,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  if (profileController.selectedFqw.value ==
                                                      index) {
                                                    profileController.selectedFqw.value =
                                                    100000;
                                                  } else {
                                                    profileController.selectedFqw.value =
                                                        index;
                                                  }

                                                  profileController.selectedFqw.refresh();
                                                },
                                                icon: profileController.selectedFqw.value ==
                                                    index
                                                    ? const Icon(
                                                    Icons.keyboard_arrow_down_rounded)
                                                    : const Icon(
                                                    Icons.keyboard_arrow_right_rounded)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  index == profileController.selectedFqw.value
                                      ? CustomExpandedSection(
                                      expand: index ==
                                          profileController.selectedFqw.value
                                          ? true
                                          : false,
                                      child: Container(
                                        padding: EdgeInsets.all(8.r),


                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.r),
                                            border: Border.all(
                                                color: AppColors.white800)),
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          text:  profileController.helpList[index]['que'] ?? '',
                                          fontSize: 14.h,
                                          maxLines: 6,
                                        ),
                                      ))
                                      : const SizedBox()
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
        }
      }),
    );
  }
}

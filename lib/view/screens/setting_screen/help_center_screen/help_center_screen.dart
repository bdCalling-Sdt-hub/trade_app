import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_help_app_bar/custom_help_app_bar.dart';
import 'package:trade_app/view/components/custom_help_card/custom_help_card.dart';
import 'package:trade_app/view/components/custom_help_question/custom_help_question.dart';
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

      body: SingleChildScrollView(
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
                  // ...profileController.faqs.map((faqs) => CustomFAQCard(
                  //       question: faqs,
                  //       onTap: () {
                  //         // Handle FAQ tap
                  //       },
                  //     )),
                  CustomHelpQuestion(faqList: profileController.faqList),
                  SizedBox(height: 20.h),

                  ///=========================Need More Help=================
                  CustomText(
                    text: AppStrings.needMoreHelp.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black500,
                  ),
                  SizedBox(height: 10.h),

                  ///======================Calling====================
                  CustomHelpCard(
                    contactText: 'Call Us (+1-212-456-7890)',
                    subText: 'Our help line service is active: 24/7',
                    onTap: () {
                      profileController.launchPhone('01731090564');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
